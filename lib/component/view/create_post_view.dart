import 'package:flutter/material.dart';
import 'package:universe/component/view/staff_dashboard_view.dart';
import 'package:universe/service/post_service.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  List<String> personalizedCheckbox = [
    "CCE",
    "CSE",
    "ECE",
    "CSBS",
    "MECH",
    "student",
    "staff"
  ];
  DateTime _selectedDate = DateTime.now();
  List<String> title = [
    "Hackathon",
    "Internship",
    "Contest",
    "Others"
  ];
  String selectedValue = "";
  Map<String, dynamic> finalReport = {};
  List<String> finalPersonalizedList = [];
  late List<bool> checkboxController;
  TextEditingController createPostController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkboxController = List.filled(personalizedCheckbox.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CREATE POST",
          style: TextStyle(fontFamily: "Raleway", fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: bodyPartForPost(),
      ),
    );
  }

  Widget bodyPartForPost() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select a Title:",
            style: TextStyle(
              fontFamily: "Raleway-SemiBold",
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: List.generate(title.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedValue = title[index];
                  });
                },
                child: Card(
                  color: selectedValue == title[index] ? const Color(0xFF031149) : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: selectedValue == title[index] ? const Color(0xFF031149) : Colors.grey,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title[index],
                          style: TextStyle(
                            fontFamily: "Raleway-SemiBold",
                            fontSize: 16,
                            color: selectedValue == title[index] ? Colors.white : Colors.black,
                          ),
                        ),
                        Radio(
                          value: title[index],
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                            print("Selected radio value: $selectedValue");
                          },
                          activeColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Create a post for a student",
                hintStyle: const TextStyle(
                  fontFamily: "Raleway-SemiBold",
                  fontSize: 16,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 10,
              controller: createPostController,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Insert a Link here",
                hintStyle: const TextStyle(
                  fontFamily: "Raleway-SemiBold",
                  fontSize: 16,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: linkController,
            ),
          ),
          Row(
            children: [
              const Text(
                "End date ",
                style: TextStyle(
                  fontFamily: "Raleway-SemiBold",
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _selectDate(context);
                  print(_selectedDate.toString());
                },
                child: Text(
                  "${_selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(
                    fontFamily: "Raleway-SemiBold",
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 15)),
          Center(
            child: MaterialButton(
              onPressed: () async {
                finalReport = {
                  "title": selectedValue,
                  "post": createPostController.text,
                };
                debugPrint("$finalReport");
                bool decider = await addPost(selectedValue, linkController, createPostController,_selectedDate.toString());
                if (decider) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StaffDashboardView()));
                } else {
                  print("Failed to post");
                }
              },
              child: const Text(
                "Publish",
                style: TextStyle(
                  fontFamily: "Raleway-SemiBold",
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              color: const Color(0xFF031149),
            ),
          )
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(), // Set the start date
      lastDate: DateTime(2101), // Set the end date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}

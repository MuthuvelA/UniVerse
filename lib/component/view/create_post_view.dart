import 'package:flutter/material.dart';
import 'package:universe/component/view/staff_dashboard_view.dart';
import 'package:universe/service/post_service.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();

}

class _CreatePostViewState extends State<CreatePostView> {
  // late QuillController _controller;
  // late QuillToolbar _toolbar;
  // @override
  // void initState(){
  //   super.initState();
  //   _controller = QuillController.basic();
  //   _toolbar = QuillToolbar.bas
  // }
  List<String> personalizedCheckbox = [
    "CCE",
    "CSE",
    "ECE",
    "CSBS",
    "MECH",
    "student",
    "staff"
  ];
  List<String> title = [
    "Hackathon",
    "Internship",
    "Contest",
    "Others"
  ];
  String selectedValue = "";
  Map<String,dynamic> finalReport = {};
  List<String> finalPersonalizedList = [];
  late List<bool> checkboxController;

  @override
  void initState(){
    super.initState();
    checkboxController = List.filled(personalizedCheckbox.length, false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post",style: TextStyle(fontFamily: "Raleway",fontSize: 18),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartForPost()),
    );
  }
  Widget bodyPartForPost(){
    TextEditingController createPostController = TextEditingController();
    TextEditingController linkController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(color: Colors.black)
          //   ),
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //       hintText: "Enter the title...",
          //       hintStyle: const TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.grey),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       )
          //     ),
          //      controller: tittleController,
          //   ),
          // ),
          Row(
            children: [
              Text(
                  "Select a Title :  ",
                style: TextStyle(
                  fontFamily: "Raleway-SemiBold",
                  fontSize: 16,
                  color: Colors.black
                ),
              ),
              Column(
                children: List.generate(title.length, (index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children :[
                      Text(
                        "${title[index]}",
                      style: TextStyle(
                        fontFamily: "Raleway-SemiBold",
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                    Radio(
                        value: title[index],
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                          print("Selected radio value : $selectedValue");
                        }
                    ),
                    ]
                  );
                }),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Create a post for a student",
                hintStyle: const TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              maxLines: 10,
              controller: createPostController,
            ),
          ),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Inset a Link here",
                  hintStyle: const TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
              controller: linkController,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          // Text("Personalize Your Post",style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
          // Column(
          //   children: List.generate(personalizedCheckbox.length, (index) {
          //     return Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text("${personalizedCheckbox[index]}",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.black),),
          //         Checkbox(
          //           value: checkboxController[index],
          //           onChanged: (value) {
          //             setState(() {
          //               checkboxController[index] = value!;
          //               if(checkboxController[index]){
          //                 finalPersonalizedList.add(personalizedCheckbox[index]);
          //               }
          //             });
          //           },
          //         ),
          //       ],
          //     );
          //   }),
          // ),

          Center(
            child: MaterialButton(onPressed: () async{
              finalReport = {
                "title" : selectedValue,
                "post" : createPostController.text,
              };
              debugPrint("${finalReport}");
              bool decider = await addPost(selectedValue,linkController,createPostController);
              if (decider) {
                Navigator.push(context, (MaterialPageRoute(builder: (context) => const StaffDashboardView())));
              }
              else {
                print("Failed to post");
              }
            },
              child: Text("Publish",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17,color: Colors.white),),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

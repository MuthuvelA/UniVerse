import 'package:flutter/material.dart';

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
    TextEditingController tittleController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter the title...",
                hintStyle: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
               controller: tittleController,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Create a post for a student",
                hintStyle: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              maxLines: 10,
              controller: createPostController,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Text("Personalize Your Post",style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
          Column(
            children: List.generate(personalizedCheckbox.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${personalizedCheckbox[index]}",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.black),),
                  Checkbox(
                    value: checkboxController[index],
                    onChanged: (value) {
                      setState(() {
                        checkboxController[index] = value!;
                        if(checkboxController[index]){
                          finalPersonalizedList.add(personalizedCheckbox[index]);
                        }
                      });
                    },
                  ),
                ],
              );
            }),
          ),

          Center(
            child: MaterialButton(onPressed: (){
              finalReport = {
                "title" : tittleController.text,
                "post" : createPostController.text,
                "filter" : finalPersonalizedList
              };
              debugPrint("${finalReport}");
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

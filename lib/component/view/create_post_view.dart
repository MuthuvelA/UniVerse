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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post",style: TextStyle(fontFamily: "Raleway",fontSize: 18),),
        centerTitle: true,
      ),
      body: bodyPartForPost(),
    );
  }
  Widget bodyPartForPost(){
    TextEditingController createPostController = TextEditingController();
    TextEditingController tittleController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
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
          MaterialButton(onPressed: (){
      
          },
            child: Text("Publish",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17,color: Colors.white),),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}

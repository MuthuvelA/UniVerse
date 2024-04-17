import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StaffProfileView extends StatefulWidget {
  const StaffProfileView({super.key});

  @override
  State<StaffProfileView> createState() => _StaffProfileViewState();
}

class _StaffProfileViewState extends State<StaffProfileView> {
  late List<bool> _selectedButtons;
  late List<bool> _performanceBool;
  bool decider = true;
  bool fdp = false;
  @override
  void initState(){
    super.initState();
    _selectedButtons = List<bool>.filled(2, false);
    _performanceBool = List<bool>.filled(3, false);
    _selectedButtons[0] = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 208, 244),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartForProfile()),
    );
  }
  Widget bodyPartForProfile(){
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 50)),
        Center(
          child: Text(
            "Prakash kumar",
            style: TextStyle(fontFamily: "Raleway",fontSize: 36),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 3)),
        Center(
          child: Text(
            "CCE",
            style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 26),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15)),
        Center(
          child: Text(
            "|| Year",
            style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 50)),
        toggleButton(),
        if(decider)
          performance()
        else
          personalDetails()
      ],
    );
  }
  Widget toggleButton(){
    return ToggleButtons(
      fillColor : Colors.white,
      renderBorder: false,
      // direction: Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _selectedButtons.length; i++) {
            _selectedButtons[i] = (i == index);
          }
          decider = (index == 0);
        });
      },
      borderRadius: BorderRadius.circular(10),
      // fillColor: Colors.blue[200],
      constraints: BoxConstraints(
        minHeight: 50,
        minWidth: 50,
      ),
      isSelected: _selectedButtons,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: _selectedButtons[0]
                  ? Colors.blue[400]
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: const Text(
              "Performance",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: _selectedButtons[1]
                  ? Colors.blue[400]
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: const Text(
              "Personal details",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        // else
        //   personalDetails()
      ],
    );
  }

  Widget performance(){
    List<String> performanceInfo = [
      "Faculty Development program",
      "Paper Published",
      "Patent Registered"
    ];
    List<String> fdp = [
      "Data Scientist",
      "Data Mining",
      "Cloud Architect"
    ];
    List<String> paper = [
      "paper 1",
      "paper 2",
      "paper 3"
    ];
    List<String> patent = [
      "patent 1",
      "patent 2",
      "patent 3"
    ];
    return Column(
      children: [
        Column(
            children: List.generate(performanceInfo.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black,width: 1),
                            color: _performanceBool[index] ? Colors.blue : Colors.white
                        ),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 15)),
                            Center(
                              child: Text(performanceInfo[index],style: TextStyle(fontFamily: "Raleway",fontSize: 18),),
                            ),
                            Padding(padding: EdgeInsets.only(top: 15)),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _performanceBool[index] = true;
                          for(int i=0;i<performanceInfo.length;i++){
                            if(i != index){
                              _performanceBool[i] = false;
                            }
                          }
                        });
                      },
                    ),
                    if(_performanceBool[index] == true && index == 0)
                      fdpView(fdp),
                    if(_performanceBool[index] == true && index == 1)
                      fdpView(paper),
                    if(_performanceBool[index] == true && index == 2)
                      fdpView(patent),
                    Padding(padding: EdgeInsets.only(top: 10)),
                  ],
                ),
              );
            })
        )
      ],
    );
  }
  Widget fdpView(List<String> fdp){
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,width: 1),
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 15)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(fdp.length, (index) {
                  return Text(fdp[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),);
                }),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
            ],
          ),
        ),
      ),
    );
  }

  Widget personalDetails(){
    List<String> personalOut = [
      "M.E, Ph.D.",
      "Teaching : 8 Years\n Industry : 1 Years",
      "Data mining, Machine Learning"
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black,width: 1),
              color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Icon(Icons.school_outlined),
                  Text("Educational Qualification",style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(personalOut[0],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 15),),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Icon(Icons.work),
                  Text("Work Experience",style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(personalOut[1],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 15),),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Icon(Icons.star),
                  Text("Area of specialization",style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(personalOut[2],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 15),),
                  Padding(padding: EdgeInsets.only(top: 15)),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

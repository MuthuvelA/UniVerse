import 'package:flutter/material.dart';

class StaffProfileView extends StatefulWidget {
  const StaffProfileView({super.key});

  @override
  State<StaffProfileView> createState() => _StaffProfileViewState();
}

class _StaffProfileViewState extends State<StaffProfileView> {
  late List<bool> _selectedButtons;
  bool decider = true;
  @override
  void initState(){
    super.initState();
    _selectedButtons = List<bool>.filled(2, false);
    _selectedButtons[0] = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 208, 244),
      body: bodyPartForProfile(),
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
      ],
    );
  }
}

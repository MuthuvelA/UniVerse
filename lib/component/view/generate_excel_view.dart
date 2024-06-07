import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:universe/component/utils/reportList.dart';
import 'package:universe/service/excel_download.dart';
import 'package:universe/service/excel_download_service.dart';

class GenetateExcelView extends StatefulWidget {
  const GenetateExcelView({super.key});

  @override
  State<GenetateExcelView> createState() => _GenetateExcelViewState();
}

class _GenetateExcelViewState extends State<GenetateExcelView> {
  List<String> studentDetails = [
    "Email Address",
    "Phone Number",
    "Date of Birth",
    "Address",
    "Parent Name",
    "Mother Name",
    "Blood Group",
    "LeetCode",
    "CodeChef",
    "Codeforces",
    "Aadhaar Card Number",
    "Aadhaar Card Link",
    "PAN Card Number",
    "PAN Card Link",
    "Driving License Number",
    "Driving License Link",
    "Voter ID Number",
    "Voter ID Link",
    "Passport Number",
    "Passport Link",
    "Bank Account Number",
    "Bank Account Link",
  ];
  late List<bool> checkboxDetails ;

  @override
  void initState(){
    super.initState();
    checkboxDetails = List<bool>.filled(studentDetails.length, false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Report",style: TextStyle(fontFamily: "Raleway",fontSize: 18),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartForXcel(studentDetails,checkboxDetails)),
    );
  }

  Widget bodyPartForXcel(List<String> studentDetails,List<bool> checkboxValues){
    ReportList reportList = new ReportList();
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [
          Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               border: Border.all(color: Colors.black),
               color: const Color(0xFF27397A)
             ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: List.generate(studentDetails.length, (index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${studentDetails[index]}",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.white),),
                      Checkbox(
                        value: checkboxValues[index],
                        onChanged: (value) {
                          setState(() {
                            checkboxValues[index] = value!;
                          });
                        },
                       // activeColor: Colors.white,

                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Center(
            child: MaterialButton(
              onPressed: () async{
                reportList.list(checkboxValues);
                  dynamic value = await generate();
                  String data = value['message'];
                  print(data);
                  List<int> bytes = base64Decode(data);
                  Uint8List byteList = Uint8List.fromList(bytes);
                  saveExcel("sample", byteList);
                  print("success");
              },
              child: Text("Submit",style: TextStyle(fontSize: 16,fontFamily: "Raleway-SemiBold",color: Colors.white),),
              color: Color(0xFF27397A),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }
}

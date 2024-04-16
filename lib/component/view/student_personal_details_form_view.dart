import 'package:flutter/material.dart';
import 'package:universe/component/view/student_coding_details_form.dart';

class StudentDetailsFormView extends StatefulWidget {
  const StudentDetailsFormView({super.key});

  @override
  State<StudentDetailsFormView> createState() => _StudentDetailsFormViewState();
}

class _StudentDetailsFormViewState extends State<StudentDetailsFormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill Your Personal Details",style: TextStyle(fontFamily: "Raleway",fontSize: 18),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartOfForm()),
    );
  }
  Widget bodyPartOfForm(){
    TextEditingController nameController = TextEditingController();
    TextEditingController rollNoController = TextEditingController();
    TextEditingController departmentController = TextEditingController();
    TextEditingController emailAddressController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController dobController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController parentNameController = TextEditingController();
    TextEditingController motherNameController = TextEditingController();
    TextEditingController bloodGroupController = TextEditingController();
    TextEditingController aadhaarCardNumberController = TextEditingController();
    TextEditingController aadhaarCardLinkController = TextEditingController();
    TextEditingController panCardNumberController = TextEditingController();
    TextEditingController panCardLinkController = TextEditingController();
    TextEditingController drivingLicenseNumberController = TextEditingController();
    TextEditingController drivingLicenseLinkController = TextEditingController();
    TextEditingController voterIdNumberController = TextEditingController();
    TextEditingController voterIdLinkController = TextEditingController();
    TextEditingController passportNumberController = TextEditingController();
    TextEditingController passportLinkController = TextEditingController();
    TextEditingController bankAccountNumberController = TextEditingController();
    TextEditingController bankAccountLinkController = TextEditingController();

    List<TextEditingController> personalDetailsControllers = [
      nameController,
      rollNoController,
      departmentController,
      emailAddressController,
      phoneNumberController,
      dobController,
      addressController,
      parentNameController,
      motherNameController,
      bloodGroupController,
      aadhaarCardNumberController,
      aadhaarCardLinkController,
      panCardNumberController,
      panCardLinkController,
      drivingLicenseNumberController,
      drivingLicenseLinkController,
      voterIdNumberController,
      voterIdLinkController,
      passportNumberController,
      passportLinkController,
      bankAccountNumberController,
      bankAccountLinkController,
    ];
    List<String> personalDetails = [
      "Name",
      "Roll No",
      "Department",
      "Email Address",
      "Phone Number",
      "Date of Birth",
      "Address",
      "Parent Name",
      "Mother Name",
      "Blood Group",
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
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
      child: Column(
        children: [
          Column(
            children: List.generate(personalDetails.length, (index) {
              return  Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: personalDetails[index],
                        hintStyle: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.grey),
                      ),
                      controller: personalDetailsControllers[index],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20))
                ],
              );
            }),
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  StudentCodingDetailsForm(personalDetailsController: personalDetailsControllers,)));
              },
              child: Text("Next",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.white),),
              color: Colors.blue,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
        ],
      ),
    );
  }
}

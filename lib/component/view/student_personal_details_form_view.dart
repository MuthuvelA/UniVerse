import 'package:flutter/material.dart';
import 'package:universe/component/utils/student_details.dart';
import 'package:universe/component/view/student_coding_details_form.dart';

class StudentDetailsFormView extends StatefulWidget {
  const StudentDetailsFormView({super.key});

  @override
  State<StudentDetailsFormView> createState() => _StudentDetailsFormViewState();
}

class _StudentDetailsFormViewState extends State<StudentDetailsFormView> {
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

  List<String> personalDetails = StudentDetails.getPersonalDetails();

  late List<TextEditingController> personalDetailsControllers = [
    nameController,
    departmentController,
    rollNoController,
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

  List<bool> isEditable = List.generate(22, (index) => false);

  @override
  void initState() {
    for (int i = 0; i < personalDetails.length; i++) {
      personalDetailsControllers[i].text = personalDetails[i];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fill Your Personal Details",
          style: TextStyle(fontFamily: "Raleway", fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: bodyPartOfForm()),
    );
  }

  Widget bodyPartOfForm() {
    List<String> personalDetailsLabels = [
      "Name",
      "Department",
      "Roll No",
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
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Column(
        children: [
          Column(
            children: List.generate(personalDetailsLabels.length, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${personalDetailsLabels[index]}",
                    style: TextStyle(
                      fontFamily: "Raleway-SemiBold",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Stack(
                    children: [
                      TextFormField(
                        enabled: isEditable[index],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: personalDetailsLabels[index],
                          hintStyle: TextStyle(
                            fontFamily: "Raleway-SemiBold",
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        controller: personalDetailsControllers[index],
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: IconButton(
                          icon: Icon(
                            isEditable[index] ? Icons.check : Icons.edit,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            setState(() {
                              isEditable[index] = !isEditable[index];
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 20))
                ],
              );
            }),
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentCodingDetailsForm(
                          personalDetailsController:
                          personalDetailsControllers,
                        )));
              },
              child: Text(
                "Next",
                style: TextStyle(
                    fontFamily: "Raleway-SemiBold",
                    fontSize: 16,
                    color: Colors.white),
              ),
              color: Color(0xFF27397A),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
        ],
      ),
    );
  }
}

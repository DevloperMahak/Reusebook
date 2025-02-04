import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reusebook/login.dart';
import 'package:reusebook/uihelper.dart';
import 'package:http/http.dart' as http;
import 'url.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});
  @override
  State<RegisterPage>createState()=>RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>{
  var FirstName=TextEditingController();
  var LastName=TextEditingController();
  var Gender=TextEditingController();
  var DOB=TextEditingController();
  var BirthPlace=TextEditingController();
  var PhNo=TextEditingController();
  var WhatsappNo=TextEditingController();
  var CollegeName=TextEditingController();
  var CollegeState=TextEditingController();
  var Branch=TextEditingController();
  var Degree=TextEditingController();
  var PassYear=TextEditingController();
  var EmailText=TextEditingController();
  var PasswordNum=TextEditingController();
  var ConfirmPasswordNum=TextEditingController();

  bool _ObscureText1 = true;
  bool _ObscureText2 = true;



  Register(String firstname,String lastname,String gender,String dob,String birthplace,String phno,String whatsappno, String email,String password, String confirmpassword)async {
    if (firstname == "" || lastname == "" || gender == "" || dob == "" ||
        birthplace == "" || phno == "" || whatsappno == "" || email == "" ||
        password == "" || confirmpassword == "") {
      UiHelper.CustomAlertBox(
          context, "Enter Required Fields"); // Check if any field is empty
    }
    if (password != confirmpassword) {
      UiHelper.CustomAlertBox(context,
          "Your Confirmpassword is not same as password"); // Check if passwords match
      return;
    }

    // Check if email is valid
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(
        EmailText.text)) {
      UiHelper.CustomAlertBox(context, "Please enter a valid email address");
      return;
    }

    // Check if phone numbers are valid (basic length check or pattern)
    if (PhNo.text.length != 10 || WhatsappNo.text.length != 10) {
      UiHelper.CustomAlertBox(context, "Please enter a valid phone number");
      return;
    }

// Prepare data for registration API request
      var data = {
        "FirstName": FirstName.text,
        "LastName": LastName.text,
        "Gender": Gender.text,
        "DOB": DOB.text,
        "BirthPlace": BirthPlace.text,
        "PhNo": PhNo.text,
        "WhatsappNo": WhatsappNo.text,
        "CollegeName": CollegeName.text,
        "CollegeState": CollegeState.text,
        "Branch": Branch.text,
        "Degree": Degree.text,
        "PassYear": PassYear.text,
        "EmailText": EmailText.text,
        "PasswordNum": PasswordNum.text,
        "ConfirmPasswordNum": ConfirmPasswordNum.text,
      };

      try {
      // Send POST request to registration endpoint
      final response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data)
      );

      // Check for successful registration response
      if (response.statusCode == 200) {
        print('Registration successful');
        print(response);

        // You could navigate to the login page or show a success message
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        print('Registration failed');
        UiHelper.CustomAlertBox(
            context, "Registration failed, please try again");
      }
    }catch(e){
        // Catch any errors during the API call
        print('Error during registration: $e');
        UiHelper.CustomAlertBox(context, "An error occurred, please try again later");
      }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child:Container(
              color: const Color(0xffFFFCCE),
            child:Column(
        children: [Container(
                width: screenwidth,
                  child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 70),
                              child: Center(
    child:Column(
    children: [
      Text(" Register to get started,",style: TextStyle(fontSize: 22,),),
      Text(" Start your journey with us.",style: TextStyle(fontSize: 22,),),
                              ])
                            )
                        ),
                        Container(
                          height: 350,
                          width: 350,
                          child: Center(
    child:Image.asset('assets/images/Sign up-rafiki.png')),
                        ),
                      ])
              ),
      Container(
      width: screenwidth,
      height: 1800,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: Color(0xffFFB330)
        ),
        borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30)),
        color: Colors.white,),
      child: Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top:25),
                child :Center(
                  child:Text("Personal Information",style: TextStyle(fontSize: 22,),),)
            ),
            Container(
              margin: const EdgeInsets.only(left:23,top: 15 ),
              child: const Text("First Name",style: TextStyle(fontSize: 16,),),),

            UiHelper.CustomTextField3(FirstName, "Enter your first name here", false),

            Container(
              margin: const EdgeInsets.only(left:23 ),
              child: const Text("Last Name",style: TextStyle(fontSize: 16,),),),

            UiHelper.CustomTextField3(LastName, "Enter your last name here", false),

            Container(
              margin: const EdgeInsets.only(left:23 ),
              child: const Text("Gender",style: TextStyle(fontSize: 16,),),),

            UiHelper.CustomTextField3(Gender, "Select Gender", false),

            Container(
              margin: const EdgeInsets.only(left:23 ),
              child: const Text("Email Address",style: TextStyle(fontSize: 16,),),),

             UiHelper.CustomTextField1(EmailText, "youremail@gmail.com",Icons.email, false),

            Container(
              margin: const EdgeInsets.only(left:23 ),
              child: const Text("Date of Birth",style: TextStyle(fontSize: 16,),),),

             UiHelper.CustomTextField2(DOB, "DD/MM/YYYY", Icons.calendar_month, Icons.arrow_drop_down, false),
            Container(
              margin: const EdgeInsets.only(left:23 ),
              child: const Text("Birth Place",style: TextStyle(fontSize: 16,),),),

             UiHelper.CustomTextField4(BirthPlace, "Select State",Icons.arrow_drop_down , false),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top:25),
                      child :Center(
                        child:Text("Contact Information",style: TextStyle(fontSize: 22,),),)
                  ),
                  Container(
                    margin: const EdgeInsets.only(left:23,top: 15 ),
                    child: const Text("Phone Number",style: TextStyle(fontSize: 16,),),),

                    UiHelper.CustomTextField1(PhNo, "+91", Icons.phone, false),

                  Container(
                    margin: const EdgeInsets.only(left:23 ),
                    child: const Text("Whatsapp Number",style: TextStyle(fontSize: 16,),),),

                  UiHelper.CustomTextField1(WhatsappNo, "+91", Icons.phone, false),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top:25),
                            child :Center(
                              child:Text("Educational Information",style: TextStyle(fontSize: 22,),),)
                        ),
                        Container(
                          margin: const EdgeInsets.only(left:23,top: 15 ),
                          child: const Text("College Name",style: TextStyle(fontSize: 16,),),),

                        UiHelper.CustomTextField4(CollegeName, "Enter your college name here", Icons.arrow_drop_down , false),

                        Container(
                          margin: const EdgeInsets.only(left:23 ),
                          child: const Text("College’s State",style: TextStyle(fontSize: 16,),),),

                        UiHelper.CustomTextField4(CollegeState, "Select State", Icons.arrow_drop_down , false),

                        Container(
                          margin: const EdgeInsets.only(left:23,top: 15 ),
                          child: const Text("Degree",style: TextStyle(fontSize: 16,),),),

                        UiHelper.CustomTextField4(Degree, "Select Course", Icons.arrow_drop_down , false),

                        Container(
                          margin: const EdgeInsets.only(left:23,top: 15 ),
                          child: const Text("Branch",style: TextStyle(fontSize: 16,),),),

                        UiHelper.CustomTextField4(Branch, "Select Branch", Icons.arrow_drop_down , false),

                        Container(
                          margin: const EdgeInsets.only(left:23,top: 15 ),
                          child: const Text("Passout Year",style: TextStyle(fontSize: 16,),),),

                        UiHelper.CustomTextField4(PassYear, "Select Year", Icons.arrow_drop_down , false),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top:25),
                              child :Center(
                                child:Text("Let’s Create Password",style: TextStyle(fontSize: 22,),),)
                          ),
                          Container(
                            margin: const EdgeInsets.only(left:23,top: 15 ),
                            child: const Text("Password",style: TextStyle(fontSize: 16,),),),

                          Center(
                              child:Container(
                                  margin: const EdgeInsets.only(top:5,bottom: 10),
                                  height: 48,
                                  width: 366,
                                  child:TextField(
                                      controller: PasswordNum,
                                      obscureText:_ObscureText1,
                                      decoration: InputDecoration(
                                        hintText: "********",
                                        prefixIcon: Icon(Icons.lock,color:Color(0xffFFB330) ,),
                                        suffixIcon: IconButton(
                                            onPressed:(){
                                              setState(() {
                                                _ObscureText1 = !_ObscureText1;
                                              });
                                            },
                                            icon: Icon(_ObscureText1 ? Icons.visibility_off : Icons.visibility)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xffFFB330))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xffFFB330))),
                                      )
                                  )
                              )),

                          Container(
                            margin: const EdgeInsets.only(left:23 ),
                            child: const Text("Confirm Password",style: TextStyle(fontSize: 16,),),),

                          Center(
                              child:Container(
                                  margin: const EdgeInsets.only(top:5,bottom: 10),
                                  height: 48,
                                  width: 366,
                                  child:TextField(
                                      controller: ConfirmPasswordNum,
                                      obscureText:_ObscureText2,
                                      decoration: InputDecoration(
                                        hintText: "********",
                                        prefixIcon: Icon(Icons.lock,color:Color(0xffFFB330) ,),
                                        suffixIcon: IconButton(
                                            onPressed:(){
                                              setState(() {
                                                _ObscureText2 = !_ObscureText2;
                                              });
                                            },
                                            icon: Icon(_ObscureText2 ? Icons.visibility_off : Icons.visibility)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xffFFB330))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xffFFB330))),
                                      )
                                  )
                              )),


                            UiHelper.CustomButton((){
                              Register(FirstName.text.toString(),LastName.text.toString(),Gender.text.toString(),DOB.text.toString(),BirthPlace.text.toString(),PhNo.text.toString(),WhatsappNo.text.toString(),EmailText.text.toString(),PasswordNum.text.toString(),ConfirmPasswordNum.text.toString());
                            }, "Register") ,
                        ]),
                  ),
                ]),
            )
                ],
        )),
            ),
          ]
    )
    )
        )
    );
  }
}


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
  var PhNo=TextEditingController();
  var WhatsappNo=TextEditingController();
  var EmailText=TextEditingController();
  var PasswordNum=TextEditingController();
  var ConfirmPasswordNum=TextEditingController();
  var Pincode = TextEditingController();
  var ShopState = TextEditingController();
  var ShopName = TextEditingController();
  var ShopAddress = TextEditingController();
  var ShopCity = TextEditingController();
  var ContactNo=TextEditingController();
  var Address = TextEditingController();
  var City = TextEditingController();
  var State=TextEditingController();

  String userType = 'Student'; // Default selection

  bool _ObscureText1 = true;
  bool _ObscureText2 = true;



  Register(String firstname,String lastname,String gender,String phno,String whatsappno, String email,String password, String confirmpassword,String pincode,String shopstate,String shopname,String shopaddress,String shopcity,String contactno,String city,String state,String address)async {
    // Common validation
    if (EmailText.text.isEmpty || PasswordNum.text.isEmpty || ConfirmPasswordNum.text.isEmpty) {
      UiHelper.CustomAlertBox(context, "Please fill all required fields");
      return;
    }

    // Student fields validation
    if (userType == 'Student') {
      if (FirstName.text.isEmpty || LastName.text.isEmpty || Gender.text.isEmpty ||
          City.text.isEmpty || State.text.isEmpty || Address.text.isEmpty ||
          Pincode.text.isEmpty) {
        UiHelper.CustomAlertBox(context, "Please fill all student details");
        return;
      }
    }

    // Shopkeeper fields validation
    if (userType == 'Shopkeeper') {
      if (ShopName.text.isEmpty || FirstName.text.isEmpty || ShopAddress.text.isEmpty ||
          ShopCity.text.isEmpty || ShopState.text.isEmpty || Pincode.text.isEmpty) {
        UiHelper.CustomAlertBox(context, "Please fill all shopkeeper details");
        return;
      }
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
    var data;

    if (userType == 'Student') {
      data = {
        "UserType": userType,
        "FirstName": FirstName.text,
        "LastName": LastName.text,
        "Gender": Gender.text,
        "City":City.text,
        "State": State.text,
        "Address": Address.text,
        "Pincode": Pincode.text,
        "PhNo": PhNo.text,
        "WhatsappNo": WhatsappNo.text,
        "EmailText": EmailText.text,
        "PasswordNum": PasswordNum.text,
        "ConfirmPasswordNum": ConfirmPasswordNum.text,
      };
    } else {
      data = {
        "UserType": userType,
        "ShopName": ShopName.text,
        "OwnerName": FirstName.text,
        "ShopAddress": ShopAddress.text,
        "ShopCity": ShopCity.text,
        "ShopState": ShopState.text,
        "Pincode": Pincode.text,
        "PhNo": PhNo.text,
        "WhatsappNo": WhatsappNo.text,
        "EmailText": EmailText.text,
        "PasswordNum": PasswordNum.text,
        "ConfirmPasswordNum": ConfirmPasswordNum.text,
      };
    }


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
              child: const Text("User Type",style: TextStyle(fontSize: 16,),),),

            Center(
              child: Container(
                height: 48,
                width: 366,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                margin: const EdgeInsets.only(top:5,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffFFB330)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: userType,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    onChanged: (String? newValue) {
                      setState(() {
                        userType = newValue!;
                      });
                    },
                    items: ['Student', 'Shopkeeper'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

// Dynamic Section based on userType
            if (userType == 'Student') ...[
              // Student-specific fields
              UiHelper.label("First Name"),
              UiHelper.CustomTextField3(FirstName, "Enter your first name here", false),

              UiHelper.label("Last Name"),
              UiHelper.CustomTextField3(LastName, "Enter your last name here", false),

              UiHelper.label("Gender"),
              UiHelper.CustomTextField3(Gender, "Select Gender", false),

              UiHelper.label("Email Address"),
              UiHelper.CustomTextField1(EmailText, "youremail@gmail.com", Icons.email, false),


              UiHelper.label("City"),
              UiHelper.CustomTextField3(City, "Enter your city", false),

              UiHelper.label("State"),
              UiHelper.CustomTextField3(State, "Enter your state", false),

              UiHelper.label("Address"),
              UiHelper.CustomTextField3(Address, "Enter your address", false),

              UiHelper.label("Pincode"),
              UiHelper.CustomTextField3(Pincode, "Enter your pincode", false),
            ]
            else if (userType == 'Shopkeeper') ...[
              // Shopkeeper-specific fields
              UiHelper.label("Shop Name"),
              UiHelper.CustomTextField3(ShopName, "Enter your shop name", false),

              UiHelper.label("Owner Name"),
              UiHelper.CustomTextField3(FirstName, "Enter owner’s name", false),

              UiHelper.label("Email Address"),
              UiHelper.CustomTextField1(EmailText, "youremail@gmail.com", Icons.email, false),

              UiHelper.label("Shop Address"),
              UiHelper.CustomTextField3(ShopAddress, "Enter shop address", false),

              UiHelper.label("City"),
              UiHelper.CustomTextField3(ShopCity, "Enter your city", false),

              UiHelper.label("State"),
              UiHelper.CustomTextField3(ShopState, "Enter your state", false),

              UiHelper.label("Pincode"),
              UiHelper.CustomTextField3(Pincode, "Enter your pincode", false),
            ],

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
                              Register(FirstName.text.toString(),LastName.text.toString(),Gender.text.toString(),PhNo.text.toString(),WhatsappNo.text.toString(),EmailText.text.toString(),PasswordNum.text.toString(),ConfirmPasswordNum.text.toString(),Pincode.text.toString(),ShopState.text.toString(),ShopName.text.toString(),ShopAddress.text.toString(),ShopCity.text.toString(),ContactNo.text.toString(),City.text.toString(),State.text.toString(),Address.text.toString());
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


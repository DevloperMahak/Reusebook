import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reusebook/login.dart';
import 'package:reusebook/uihelper.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});
  @override
  State<RegisterPage>createState()=>RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>{
  TextEditingController FirstName=TextEditingController();
  TextEditingController LastName=TextEditingController();
  TextEditingController Gender=TextEditingController();
  TextEditingController DOB=TextEditingController();
  TextEditingController BirthPlace=TextEditingController();
  TextEditingController PhNo=TextEditingController();
  TextEditingController WhatsappNo=TextEditingController();
  TextEditingController CollegeName=TextEditingController();
  TextEditingController CollegeState=TextEditingController();
  TextEditingController Branch=TextEditingController();
  TextEditingController Degree=TextEditingController();
  TextEditingController PassYear=TextEditingController();
  TextEditingController EmailText=TextEditingController();
  TextEditingController PasswordNum=TextEditingController();
  TextEditingController ConfirmPasswordNum=TextEditingController();

  Register(String email,String password)async{
    if(email=="" && password==""){
      UiHelper.CustomAlertBox(context, "Enter Required Fields");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
            Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()));
        });
            }
            on FirebaseAuthException catch(ex){
          return UiHelper.CustomAlertBox(context, ex.code.toString());
        }
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

             UiHelper.CustomTextField1(BirthPlace, "Select State",Icons.arrow_drop_down , false),

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

                           UiHelper.CustomTextField2(PasswordNum, "********",Icons.lock,Icons.remove_red_eye,true),

                          Container(
                            margin: const EdgeInsets.only(left:23 ),
                            child: const Text("Confirm Password",style: TextStyle(fontSize: 16,),),),

                           UiHelper.CustomTextField2(ConfirmPasswordNum, "********",Icons.lock,Icons.remove_red_eye,true),


                            UiHelper.CustomButton((){
                              Register(EmailText.text.toString(),PasswordNum.text.toString());
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


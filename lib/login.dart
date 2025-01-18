import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reusebook/OTP.dart';
import 'package:reusebook/language.dart';
import 'package:reusebook/register.dart';
import 'package:reusebook/uihelper.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<LoginPage>createState()=>LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController EmailText=TextEditingController();
  TextEditingController PasswordNum=TextEditingController();

  bool _ObscureText = true;

  Login(String email,String password)async{
    if(email=="" && password==""){
      UiHelper.CustomAlertBox(context, "Enter Required Fields");
    }
    else{
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>LanguagePage()));

      /*UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password).then((value){
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=>LanguagePage()));
            });
      }
      on FirebaseAuthException catch(ex){
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }*/
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
         Container(
        color: const Color(0xffFFFCCE),
        child: Column(children: [
          Container(
            height: 300,
            width: 300,
            margin: const EdgeInsets.only(top:  10),
            child: Center(
              child:Image.asset('assets/images/Tablet login-rafiki.png')),
          ),
          Container(
            child:Center(
              child:Column(
                  children: [
                    Text("Let’s sign you in,",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
                    ),
                    Text("We’re waiting for you!",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    )
                  ]),
            )
          )
        ])),
          Positioned(
            bottom: 0,
          child:Center(
          child:Container(
            height: 425,
            width: screenwidth,
            decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: Color(0xffFFB330)
            ),
            borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30)),
            ),
            margin:const EdgeInsets.only(top: 15),
            child:Column(
            children: [
             Container(
               margin: const EdgeInsets.only(top: 25,left:25 ),
              child: Align(
                alignment: Alignment.centerLeft,
              child: Text("Email Address",style: TextStyle(fontSize: 16,),),)),

           UiHelper.CustomTextField1(EmailText, "youremail@gmail.com",Icons.email, false) ,

              Container(
                  margin: const EdgeInsets.only(left:25 ),
                child: Align(
                  alignment: Alignment.centerLeft,
                child:Text("Password",style: TextStyle(fontSize: 16,),),)),

    Center(
    child:Container(
    margin: const EdgeInsets.only(top:5,bottom: 10),
    height: 48,
    width: 366,
    child:TextField(
    controller: PasswordNum,
    obscureText:_ObscureText,
    decoration: InputDecoration(
    hintText: "********",
    prefixIcon: Icon(Icons.lock,color:Color(0xffFFB330) ,),
    suffixIcon: IconButton(
    onPressed:(){
     setState(() {
       _ObscureText = !_ObscureText;
     });
    },
    icon: Icon(_ObscureText ? Icons.visibility_off : Icons.visibility)),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffFFB330))),
    )
    )
    )),

    Align(
    alignment: Alignment.centerRight,
    child:Container(
                margin: const EdgeInsets.only(right:25 ),
                  child: InkWell(
                    onTap: (){Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>OTP()));},
                    onDoubleTap: (){
                    print("tapped");},
                    child: const Text("Forgot Password ?",style: TextStyle(fontSize: 12,color: Color(0xffFFB330)),),),)),
           Center(
    child: Container(
               margin: const EdgeInsets.only(top:15),
             child:UiHelper.CustomButton((){
               Login(EmailText.text.toString(), PasswordNum.text.toString());
             }, "Login") ,)),
              Container(
                margin: const EdgeInsets.only(top: 8,bottom: 10),
                  child: Align(
                    alignment: Alignment.center,
                  child: Text("By clicking Login, you agree to Bridge next’s Terms & Conditions.",style: TextStyle(fontSize: 12,)))),
              Divider(
                height: 5,
                thickness: 2,
                color: Color(0xffB2B2B2),
              ),
              Center(
    child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 48,
                  width: 300,
                  child:OutlinedButton(
                     style:  OutlinedButton.styleFrom(
                        foregroundColor:  Color(0xffFFB330),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(5)
                       )
                      ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>RegisterPage(),
                        ));
                  },
                  child: const Text("Register")),))
            ]),),))
          ])
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper{
  static CustomTextField1(TextEditingController controller,String text,IconData iconData,bool toHide){
    return  Center(
        child:Container(
        margin: const EdgeInsets.only(top:5,bottom: 10),
    height: 48,
    width: 366,
    child:TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(iconData,color:Color(0xffFFB330) ,),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFFB330))),
        )
    )
    ));
  }
    static CustomTextField2(TextEditingController controller,String text,IconData iconData1,iconData2,bool toHide){
      return  Center(
        child:Container(
        margin: const EdgeInsets.only(top:5,bottom: 10),
    height: 48,
    width: 366,
    child:TextField(
      controller: controller,
      obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
            prefixIcon: Icon(iconData1,color:Color(0xffFFB330) ,),
            suffixIcon: Icon(iconData2,color:Color(0xffFFB330),),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffFFB330))),
        )
    )
    ));
  }
  static CustomTextField3(TextEditingController controller,String text,bool toHide){
    return  Center(
        child:Container(
        margin: const EdgeInsets.only(top:5,bottom: 10),
       height: 48,
        width: 366,
            child:TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFFB330))),
        )
    )
    ));
  }
  static CustomTextField4(TextEditingController controller,String text,IconData iconData,bool toHide){
    return  Center(
        child:Container(
            margin: const EdgeInsets.only(top:5,bottom: 10),
            height: 48,
            width: 366,
            child:TextField(
                controller: controller,
                obscureText: toHide,
                decoration: InputDecoration(
                  hintText: text,
                  suffixIcon: Icon(iconData,color:Color(0xffFFB330) ,),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFFB330))),
                )
            )
        ));
  }
  static CustomButton(VoidCallback voidcallback,String text){
    return Center(
        child:Container(
        margin: const EdgeInsets.only(top:20,bottom: 10),
    height: 48,
    width: 366,
    child: ElevatedButton(onPressed: (){
      voidcallback();
    }, style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xffFFB330),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
      )
    ),
        child: Text(text,)),));
  }
  static CustomAlertBox(BuildContext context,String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
      );
    });
  }
}

/* child: TextField(
                controller: EmailText,
                keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  prefixIcon: (Icon(Icons.email,color: Color(0xffFFB330),size: 20,)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFFB330))),
              hintText: "youremail@gmail.com"
             )),
             TextField(
                  controller: PasswordNum,
                  obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixIcon: (Icon(Icons.remove_red_eye,color: Color(0xffFFB330),size: 20,)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFFB330))
                    ),
                    hintText: "**********"
                )),
                ElevatedButton(
                 style:ElevatedButton.styleFrom(
                   foregroundColor: Colors.white,
                   backgroundColor: Color(0xffFFB330),
                 ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>LanguagePage()));
                    String uEmail=EmailText.text.toString();
                    String uPassword=PasswordNum.text;
                    print("Email: $uEmail,Password: $uPassword");
                  },
                  child: const Text("Login"),)*/
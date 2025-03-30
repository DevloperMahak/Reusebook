import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reusebook/home.dart';
import 'package:reusebook/newpassword.dart';
import 'package:reusebook/uihelper.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'localization_service.dart';

class LanguagePage extends StatefulWidget{
  final token;
  const LanguagePage({@required this.token,Key? key}) : super(key: key);

  @override
  State<LanguagePage>createState()=>LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {
  String? selectedLanguage;
  final List<String> languages = LocalizationService.langs;
  late String EmailText;
  //final List<String> languages = ['Hindi','Punjabi','Assamese','English','Telugu','Tamil','Bengali','Marathi','Kannada','Odia','Gujrati','Malayalam']; // Sample languages

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    _loadSelectedLanguage(); //  Load saved language
    Map<String, dynamic>jwtDecodedToken = JwtDecoder.decode(widget.token);
    EmailText = jwtDecodedToken['EmailText'];
  }

  _loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString('selectedLanguage') ?? "English";
    });
  }

  _saveLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
    LocalizationService.updateLocale(language); // ✅ Update app locale
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
        body:Stack(
            children: [
              Container(
            color: const Color(0xffFFFCCE),
            child: Column(
                children: [Container(
                    margin: const EdgeInsets.only(top: 80),
                      child:  Center(
                        child:Text('language'.tr,style: TextStyle(fontSize: 22,fontWeight:FontWeight.w600),),
                      )),
                  Container(
                    height: 350,
                    width: 350,
                    child: Image.asset('assets/images/Translator-pana 1.png'),
                  ),
                  Container(
                    child:Center(
                  child:Column(
                    children: [
                      Text("Please,help us to know your",style: TextStyle(fontSize: 22,),),
                      Text("preferred language.",style: TextStyle(fontSize: 22,),),
                      Text(EmailText),
                      ])
                  ))
                ])),
                  Positioned(
                  bottom: 0,
                  child:Center(
                  child:Container(
                    margin: EdgeInsets.only(top: 30),
                    width: screenwidth,
                    height: 275,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(32),topLeft:Radius.circular(32)),
                    color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Color(0xffFFB330)
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left:25,top:25),
                              child:Align(
                                alignment: Alignment.centerLeft,
    child:Text("Select Language",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),),
                        )),
                        Container(
                          margin: const EdgeInsets.only(left:25,top:10,bottom: 15),
                                child:Align(
                                  alignment: Alignment.centerLeft,
    child:Text("All the information will be seen in this language",style: TextStyle(fontSize: 18,),),
                          )),
                        Center(
                        child:Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: 48,
                          width: 366,
                          child: DropdownButtonFormField<String>(
    value: selectedLanguage,
    decoration: const InputDecoration(
    prefixIcon: Icon(Icons.language_rounded, color: Color(0xffFFB330), size: 20),
    border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFFB330))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFFB330))),// Removes default border
    ),
    hint: const Text("Select language"),
    items: languages.map((String language) {
    return DropdownMenuItem<String>(
    value: language,
    child: Text(language),
    );
    }).toList(),
    onChanged: (String? newValue) async{
      if (newValue != null) {
        setState(() {
          selectedLanguage = newValue;
        });
        // ✅ Update app language dynamically
        await LocalizationService.updateLocale(newValue);
        await _saveLanguage(newValue); // Update selected language

        // Optional but helps debug
        print("Language updated to: $newValue");
    };
    },
    ),
    )),

                        UiHelper.CustomButton(()async{
    if (selectedLanguage != null) {
      await LocalizationService.updateLocale(selectedLanguage!); // Ensure it's set again
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => homePage()),
                          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a language")),
      );
    }
    }, "Confirm") ,
                      ]
                    )
                  )
                  )
                  )
            ])
    );
  }
}
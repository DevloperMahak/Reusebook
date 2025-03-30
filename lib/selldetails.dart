import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';
import 'package:reusebook/uihelper.dart';
import 'package:http/http.dart' as http;
import 'url.dart';
import 'categories.dart';
import 'home.dart';
import 'orders.dart';

class selldetails extends StatefulWidget {
  const selldetails({super.key});
  @override
  State<selldetails>createState()=>selldetailsState();
}

class selldetailsState extends State<selldetails>{
  var BookName=TextEditingController();
  var BookDescription=TextEditingController();
  var BookCondition=TextEditingController();
  var Publication =TextEditingController();
  var Author =TextEditingController();
  var PrintPrice =TextEditingController();
  var SellingPrice =TextEditingController();

  File? _image1;
  final picker1 = ImagePicker();

  Future getGalleryImage1()async{
    final pickedFile = await picker1.pickImage(source:ImageSource.gallery,imageQuality: 80);
    setState(() {
    if(pickedFile!=null){
      _image1 = File(pickedFile.path);
    }else{
      print("no image picked");
    }
    });
  }

  Future takeCameraImage1()async{
    final pickedFile = await picker1.pickImage(source:ImageSource.camera,imageQuality: 80);
    setState(() {
      if(pickedFile!=null){
        _image1 = File(pickedFile.path);
      }else{
        print("no image picked");
      }
    });
  }

  File? _image2;
  final picker2 = ImagePicker();

  Future getGalleryImage2()async{
    final pickedFile = await picker2.pickImage(source:ImageSource.gallery,imageQuality: 80);
    setState(() {
      if(pickedFile!=null){
        _image2 = File(pickedFile.path);
      }else{
        print("no image picked");
      }
    });
  }

  Future takeCameraImage2()async{
    final pickedFile = await picker1.pickImage(source:ImageSource.camera,imageQuality: 80);
    setState(() {
      if(pickedFile!=null){
        _image2 = File(pickedFile.path);
      }else{
        print("no image picked");
      }
    });
  }

  // Function to upload the image
  Future<void> _uploadImage() async {
    if (_image1 == null) {
      UiHelper.CustomAlertBox(context, "Please upload image");
      return;
    }
    final uri = Uri.parse(frontcover); // Your backend URL
    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', uri);


      // Add the image file to the request
      var pic = await http.MultipartFile.fromPath('frontimage', _image1!.path);
      request.files.add(pic);
      print("Image Path: ${_image1!.path}");
      var file = File(_image1!.path);
      print("File size: ${await file.length()} bytes");



      // Send the request and get the response
      var response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print("Image uploaded successfully!");
        // You can now save the image URL to your MongoDB
      } else {
        print("Image upload failed with status code: ${response.statusCode}");
        print("Response body: $responseBody");
      }
    } catch (e) {
      // Catch any errors such as network issues or file not found
      print("Error occurred during image upload: $e");
      UiHelper.CustomAlertBox(context, "An error occurred while uploading the image.");
    }
  }

  postbook(String bookname,String bookdescription,String bookcondition,String publication,String author,String printprice,String sellingprice)async {
    if (bookname == "" || bookdescription == "" || bookcondition == "" || publication == "" ||
        author == "" || printprice == "" || sellingprice == "" ) {
      UiHelper.CustomAlertBox(
          context, "Enter Required Fields"); // Check if any field is empty
    }
   /* if (_image1 == null || _image2 == null) {
      UiHelper.CustomAlertBox(context, "Please upload both images");
      return;
    }

    await _uploadImage();*/

// Prepare data for registration API request
    var data = {
      "BookName": BookName.text,
      "BookDescription": BookDescription.text,
      "Publication": Publication.text,
      "Author": Author.text,
      "PrintPrice": PrintPrice.text,
      "SellingPrice": SellingPrice.text,
    };

    try {
      // Send POST request to posting book endpoint
      final response = await http.post(Uri.parse(postbookdetails),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data)
      );
      // Check for successful book posting response
      if (response.statusCode == 200) {
        print('Book Posting successful');
        print(response);

        // You could navigate to the home page or show a success message
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => homePage()));
      } else {
        print('Posting failed');
        UiHelper.CustomAlertBox(
            context, "Book posting failed, please try again");
      }
    }catch(e){
      // Catch any errors during the API call
      print('Error during posting: $e');
      UiHelper.CustomAlertBox(context, "An error occurred, please try again later");
    }
  }
  Widget bottomSheet1(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical:20 ),
      child: Column(
        children: <Widget>[
          Text("Choose Profile Photo",style: TextStyle(fontSize: 22,fontWeight:FontWeight
              .w600,color: Colors.brown),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera,size: 30),
                onPressed: (){
                 takeCameraImage1();
                 Navigator.pop(context); // Close bottom sheet
                },
                label: Text("Camera",style: TextStyle(fontSize: 20),),
              ),
              TextButton.icon(
                icon: Icon(Icons.image,size: 30,),
                onPressed: (){
                 getGalleryImage1();
                 Navigator.pop(context); // Close bottom sheet
                },
                label: Text("Gallery",style: TextStyle(fontSize: 20,),),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomSheet2(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical:20 ),
      child: Column(
        children: <Widget>[
          Text("Choose Profile Photo",style: TextStyle(fontSize: 22,fontWeight:FontWeight
              .w600,color: Colors.brown),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera,size: 30),
                onPressed: (){
                  takeCameraImage2();
                  Navigator.pop(context); // Close bottom sheet
                },
                label: Text("Camera",style: TextStyle(fontSize: 20),),
              ),
              TextButton.icon(
                icon: Icon(Icons.image,size: 30,),
                onPressed: (){
                  getGalleryImage2();
                  Navigator.pop(context); // Close bottom sheet
                },
                label: Text("Gallery",style: TextStyle(fontSize: 20,),),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('fill_book_details'.tr,style: TextStyle(fontSize:25,color: Colors.black),),
          flexibleSpace:Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffFFB330),
                  Color(0xffFFD77F),
                  Color(0xffFFFCCE),
                ])
            ),
          ),
        ),
        body: Stack(
            children:[
              Container(
                child:SingleChildScrollView(
              child:Container(
                width: screenwidth,
                height:1350,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                margin: const EdgeInsets.only(left:24,top: 25,bottom:5 ),
                    child:Text("Book Name",style: TextStyle(fontSize: 20,),)),
                    UiHelper.CustomTextField3(BookName, "Type Book Name", false),

                    Container(
                        margin: const EdgeInsets.only(left:24,top: 25,bottom:5 ),
                        child:Text("Book Description",style: TextStyle(fontSize: 20,),)),
                    Center(
                      child:Container(
                      height:156 ,
                      width: 366,
                      margin: const EdgeInsets.only(top:5,bottom: 10),
                        child: TextField(
                          controller: BookDescription,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "What is this book about ?",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border:Border.all(
                            color: Color(0xffFFB330)
                        ) ,
                      ),
                    )),

                    Container(
                        margin: const EdgeInsets.only(left:24,top: 25,bottom:5 ),
                        child:Text("Book Condition",style: TextStyle(fontSize: 20,),)),
                    UiHelper.CustomTextField4(BookCondition, "Type Book Condition",Icons.arrow_drop_down , false),

                    Container(
                        margin: const EdgeInsets.only(left:24,top: 25,bottom:5 ),
                        child:Text("Publication",style: TextStyle(fontSize: 20,),)),
                    UiHelper.CustomTextField4(Publication, "Type Publication Name",Icons.arrow_drop_down , false),

                    Container(
                        margin: const EdgeInsets.only(left:24,top: 25,bottom:5 ),
                        child:Text("Author",style: TextStyle(fontSize: 20,),)),
                    UiHelper.CustomTextField4(Author, "Type Author Name",Icons.arrow_drop_down , false),

                    Container(
                        margin: const EdgeInsets.only(left:24,top: 25,bottom:5 ),
                        child:Text("Upload Photos",style: TextStyle(fontSize: 20,),)),
                    Center(
                      child:Container(
                        margin: const EdgeInsets.only(top:5,bottom: 10),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                          children: [
                        InkWell(
                        onTap:(){
                     showModalBottomSheet(context: context, builder: ((builder)=>bottomSheet1()),);
                      },
                          child:Container(
                              height:100 ,
                              width: 170,
                             child:_image1!=null?Image.file(_image1!.absolute): Center(child: Icon(Icons.photo,size: 35,color:Colors.grey ,)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border:Border.all(
                                    color: Color(0xffFFB330)
                                ) ,
                              ),
                            )),
                            Container(
                                margin: const EdgeInsets.only(top:5),
                                child:Text("Front Cover",style: TextStyle(fontSize:18,color:Colors.grey),)),
                            Center(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  height: 30,
                                  width: 100,
                                  child:OutlinedButton(
                                      style:  OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              color: Color(0xffFFB330),
                                              width: 1.0
                                          ),
                                          backgroundColor: Color(0xffFFC558),
                                          foregroundColor:  Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5)
                                          )
                                      ),
                                      onPressed: () {_uploadImage();},
                                      child: const Text("Upload")),))
                          ]),
                            Column(
                              children: [
                                InkWell(
                                  onTap:(){
                                      showModalBottomSheet(context: context, builder: ((builder)=>bottomSheet2()),);

                                  },
                                    child: Container(
                              height:100 ,
                              width: 170,
                                      child:_image2!=null?Image.file(_image2!.absolute):Center(child: Icon(Icons.photo,size: 35,color:Colors.grey ,)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border:Border.all(
                                    color: Color(0xffFFB330)
                                ) ,
                              ),
                            )),
                                Container(
                                    margin: const EdgeInsets.only(top:5),
                                    child:Text("Back Cover",style: TextStyle(fontSize:18,color:Colors.grey),)),
                                Center(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      height: 30,
                                      width: 100,
                                      child:OutlinedButton(
                                          style:  OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  color: Color(0xffFFB330),
                                                  width: 1.0
                                              ),
                                              backgroundColor: Color(0xffFFC558),
                                              foregroundColor:  Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5)
                                              )
                                          ),
                                          onPressed: () {_uploadImage();},
                                          child: const Text("Upload")),))
                          ])
                        ])
                    )
                    ),
                    Center(
                        child:Container(
                            margin: const EdgeInsets.only(top:5,bottom: 10),
                            child:Row(
                                children: [
                                        Container(
                                            margin: const EdgeInsets.only(left:24,top: 25,bottom:5 ),
                                            child:Text("Printed Price",style: TextStyle(fontSize: 20,color:Colors.red ),)),
                        Center(
                            child:Container(
                                margin: const EdgeInsets.only(left:50,top:25,bottom:5),
                                height: 48,
                                width: 200,
                                child:TextField(
                                    controller: PrintPrice,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: "Price",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffFFB330))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffFFB330))),
                                    )
                                )
                            ))
                                      ])
                        )
                    ),
                    Center(
                        child:Container(
                            margin: const EdgeInsets.only(top:5,bottom: 10),
                            child:Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(left:24,top: 25,bottom:5 ),
                                      child:Text("Selling Price",style: TextStyle(fontSize: 20,color:Colors.green ),)),
                                  Center(
                                      child:Container(
                                          margin: const EdgeInsets.only(left:50,top:25,bottom:5),
                                          height: 48,
                                          width: 200,
                                          child:TextField(
                                              controller: SellingPrice,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: "Price",
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Color(0xffFFB330))),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Color(0xffFFB330))),
                                              )
                                          )
                                      ))
                                ])
                        )
                    ),
                    Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 48,
                          width: 300,
                          child:OutlinedButton(
                              style:  OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: Color(0xffFFB330),
                                      width: 1.0
                                  ),
                                  backgroundColor: Color(0xffFFC558),
                                  foregroundColor:  Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                  )
                              ),
                              onPressed: () {postbook(BookName.text.toString(), BookDescription.text.toString(), BookCondition.text.toString(), Publication.text.toString(), Author.text.toString(), PrintPrice.text.toString(), SellingPrice.text.toString());},
                              child: const Text("Submit")),))
                  ]),
              ),
                )
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                      height: 75,
                      width: screenwidth,
                      color: Colors.white,
                      child:Center(
                          child:Container(
                            width: 395,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              color: Color(0xffFFD77F),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) =>
                                                    categoriesPage()));
                                          },
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            child: Image.asset(
                                              "assets/images/categories.png",),),),
                                        Text('categories'.tr,
                                            style: TextStyle(fontSize: 12, color: Color(
                                                0xff3D4652)))
                                      ]),),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Column(
                                      children: [InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) => orderPage()));
                                          },
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            child: Image.asset(
                                              "assets/images/package.png",),)),
                                        Text('orders'.tr,
                                            style: TextStyle(fontSize: 12, color: Color(
                                                0xff3D4652)))
                                      ]),),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          homePage()));
                                            },
                                            child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: Icon(Icons.home, size: 32,
                                                    color: Color(0xff3D4652)))),
                                        Text('home'.tr,
                                            style: TextStyle(fontSize: 12, color: Color(
                                                0xff3D4652)))
                                      ]),),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Column(
                                      children: [InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) =>
                                                    shopkeeperPage()));
                                          },
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            child: Image.asset(
                                              "assets/images/merchant.png",),)),
                                        Text('shopkeepers'.tr,
                                            style: TextStyle(fontSize: 12, color: Color(
                                                0xff3D4652)))
                                      ]),),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          sellPage()));
                                            },
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              child: Image.asset(
                                                "assets/images/sell.png",),)),
                                        Text('sell'.tr,
                                            style: TextStyle(fontSize: 12, color: Color(
                                                0xff3D4652)))
                                      ]),),
                              ],
                            ),
                          )
                      )
                  )
              )
            ])

    );
  }
}
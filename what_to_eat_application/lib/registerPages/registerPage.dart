// ignore_for_file: deprecated_member_use, file_names, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:what_to_eat_application/model/register_model.dart';
import 'package:what_to_eat_application/pages/homePage/homePage.dart';
import 'package:what_to_eat_application/pages/login_page.dart';
import 'package:what_to_eat_application/service/rest_api.dart';

import 'package:what_to_eat_application/utilities/dataUtilites.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final List<TextEditingController> _controllers = [];

  //registerPage.dart<DynamicWidget> listDynamic = [];
  List<RegiterData> listRegiterData = [];
  List<String> data = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  //TextEditingController mailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

  //    "user": listRegiterData[0].textData,
  // "password": listRegiterData[1].textData,
  // "fname": listRegiterData[2].textData,
  // "lname": listRegiterData[3].textData,
  // "email": listRegiterData[4].textData,
  // "phone": listRegiterData[5].textData

    listRegiterData.add(RegiterData("User", FontAwesomeIcons.user, 0));
    listRegiterData.add(RegiterData("Password ", FontAwesomeIcons.idCard, 0));
    listRegiterData.add(RegiterData("First Name", FontAwesomeIcons.idCard, 0));
    listRegiterData.add(RegiterData("Last Name", FontAwesomeIcons.unlockAlt, 0));
    listRegiterData
        .add(RegiterData("Email", FontAwesomeIcons.mobileAlt, 0));
    listRegiterData.add(RegiterData("Phone", FontAwesomeIcons.envelope, 0));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: mainDarkColor,
      appBar: AppBar(
        title: Text(
          'Create an Account',
          style: TextStyle(color: mainLightColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: mainLightColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(
                    color: mainLightColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FontAwesomeIcons.userPlus,
                    color: mainDarkColor,
                    size: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: listRegiterData.length,
                              itemBuilder: (_, index) {
                                var data = listRegiterData[index];

//listDynamic.add(DynamicWidget(data.name, FontAwesomeIcons.user ,index));
                                // var index = 0;
// if (data.checkFlag == "A") {
//   return Card(
//                   elevation: 8.0,
//                   child: Container(
//                     child: customTextField(data.name, FontAwesomeIcons.user ,index),
//                   ),
//                 );
// }else{
                                return Card(
                                  elevation: 8.0,
                                  child: Container(
                                      child: singleItemList(
                                    index,
                                  )),
                                );
//}
                              }),
                        ],
                      ),

                      // customTextField(' Usename', FontAwesomeIcons.user),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // customTextField(' First Name', FontAwesomeIcons.idCard),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // customTextField(' Last Name', FontAwesomeIcons.idCard),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // customTextField('Password', FontAwesomeIcons.unlockAlt),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // customTextField(
                      //     'Retype Password', FontAwesomeIcons.unlockAlt),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // customTextField(
                      //     'Phone Number', FontAwesomeIcons.mobileAlt),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // customTextField('Email', FontAwesomeIcons.envelope),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: RaisedButton(
                          onPressed: () {

                             _regsiter(listRegiterData);

                            listRegiterData.forEach((element) {
                              print(element.textData);
                            });
                            data = [];
                            // listDynamic.forEach(
                            //     (widget){
                            //       data.add(widget.controller.text);

                            //       print("dataText" +widget.controller.text);

                            //     }

                            //     );
                           

                           
                            print(data.length);
                          },
                          color: darkGreenColor,
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: mainDarkColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Have An  Account?',
                            style: TextStyle(color: mainLightColor),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(color: darkGreenColor),
                                textAlign: TextAlign.start,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

   
  }

   // ignore: unused_element, dead_code
    void _regsiter(List<RegiterData> listRegiterData) async {
     
      //แสดง Loading
      setState(() {
        // _isLoading = true ;
      });
    
      var regData = {
    "user": listRegiterData[0].textData,
  "password": listRegiterData[1].textData,
  "fname": listRegiterData[2].textData,
  "lname": listRegiterData[3].textData,
  "email": listRegiterData[4].textData,
  "phone": listRegiterData[5].textData
      };

      print(regData);

  

      var response = await CallAPI().postData(regData, "post/postregister.php");
      var body = json.decode(response.body);

        Fluttertoast.showToast(
        msg: body['status_message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    

      if (body['status_message'] != "Failed") {
        setState(() {
          // _isLoading = false ;
        });
        print(' success');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        setState(() {
          //  _isLoading = false ;
        });
        // ignore: avoid_print
        print('login fail');
      }

      print(body);
    }

//   Widget customTextField(String hint, IconData icon,  int index ) {
//     print(index);

//   TextEditingController controller = new TextEditingController();

//     return TextField(

//      controller:  controller,
//       style: TextStyle(color: Colors.white),
//       cursorColor: mainDarkColor,
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         focusedBorder: InputBorder.none,
//         enabledBorder: InputBorder.none,
//         errorBorder: InputBorder.none,
//         disabledBorder: InputBorder.none,
//         fillColor: mainLightColor,
//         filled: true,
//         icon: Icon(
//           icon,
//           color: mainLightColor,
//         ),
//         hintText: hint,
//         hintStyle: TextStyle(color: mainDarkColor),
//         labelStyle: TextStyle(color: darkGreenColor),
//       ),
//     );
//   }

  Widget singleItemList(int index) {
    RegiterData item = listRegiterData[index];

    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: (text) {
          listRegiterData[index].textData = text;
          //takeNumber(text, item.indexP);
          print(text);
        },

        // controller: controller,
        style: TextStyle(color: Colors.black),
        cursorColor: mainDarkColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: mainLightColor,
          filled: true,
          icon: Icon(
            item.iconData,
            color: mainDarkColor,
          ),
          hintText: item.name,
          hintStyle: TextStyle(color: mainDarkColor),
          labelStyle: TextStyle(color: darkGreenColor),
        ),
      ),
    );
  }

  void takeNumber(String text, int itemId) {
    try {
      int number = int.parse(text);
      listRegiterData[itemId] = number as RegiterData;
      // print(text );
    } on FormatException {}
  }
}

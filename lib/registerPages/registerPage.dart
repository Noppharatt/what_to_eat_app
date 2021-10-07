import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:what_to_eat_application/pages/login_page.dart';

import 'package:what_to_eat_application/utilities/dataUtilites.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      customTextField(' Usename', FontAwesomeIcons.user),
                      SizedBox(
                        height: 10,
                      ),
                      customTextField(' First Name', FontAwesomeIcons.idCard),
                      SizedBox(
                        height: 10,
                      ),
                      customTextField(' Last Name', FontAwesomeIcons.idCard),
                      SizedBox(
                        height: 10,
                      ),
                      customTextField('Password', FontAwesomeIcons.unlockAlt),
                      SizedBox(
                        height: 10,
                      ),
                      customTextField(
                          'Retype Password', FontAwesomeIcons.unlockAlt),
                      SizedBox(
                        height: 10,
                      ),
                      customTextField(
                          'Phone Number', FontAwesomeIcons.mobileAlt),
                      SizedBox(
                        height: 10,
                      ),
                      customTextField('Email', FontAwesomeIcons.envelope),
                      SizedBox(
                        height: 10,
                      ),
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
                          onPressed: () {},
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

  Widget customTextField(String hint, IconData icon) {
    return TextField(
      style: TextStyle(color: Colors.white),
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
          icon,
          color: mainLightColor,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: mainDarkColor),
        labelStyle: TextStyle(color: darkGreenColor),
      ),
    );
  }
}

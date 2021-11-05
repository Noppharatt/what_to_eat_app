import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_eat_application/utilities/customDrawer.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainLightColor,
      appBar: AppBar(
        title: Text(
          'Welcome To My Account',
          style: TextStyle(color: mainLightColor),
        ),
        centerTitle: true,
        backgroundColor: mainDarkColor,
        elevation: 0,
        iconTheme: IconThemeData(color: mainLightColor),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: mainDarkColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FontAwesomeIcons.userEdit,
                    color: mainLightColor,
                    size: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      customTextField('Name'),
                      SizedBox(
                        height: 10,
                      ),
                      customTextField('user'),
                      SizedBox(
                        height: 10,
                      ),
                      customTextField('tel'),
                      SizedBox(
                        height: 10,
                      ),
                      customTextField('email'),
                      SizedBox(
                        height: 10,
                      ),
                      // customTextField('+20683573578'),
                      // SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.edit,
                                color: mainLightColor,
                                size: 15,
                              ),
                              label: Text(
                                'Edit',
                                style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    color: mainLightColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                              color: mainDarkColor,
                            ),
                            FlatButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.save,
                                color: mainLightColor,
                                size: 15,
                              ),
                              label: Text('Save ',
                                  style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      color: mainLightColor,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none)),
                              color: mainDarkColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField(String hint) {
    return TextField(
      style: TextStyle(color: Colors.white),
      cursorColor: mainLightColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        fillColor: mainDarkColor,
        filled: true,
        hintText: hint,
        hintStyle: TextStyle(color: mainLightColor),
        labelStyle: TextStyle(color: darkGreenColor),
      ),
    );
  }
}

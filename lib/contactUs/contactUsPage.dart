import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_eat_application/utilities/customDrawer.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  //The controls of Text Editing
  TextEditingController nameTextControl = TextEditingController();
  TextEditingController phoneTextControl = TextEditingController();
  TextEditingController messageTitleTextControl = TextEditingController();
  TextEditingController contentTextControl = TextEditingController();

  @override
  void dispose() {
    nameTextControl.dispose();
    phoneTextControl.dispose();
    messageTitleTextControl.dispose();
    contentTextControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Contact Us Now '),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _createImageCard(),
            _contactUSCard(),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "You can Fil the upper form or contact us fast with our social Media links, click and contact US Fast",
                  style: GoogleFonts.roboto(fontSize: 18),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            _createCircleBtn(),
          ],
        ),
      ),
    );
  }

  Widget _createImageCard() {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: InkWell(
              child: Container(
                height: 150,
                child: Image.asset(
                  "assets/images/contact.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactUSCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextField('Enter Your Name', nameTextControl, 1),
        customTextField('Enter Your Phone Number', phoneTextControl, 1),
        customTextField('Enter Your Message Title', messageTitleTextControl, 1),
        customTextField('Enter Your Message Content', contentTextControl, 4),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width * 0.65,
            child: RaisedButton(
              onPressed: () {},
              color: mainDarkColor,
              elevation: 5,
              child: FlatButton.icon(
                  onPressed: () {
                    //Call Us via email
                  },
                  icon: Icon(
                    Icons.email,
                    color: darkGreenColor,
                  ),
                  label: Text(
                    'Send Via Email',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: darkGreenColor),
                  )),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget customTextField(
      String hitName, TextEditingController textEditingControl, int maxLine) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 8),
      child: Container(
          child: TextField(
        maxLines: maxLine,
        controller: textEditingControl,
        decoration: InputDecoration(
          hoverColor: mainDarkColor,
          focusColor: mainDarkColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: mainDarkColor),
          ),
          labelText: hitName,
          labelStyle: TextStyle(color: mainDarkColor),
        ),
      )),
    );
  }

  Widget _createCircleBtn() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: mainDarkColor, // button color
                      child: InkWell(
                        splashColor: Colors.redAccent, // inkwell color
                        child: SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(
                              FontAwesomeIcons.youtube,
                              color: Colors.white,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Youtube",
                      style: GoogleFonts.roboto(fontSize: 13),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: mainDarkColor, // button color
                      child: InkWell(
                        splashColor: Colors.redAccent, // inkwell color
                        child: SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(
                              Icons.airplay,
                              color: Colors.white,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Website ",
                      style: GoogleFonts.roboto(fontSize: 13),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: mainDarkColor, // button color
                      child: InkWell(
                        splashColor: Colors.redAccent, // inkwell color
                        child: SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Instagram",
                      style: GoogleFonts.roboto(fontSize: 13),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: mainDarkColor, // button color
                        child: InkWell(
                          splashColor: Colors.redAccent, // inkwell color
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                FontAwesomeIcons.snapchat,
                                color: Colors.white,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "SnapChat",
                        style: GoogleFonts.roboto(fontSize: 13),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: mainDarkColor, // button color
                        child: InkWell(
                          splashColor: Colors.redAccent, // inkwell color
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                FontAwesomeIcons.twitter,
                                color: Colors.white,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Twitter",
                        style: GoogleFonts.roboto(fontSize: 13),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: mainDarkColor, // button color
                        child: InkWell(
                          splashColor: Colors.redAccent, // inkwell color
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                FontAwesomeIcons.facebook,
                                color: Colors.white,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Facebook",
                        style: GoogleFonts.roboto(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              children: <Widget>[
                Text(
                  "All copy Reserved by Coodes.org",
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.black),
                ),
                InkWell(
                  child: Text(
                    "Coodes Team",
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: Color(0xFF6240BF)),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

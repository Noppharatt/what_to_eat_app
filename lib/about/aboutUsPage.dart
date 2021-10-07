import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_eat_application/utilities/customDrawer.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("About Coodes Blog"),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Our Partners ',
                style: TextStyle(
                    color: mainDarkColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: partnerLogosUrl.length,
                  itemBuilder: (context, index) {
                    return _partnerCard(index);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Our Vision ',
                style: TextStyle(
                    color: mainDarkColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 18),
                child: Text(
                  articleContent,
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: mainDarkColor,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.justify,
                )),
          ],
        ),
      ),
    );
  }

  Widget _partnerCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 82,
            width: 82,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: mainDarkColor)),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(partnerLogosUrl[index]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: mainLightColor)),
            ),
          ),
        ],
      ),
    );
  }
}

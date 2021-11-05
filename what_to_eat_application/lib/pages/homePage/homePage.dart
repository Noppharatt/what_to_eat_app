// ignore: file_names
// ignore_for_file: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_eat_application/article/articlePage.dart';
// import 'package:modern_blog_ui/registerPages/login.dart';
import 'package:what_to_eat_application/utilities/customDrawer.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final List<String> imageList = [
  "assets/images/NewProject.png",
  "assets/images/qr.png",
];

class _HomePageState extends State<HomePage> {
  get imageList => null;

  @override
  // void initState() {
  //   super.initState();
  //   checkLoginStatus();
  // }

  // checkLoginStatus() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   if (sharedPreferences.getString("token") == null) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (BuildContext context) => Login()),
  //         (Route<dynamic> route) => false);
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainLightColor,
        appBar: customAppBar('What to eat'),
        drawer: CustomDrawer(),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            new Image.asset(
              'assets/images/NewProject.png',
              fit: BoxFit.cover,
            ),
            Divider(),
            new Image.asset(
              'assets/images/qr.png',
              fit: BoxFit.cover,
            ),
          ],
        ));
    // body: ListView(

    //   children: <Widget>[

    //     // Padding(
    //     //   padding: const EdgeInsets.all(8.0),
    //     //   child: Text(
    //     //     'Top New Stories ',
    //     //     style: TextStyle(
    //     //         color: DataUtilities.mainDarkColor,
    //     //         fontSize: 20,
    //     //         fontWeight: FontWeight.bold),
    //     //   ),
    //     // ),
    //     // Container(
    //     //   height: MediaQuery.of(context).size.height * 0.12,
    //     //   child: ListView(
    //     //     scrollDirection: Axis.horizontal,
    //     //     shrinkWrap: true,
    //     //     children: <Widget>[
    //     //       _storyCard(1),
    //     //       _storyCard(5),
    //     //       _storyCard(0),
    //     //       _storyCard(2),
    //     //       _storyCard(4),
    //     //       _storyCard(3),
    //     //       _storyCard(1),
    //     //     ],
    //     //   ),
    //     // ), -เป็นส่วนสตอรี่ข้างบน

    //     const Padding(
    //       padding: EdgeInsets.only(left: 18.0, right: 18),
    //       child: Divider(),
    //     ),
    //     Container(
    //       height: MediaQuery.of(context).size.height * 0.09,
    //       child: ListView(
    //         scrollDirection: Axis.horizontal,
    //         shrinkWrap: true,
    //         children: <Widget>[
    //           // _filterCard("Today", FontAwesomeIcons.calendarDay),
    //           // _filterCard("Last Week", FontAwesomeIcons.calendarWeek),
    //           // _filterCard("Last Month", FontAwesomeIcons.calendar),
    //         ],
    //       ),
    //     ),
    //     // Padding(
    //     //   padding: const EdgeInsets.only(left: 8.0),
    //     //   child: Text(
    //     //     'Articles ',
    //     //     style: TextStyle(
    //     //         color: DataUtilities.mainDarkColor,
    //     //         fontSize: 20,
    //     //         fontWeight: FontWeight.bold),
    //     //   ),
    //     // ),
    //     // Container(
    //     //   height: MediaQuery.of(context).size.height * 0.60,
    //     //   child: ListView(
    //     //     scrollDirection: Axis.vertical,
    //     //     physics: ClampingScrollPhysics(),
    //     //     children: <Widget>[
    //     //       _articleCard(DataUtilities.imageUrlCollection[4],
    //     //           'New Dell Devices', 'Technology', 4),
    //     //       _articleCard(DataUtilities.imageUrlCollection[1],
    //     //           'Classic Car Events', 'Sport', 1),
    //     //       _articleCard(DataUtilities.imageUrlCollection[6],
    //     //           'Big Team For Android', 'Technology', 6),
    //     //       _articleCard(DataUtilities.imageUrlCollection[2],
    //     //           'New App Applications', 'Technology', 2),
    //     //       _articleCard(DataUtilities.imageUrlCollection[3],
    //     //           '2020 Apple keyword', 'Technology', 3),
    //     //       _articleCard(DataUtilities.imageUrlCollection[5],
    //     //           'Good Child Camera Shot', 'Art', 5),
    //     //       _articleCard(DataUtilities.imageUrlCollection[0],
    //     //           'Praktika Camera', 'Art', 0),
    //     //     ],
    //     //   ),
    //     // ),
    //   ],
    // ),
  }

  //Start the custom cards and Fields

  Widget _filterCard(String title, IconData myIcon) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              color: mainDarkColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  myIcon,
                  color: darkGreenColor,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: darkGreenColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _articleCard(
      String imageUrl, String title, String categoryTitle, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 5, top: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleDetailsPage(index)));
        },
        child: Container(
          decoration: BoxDecoration(
            color: mainLightColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: mainDarkColor.withOpacity(0.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: mainLightColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(categoryTitle,
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  color: mainLightColor,
                                )),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.bookmark,
                                color: mainLightColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

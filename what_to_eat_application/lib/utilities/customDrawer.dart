// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:what_to_eat_application/about/aboutUsPage.dart';
import 'package:what_to_eat_application/contactUs/contactUsPage.dart';

// import 'package:what_to_eat_application/favouritePage/favouritePage.dart';

import 'package:what_to_eat_application/myAccount/myAccountPage.dart';
import 'package:what_to_eat_application/pages/BMR/bmrPage.dart';
import 'package:what_to_eat_application/pages/categories/categoriesPage.dart';
import 'package:what_to_eat_application/pages/function/randomfood.dart';
import 'package:what_to_eat_application/pages/homePage/homePage.dart';
// import 'package:what_to_eat_application/notification/notificationPage.dart';
import 'package:what_to_eat_application/pages/login_Page.dart';
import 'package:what_to_eat_application/pages/map/map_screen.dart';
import 'package:what_to_eat_application/pages/map/simpleUsageMap.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: use_key_in_widget_constructors
class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: mainDarkColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Social Media',
                    style: TextStyle(
                        color: mainLightColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.twitter,
                          size: 20,
                          color: darkGreenColor,
                        ),
                        Icon(
                          FontAwesomeIcons.instagram,
                          size: 20,
                          color: darkGreenColor,
                        ),
                        Icon(
                          FontAwesomeIcons.facebook,
                          size: 20,
                          color: darkGreenColor,
                        ),
                        Icon(
                          FontAwesomeIcons.snapchat,
                          size: 20,
                          color: darkGreenColor,
                        ),
                        Icon(
                          FontAwesomeIcons.telegram,
                          size: 20,
                          color: darkGreenColor,
                        ),
                        Icon(
                          FontAwesomeIcons.globe,
                          size: 20,
                          color: darkGreenColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: ListTile(
                title: _menuItem('HOME', FontAwesomeIcons.home),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategoriesPage()));
              },
              child: ListTile(
                title: _menuItem('RANDOM FOOD', FontAwesomeIcons.random),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => MyAccountPage()));
            //   },
            //   child: ListTile(
            //     title: _menuItem('My Account', FontAwesomeIcons.userCircle),
            //   ),
            // ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MapStoreLayoutScreen()));

                //   Navigator.push(context,
                // MaterialPageRoute(builder: (context) => SimpleUsage()));
              },
              child: ListTile(
                title: _menuItem('MAP', FontAwesomeIcons.mapMarkedAlt),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BMRlayoutPage()));
              },
              child: ListTile(
                title: _menuItem('FUNCTION', FontAwesomeIcons.fan),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: ListTile(
                title: _menuItem('LOGIN', FontAwesomeIcons.signInAlt),
              ),
            ),

            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => NotificationPage()));
            //   },
            //   child: ListTile(
            //     title: _menuItem('Notifications', FontAwesomeIcons.bell),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => AboutUsPage()));
            //   },
            //   child: ListTile(
            //     title: _menuItem('About', FontAwesomeIcons.bookReader),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => ContactUsPage()));
            //   },
            //   child: ListTile(
            //     title: _menuItem('Contact Us', FontAwesomeIcons.envelope),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: mainLightColor,
                size: 20,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                    color: mainLightColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 160, left: 40),
            child: Divider(
              color: darkGreenColor,
            ),
          ),
        ],
      ),
    );
  }
}

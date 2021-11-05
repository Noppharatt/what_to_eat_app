// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:what_to_eat_application/service/rest_api.dart';
// import 'package:modern_blog_ui/categories/categoriesPosts.dart';
import 'package:what_to_eat_application/utilities/customDrawer.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'detailPage.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // var matchth;
  // Future<Null> getUsers() async {
  //   try {
  //     final response = await http
  //         .get('https://whatteat.000webhostapp.com/api/getdataprofile.php');

  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       print(jsonResponse);
  //       setState(() {
  //         //matchth[index]['league']['name'];

  //         matchth = jsonResponse['Firstname'];
  //         // print("debug");
  //         // print("xxxxxxxxxxx" + matchth);
  //         // print("debug");
  //         print(matchth.length);
  //       });
  //     } else {
  //       print("Data you lose");
  //     }
  //   } catch (e) {
  //     e.toString();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainLightColor,
      appBar: customAppBar('RANDOMFOOD'),
      drawer: CustomDrawer(),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
            itemCount: categoryTitles.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        _getRandomFoot(2);
                        break;
                      case 1:
                        _getRandomFoot(1);
                        break;
                      case 2:
                        _getRandomFoot(9);
                        break;
                      case 3:
                        _getRandomFoot(3);
                        break;
                      case 4:
                        _getRandomFoot(8);
                        break;
                      case 5:
                        _getRandomFoot(8);
                        break;
                      case 6:
                        _getRandomFoot(8);
                        break;
                      case 7:
                        _getRandomFoot(8);
                        break;

                      default:
                        _getRandomFoot(1);
                    }

                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             DetailPage()));

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             CategoriesPosts(categoryTitles[index])));
                  },
                  child: _categoryCard(
                      categoryImages[index], categoryTitles[index]));
            }),
      ),
    );
  }

  Widget _categoryCard(
    String imageUrl,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 5, top: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF7F6FB),
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
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: mainDarkColor.withOpacity(0.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: GoogleFonts.roboto(
                          fontSize: 30,
                          color: mainLightColor,
                          fontWeight: FontWeight.bold),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 8.0),
                    //       child: Text(postNumbers + " Posts",
                    //           style: GoogleFonts.roboto(
                    //             fontSize: 15,
                    //             color: DataUtilities.mainLightColor,
                    //           )),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _getRandomFoot(int i) async {
    //แสดง Loading
    setState(() {
      // _isLoading = true ;
    });

    //   print(categoriesID);
    var categoriesIDData = {
      'CategoriesID': "$i",
    };
    var response = await CallAPI().getRandomFood(categoriesIDData);
    print(response.menu);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailPage(reqRandomFoodModel: response)));
  }
}

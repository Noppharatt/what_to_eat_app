import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_eat_application/article/articlePage.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CategoriesPosts extends StatefulWidget {
  final String categoryTitle;

  CategoriesPosts(this.categoryTitle);

  @override
  _CategoriesPostsState createState() => _CategoriesPostsState();
}

class _CategoriesPostsState extends State<CategoriesPosts> {
  // @override
  var matchth;
  Future<Null> getUsers() async {
    try {
      var url = Uri.parse(
          "https://whatteat.000webhostapp.com/api/getdataprofile.php");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        setState(() {
          //matchth[index]['league']['name'];

          matchth = jsonResponse['Firstname'];
          // print("debug");
          // print("xxxxxxxxxxx" + matchth);
          // print("debug");
          print(matchth.length);
        });
      } else {
        print("Data you lose");
      }
    } catch (e) {
      e.toString();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainLightColor,
      appBar: customAppBar(widget.categoryTitle + ' Posts'),
      body: Container(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.03,
                child: Text('Last Article Added from 2 days',
                    style: GoogleFonts.roboto(
                        fontSize: 15,
                        color: mainDarkColor,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.85,
                child: ListView.builder(
                    itemCount: imageUrlCollection.length,
                    itemBuilder: (context, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ArticleDetailsPage(index)));
                          },
                          child: _articleCard(
                            imageUrlCollection[index],
                            'The next generation of our icon library + toolkit',
                            categoryPostTitles[index],
                            categoryTitlesDouble[index],
                          ));
                    })),
          ],
        ),
      ),
    );
  }

  Widget _articleCard(
    String imageUrl,
    String articleDescription,
    String title,
    String categoryName,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 3.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: grayBgColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: mainDarkColor,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(categoryName,
                      style: GoogleFonts.roboto(
                          fontSize: 11,
                          color: mainDarkColor,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(articleDescription,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: grayColor,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

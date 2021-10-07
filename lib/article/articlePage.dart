import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';

class ArticleDetailsPage extends StatefulWidget {
  final int articleIndex;

  ArticleDetailsPage(this.articleIndex);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: mainDarkColor,
      child: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage(imageUrlCollection[widget.articleIndex]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: AppBar(
                  title: Text(categoryPostTitles[widget.articleIndex]),
                  centerTitle: false,
                  backgroundColor: mainDarkColor.withOpacity(0.2),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timer,
                            color: darkGreenColor,
                            size: 20,
                          ),
                          SizedBox(width: 3),
                          Text(
                            '20 Dec 2021 ',
                            style: GoogleFonts.roboto(
                                fontSize: 10,
                                color: darkGreenColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.bookmark,
                          color: mainLightColor,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.share,
                          color: mainLightColor,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8),
            child: Text(
              'Video',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: mainLightColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _videoCard(imageUrlCollection[widget.articleIndex]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Container(
                height: 300,
                child: SingleChildScrollView(
                    child: Text(
                  articleContent,
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: mainLightColor,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.justify,
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8),
            child: Text(
              'Attach Links',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: darkGreenColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.link,
                      color: mainLightColor,
                      size: 15,
                    ),
                    label: Text('Link #1 ',
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            color: mainLightColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none))),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.link,
                      color: mainLightColor,
                      size: 15,
                    ),
                    label: Text('Link #2 ',
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            color: mainLightColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none))),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.link,
                      color: mainLightColor,
                      size: 15,
                    ),
                    label: Text('Link #3 ',
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            color: mainLightColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _videoCard(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.playCircle,
                  color: darkGreenColor,
                  size: 50,
                ),
                label: Text(''))
          ],
        ),
      ),
    );
  }
}

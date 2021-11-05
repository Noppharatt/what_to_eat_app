// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:what_to_eat_application/model/reqRandomFoodModel.dart';

class TitlePriceRating extends StatelessWidget {
  final ReqRandomFoodModel  reqRandomFoodModel ;
  final int price, numOfReviews;
  final double rating;
  //final String name;
  final RatingChangeCallback onRatingChanged;
  const TitlePriceRating({
    Key key,
    this.price,
    this.numOfReviews,
    this.rating,
  //  this.name,
    this.onRatingChanged,
    this.reqRandomFoodModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  reqRandomFoodModel.menu,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SmoothStarRating(
                      borderColor: Colors.amberAccent,
                      rating: rating,
                    //  onRatingChanged: onRatingChanged,
                    ),
                    SizedBox(width: 10),
                    Text("$numOfReviews reviews"),
                  ],
                ),
              ],
            ),
          ),
          priceTag(context, price: reqRandomFoodModel.price),
        ],
      ),
    );
  }

  ClipPath priceTag(BuildContext context, {String price}) {
    return ClipPath(
      clipper: PricerCliper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 66,
        width: 65,
        color: Colors.yellow,
        child: Text(
          "$price บาท",
          style: Theme.of(context)
              .textTheme
               .bodyText1
              .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
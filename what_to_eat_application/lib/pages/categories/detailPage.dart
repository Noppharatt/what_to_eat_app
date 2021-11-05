// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:what_to_eat_application/model/reqRandomFoodModel.dart';
import 'package:what_to_eat_application/pages/map/map_screen.dart';

import 'OrderButton.dart';
import 'TitlePriceRating.dart';

class DetailPage extends StatefulWidget {
  final ReqRandomFoodModel reqRandomFoodModel;

  DetailPage({
    Key key,
    @required this.reqRandomFoodModel,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // final todo = ModalRoute.of(context)?.settings.arguments as ReqRandomFoodModel;
    print(widget.reqRandomFoodModel.menu);

    return Scaffold(

        // backgroundColor: kPrimaryColor,
        appBar: detailsAppBar(widget.reqRandomFoodModel.menu, context),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 10.0),
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new NetworkImage(
                        "${widget.reqRandomFoodModel.restImg}"),
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
              child: ItemInfo(reqRandomFoodModel: widget.reqRandomFoodModel),
            ),
          ],
        ));
  }
}

detailsAppBar(String menu, [BuildContext context]) {
  return AppBar(
    title: Text(menu),
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/share.svg"),
        onPressed: () {},
      ),
      IconButton(
        icon: SvgPicture.asset("assets/icons/google-map.svg"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MapStoreLayoutScreen()));
        },
      ),
    ],
  );
}

class ItemInfo extends StatelessWidget {
  final ReqRandomFoodModel reqRandomFoodModel;

  const ItemInfo({Key key, @required this.reqRandomFoodModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                shopeName(name: reqRandomFoodModel.restaurantName),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.calculate,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "จำนวนแคลอรี่ : ${reqRandomFoodModel.calorie}",
                        style: TextStyle(
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                TitlePriceRating(
                    numOfReviews: 24,
                    rating: 4,
                    price: 15,
                    onRatingChanged: (value) {},
                    reqRandomFoodModel: reqRandomFoodModel),
                Text(
                  reqRandomFoodModel.menuDetails,
                  style: TextStyle(
                    height: 1.5,
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                Text(
                  reqRandomFoodModel.menuDetails,
                  style: TextStyle(
                    height: 1.5,
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                // Free space  10% of total height
                // OrderButton(
                //   size: size,
                //   press: () {},
                // )
                //    OrderButton(
                //    size: size,
                //   press: () {},
                //  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Row shopeName({String name}) {
  return Row(
    children: <Widget>[
      Icon(
        Icons.location_on,
        color: Colors.black,
      ),
      SizedBox(width: 10),
      Text("ร้าน $name"),
    ],
  );
}

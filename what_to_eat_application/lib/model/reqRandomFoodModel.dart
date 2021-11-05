// To parse this JSON data, do
//
//     final reqRandomFoodModel = reqRandomFoodModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ReqRandomFoodModel reqRandomFoodModelFromJson(String str) => ReqRandomFoodModel.fromJson(json.decode(str));

String reqRandomFoodModelToJson(ReqRandomFoodModel data) => json.encode(data.toJson());

class ReqRandomFoodModel {
    ReqRandomFoodModel({
        @required this.categoriesId,
        @required this.restImg,
        @required this.menu,
        @required this.restaurantName,
        @required this.menuDetails,
        @required this.price,
        @required this.calorie,
    });

    String categoriesId;
    String restImg;
    String menu;
    String restaurantName;
    String menuDetails;
    String price;
    String calorie;

    factory ReqRandomFoodModel.fromJson(Map<String, dynamic> json) => ReqRandomFoodModel(
        categoriesId: json["Categories_ID"] == null ? null : json["Categories_ID"],
        restImg: json["Rest_Img"] == null ? null : json["Rest_Img"],
        menu: json["Menu"] == null ? null : json["Menu"],
        restaurantName: json["RestaurantName"] == null ? null : json["RestaurantName"],
        menuDetails: json["Menu_Details"] == null ? null : json["Menu_Details"],
        price: json["Price"] == null ? null : json["Price"],
        calorie: json["calorie"] == null ? null : json["calorie"],
    );

    Map<String, dynamic> toJson() => {
        "Categories_ID": categoriesId == null ? null : categoriesId,
        "Rest_Img": restImg == null ? null : restImg,
        "Menu": menu == null ? null : menu,
        "RestaurantName": restaurantName == null ? null : restaurantName,
        "Menu_Details": menuDetails == null ? null : menuDetails,
        "Price": price == null ? null : price,
        "calorie": calorie == null ? null : calorie,
    };
}

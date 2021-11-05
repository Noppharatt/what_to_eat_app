// To parse this JSON data, do
//
//     final locations = locationsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Locations> locationsFromJson(String str) => List<Locations>.from(json.decode(str).map((x) => Locations.fromJson(x)));

String locationsToJson(List<Locations> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Locations {
    Locations({
        @required this.restId,
        @required this.restImg,
        @required this.restName,
        @required this.restAddress,
        @required this.restLatitude,
        @required this.restLongtitude,
    });

    String restId;
    String restImg;
    String restName;
    String restAddress;
    String restLatitude;
    String restLongtitude;

    factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        restId: json["Rest_ID"] == null ? null : json["Rest_ID"],
        restImg: json["Rest_Img"] == null ? null : json["Rest_Img"],
        restName: json["Rest_Name"] == null ? null : json["Rest_Name"],
        restAddress: json["Rest_Address"] == null ? null : json["Rest_Address"],
        restLatitude: json["Rest_Latitude"] == null ? null : json["Rest_Latitude"],
        restLongtitude: json["Rest_Longtitude"] == null ? null : json["Rest_Longtitude"],
    );

    Map<String, dynamic> toJson() => {
        "Rest_ID": restId == null ? null : restId,
        "Rest_Img": restImg == null ? null : restImg,
        "Rest_Name": restName == null ? null : restName,
        "Rest_Address": restAddress == null ? null : restAddress,
        "Rest_Latitude": restLatitude == null ? null : restLatitude,
        "Rest_Longtitude": restLongtitude == null ? null : restLongtitude,
    };
}

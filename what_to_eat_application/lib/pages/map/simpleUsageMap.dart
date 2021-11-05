// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what_to_eat_application/model/Locations.dart';
import 'package:what_to_eat_application/utilities/interactive_maps_marker.dart';

class SimpleUsage extends StatelessWidget {
  final List<MarkerItem> markers = List()
    ..add(MarkerItem(id: 1, latitude: 31.4673274, longitude: 74.2637687))
    ..add(MarkerItem(id: 2, latitude: 31.4718461, longitude: 74.3531591))
    ..add(MarkerItem(id: 3, latitude: 31.5325107, longitude: 74.3610325))
    ..add(MarkerItem(id: 4, latitude: 31.4668809, longitude: 74.31354));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Usage'),
      ),
      body: InteractiveMapsMarker(
        items: markers,
        center: LatLng(31.4906504, 74.319872),
        itemContent: (context, index) {
          MarkerItem item = markers[index];
          return BottomTile(item: item);
        },
      ),
    );
  }
}

class BottomTile extends StatelessWidget {
  const BottomTile({@required this.item , @required this.locations});

  final MarkerItem item;
  final Locations locations;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 120.0, color: Colors.red ,
            child: Image.network(locations.restImg,fit: BoxFit.fill,) ,
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(locations.restName, style: Theme.of(context).textTheme.headline5),
                  Text("${locations.restLatitude} , ${locations.restLongtitude}", style: Theme.of(context).textTheme.caption),
                  stars(),
                  Expanded(
                    child: Text("${locations.restAddress}"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row stars() {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        Icon(Icons.star, color: Colors.orangeAccent),
        Icon(Icons.star, color: Colors.orangeAccent),
        Icon(Icons.star, color: Colors.orangeAccent),
        Icon(Icons.star_half, color: Colors.orangeAccent),
        Icon(Icons.star_border, color: Colors.orangeAccent),
        SizedBox(width: 3.0),
        // ignore: prefer_const_constructors
        Text('3.5', style: TextStyle(color: Colors.orangeAccent, fontSize: 24.0, fontWeight: FontWeight.w600))
      ],
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomFood extends StatefulWidget {
  @override
  _RandomFoodState createState() => _RandomFoodState();
}

class _RandomFoodState extends State<RandomFood> {
  String data = 'https://foodish-api.herokuapp.com/api/';

   Map map;

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse(data));
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        map = json;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.yellow,
                Colors.orangeAccent,
              ])),
          child: Text('What To Eat'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
          child: map == null
              ? Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.amber,
                ))
              : Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.height,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/image.png',
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      image: map['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
      extendBodyBehindAppBar: true,
    );
  }
}

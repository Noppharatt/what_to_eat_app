import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:what_to_eat_application/model/Locations.dart';


class CallAPI {

  var baseURLAPI = "https://about.google/static/data/";

  _setHeader() =>
      {'Content-type': "application/json", 'Accept': 'application/json'};

  //login
  postData(data, apiURL) async {
    
    var fullURL = baseURLAPI + apiURL;
    var url = Uri.parse(fullURL);

    //var url = Uri.https(baseURLAPI, apiURL, {'q': '{http}'});

    return await http.post(url, body: jsonEncode(data), headers: _setHeader());
  }

  //ส่วนของการ CRUD Product
  //Get ALL Product

  Future<List<Locations>> getProducts() async {
    var fullURL = "https://whattheeat.000webhostapp.com/api/getdatamap.php?fbclid=IwAR1qyCGNpHCYUOLUnOuzclFmcV6YU4A88LbSbABi-fM4ryjI4QNbXfTTN9I";
    var url = Uri.parse(fullURL);

    final response = await http.get(url, headers: _setHeader());
    if (response.statusCode == 200) {
      return locationsFromJson(response.body);
    } else {
      List<Locations>  office = List<Locations> ();
      return office;
    }
  }

  //Create Product

}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:what_to_eat_application/model/Locations.dart';
import 'package:what_to_eat_application/model/reqRandomFoodModel.dart';
import 'package:what_to_eat_application/model/reqRegister.dart';

class CallAPI {
  var baseURLAPI = "http://128.199.109.243/api/";

  _setHeader() =>
      {'Content-type': "application/json", 'Accept': 'application/json'};

  //login
  postData(data, apiURL) async {
    var fullURL = baseURLAPI + apiURL;
    var url = Uri.parse(fullURL);

    //var url = Uri.https(baseURLAPI, apiURL, {'q': '{http}'});

    return await http.post(url, body: jsonEncode(data), headers: _setHeader());
  }

  //Create Product

  Future<bool> createProduct(ReqRegister reqRegister) async {
    var fullURL = baseURLAPI + "products";
    var url = Uri.parse(fullURL);

    final response = await http.post(url,
        headers: _setHeader(), body: reqRegisterToJson(reqRegister));

    if (response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }

  //ส่วนของการ CRUD Product
  //Get ALL Product

  Future<List<Locations>> getProducts() async {
    var fullURL = baseURLAPI +
        "getdatamap.php";
    var url = Uri.parse(fullURL);

    final response = await http.get(url, headers: _setHeader());
    if (response.statusCode == 200) {
      print(response.body);
      return locationsFromJson(response.body);
    } else {
      List<Locations> office = List<Locations>();
      return office;
    }
  }

  //Get Random Foot

  Future<ReqRandomFoodModel> getRandomFood(categoriesIDData) async {
    var fullURL = baseURLAPI + "getdatamenu.php";
    //  var fullURL =  baseURLAPI +  "getdatamenu.php?CategoriesID=$CategoriesID";
    var urlData = Uri.parse(fullURL);
    final response = await http.post(urlData,
        body: jsonEncode(categoriesIDData), headers: _setHeader());
     
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
     // var source = jsonDecode(utf8.decode(response.bodyBytes));
    //  print(source);
      //var source = json.decode(response.body);
      return reqRandomFoodModelFromJson(response.body);
    } else {
      ReqRandomFoodModel office = ReqRandomFoodModel();
      return office;
    }
  }

    //postpostbmr
  postbmr(data, apiURL) async {
    var fullURL = baseURLAPI + apiURL;
    var url = Uri.parse(fullURL);

    //var url = Uri.https(baseURLAPI, apiURL, {'q': '{http}'});

    return await http.post(url, body: jsonEncode(data), headers: _setHeader());
  }
}

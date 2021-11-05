// class SendRendomModel {
//   final String token;
  

//   SendRendomModel({ this.token});

//   factory SendRendomModel.fromJson(Map<String, dynamic> json) {
//     return LoginResponseModel(
//       token: json["token"] != null ? json["token"] : "",
     
//     );
//   }
// }

class SendReqRendomModel {
  String categoriesID;
 

  SendReqRendomModel({
     this.categoriesID,
     
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'CategoriesID': categoriesID.trim(),
      
    };

    return map;
  }
}

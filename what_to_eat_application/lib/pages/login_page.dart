import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:what_to_eat_application/api/api_service.dart';

import 'package:what_to_eat_application/model/login_model.dart';
import 'package:what_to_eat_application/registerPages/registerPage.dart';
import 'package:what_to_eat_application/service/rest_api.dart';
import 'package:what_to_eat_application/utilities/customDrawer.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';

import '../ProgressHUD.dart';
import 'homePage/homePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", password = "";

  //loading...
  bool _isLoading = false;

  bool hidePassword = true;
  bool isApiCallProcess = false;

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel(password: "", username: '');
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: mainDarkColor,
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: _isLoading
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text('กำลังตวจสอบข้อมูล')
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          margin: EdgeInsets.symmetric(
                              vertical: 85, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .hintColor
                                      .withOpacity(0.2),
                                  offset: Offset(0, 10),
                                  blurRadius: 20)
                            ],
                          ),
                          child: Form(
                            // key: globalFormKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 25),
                                Text(
                                  "Login",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                SizedBox(height: 20),
                                _bulidEmailRow(context),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: passwordController,
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor),
                                  keyboardType: TextInputType.text,
                                  onSaved: (input) =>
                                      loginRequestModel.password = input,
                                  validator: (input) => input.length < 3
                                      ? "Password should be more than 3 characters"
                                      : null,
                                  obscureText: hidePassword,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .accentColor
                                                .withOpacity(0.2))),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).accentColor)),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.4),
                                      icon: Icon(hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 80),
                                  onPressed: () {
//  Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   HomePage()));

                                    AlertDialog(
                                      title: const Text('AlertDialog Title'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'This is a demo alert dialog.'),
                                            Text(
                                                'Would you like to approve of this message?'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Approve'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );

                                    if (mailController.text != "" &&
                                        passwordController.text != "") {
                                      print(email);
                                      print(password);
                                      _login();
                                    } else {
                                      AlertDialog(
                                        title: const Text('AlertDialog Title'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Text(
                                                  'This is a demo alert dialog.'),
                                              Text(
                                                  'Would you like to approve of this message?'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Approve'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    }

                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => HomePage()));
                                    // if (validateAndSave()) {
                                    //   print(loginRequestModel.toJson());

                                    //   setState(() {
                                    //     isApiCallProcess = true;
                                    //   });

                                    //   APIService apiService = new APIService();
                                    //   apiService
                                    //       .login(loginRequestModel)
                                    //       .then((value) {
                                    //     if (value != null) {
                                    //       setState(() {
                                    //         isApiCallProcess = false;
                                    //       });

                                    //       if (value.token.isNotEmpty) {
                                    //         Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //                 builder: (context) =>
                                    //                     HomePage()));
                                    //       } else {
                                    //         final snackBar =
                                    //             SnackBar(content: Text(value.error));
                                    //         scaffoldKey.currentState!
                                    //             .showSnackBar(snackBar);
                                    //       }
                                    //     }
                                    //   });
                                    // }
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Theme.of(context).accentColor,
                                  shape: StadiumBorder(),
                                ),
                                SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, top: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Need an Account?',
                                        style: TextStyle(color: mainLightColor),
                                        textAlign: TextAlign.start,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage()));
                                          },
                                          child: Text(
                                            'Create it',
                                            style: TextStyle(
                                                color: darkGreenColor),
                                            textAlign: TextAlign.start,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  TextFormField _bulidEmailRow(BuildContext context) {
    return TextFormField(
      controller: mailController,
      keyboardType: TextInputType.text,
      onSaved: (input) => loginRequestModel.username = input,
      // validator: (input) => !input.contains('@')
      //     ? "Email Id should be valid"
      //     : null,
      decoration: InputDecoration(
        hintText: "Email Address",
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).accentColor.withOpacity(0.2))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor)),
        prefixIcon: Icon(
          Icons.email,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  // bool validateAndSave() {
  //   final form = globalFormKey.currentState;
  //   if (form.validate()) {
  //     form.save();
  //     return true;
  //   }
  //   return false;
  // }

  void _login() async {
    //สร้าง SharePrefernces
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //แสดง Loading
    setState(() {
      _isLoading = true;
    });
    //รับค่ามาเก็บลง list
    var userData = {
      'username': mailController.text,
      'password': passwordController.text
    };

    print(userData);

    //  var userData = {
    //    'email' : mailController.text ,
    //    'password' : passwordController.text
    // };

    //call api

    var response = await CallAPI().postData(userData, "post/postlogin.php");
    var body = json.decode(response.body);

    Fluttertoast.showToast(
        msg: body['status_message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    if (body['status_message'] != "Failed") {
      setState(() {
        _isLoading = false;
      });

      //สรา้งตัวแปรเก็บ shaerdPerferences
      //  sharedPreferences.setString("storeName",body['data']['name']);
      //  sharedPreferences.setString("storeEmail",body['data']['email']);

      print('login success');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      setState(() {
        _isLoading = false;
      });
      print('login fail');
      showAlertDialog(context, body['status_message'].toString());
    }

    print(body);
  }

  //Alert Dialog

  showAlertDialog(BuildContext context, String msg) {
    AlertDialog alert = AlertDialog(
      title: Text('logn Stutus'),
      content: Text(msg),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}

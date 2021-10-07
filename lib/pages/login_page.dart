import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what_to_eat_application/api/api_service.dart';
import 'package:what_to_eat_application/homePage/homePage.dart';
import 'package:what_to_eat_application/model/login_model.dart';
import 'package:what_to_eat_application/registerPages/registerPage.dart';
import 'package:what_to_eat_application/utilities/customDrawer.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';

import '../ProgressHUD.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
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
        backgroundColor: Theme.of(context).accentColor,
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ],
                    ),
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 25),
                          Text(
                            "Login",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                loginRequestModel.username = input,
                            // validator: (input) => !input.contains('@')
                            //     ? "Email Id should be valid"
                            //     : null,
                            decoration: InputDecoration(
                              hintText: "Email Address",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
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
                                      color: Theme.of(context).accentColor)),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
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
                            padding: const EdgeInsets.only(left: 18.0, top: 10),
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
                                      style: TextStyle(color: darkGreenColor),
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

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

// ignore: file_names
// ignore_for_file: deprecated_member_use, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:what_to_eat_application/service/rest_api.dart';
import 'package:what_to_eat_application/utilities/dataUtilites.dart';

class BMRlayoutPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<BMRlayoutPage> {
  int currentindex = 0 ;
  Object body;
  String bmr ;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  //  final FocusNode fname;
  // late FocusNode lname;
  // late FocusNode age;
  // late FocusNode email;
  // late FocusNode submit;

  @override
  void initState() {
    super.initState();

    bmr = "" ;
    // fname = FocusNode();
    // lname = FocusNode();
    // age = FocusNode();
    // email = FocusNode();
    // submit = FocusNode();
  }

  @override
  void dispose() {
    // fname.dispose();
    // lname.dispose();
    // age.dispose();
    // email.dispose();
    // submit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus Node',
      home: Scaffold(
          appBar: AppBar(
            title: Text("คำนวณ BMI"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Card(
                       color: Colors.red,
                          elevation: 30.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                             Image.network("https://i.pinimg.com/originals/2d/19/82/2d19827885bece6162f64c2d99099416.jpg"),
                            
                             Container(
                               alignment : Alignment.bottomCenter,
                               child: Text(
                            'เครื่องคำนวณการเผาผลาญ (BMR)',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w800,
                                color: Colors.red,
                            ),
                          ),
                             )
                          ],
                          
                        ),
                      ),
                    ),
                   SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                    redioButton("Male","assets/images/male.jpeg",Colors.blue,0),
                    redioButton("FeMale","assets/images/female.png",Colors.pink,1),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    
                    TextFormField(
                      controller: heightController,
                      autofocus: true,
                      // focusNode: fname,
                      keyboardType: TextInputType.text,
                      enabled: true,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'height',
                        hintText: 'Enter your height',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      onFieldSubmitted: (term) {
                        // fname.unfocus();
                        // FocusScope.of(context).requestFocus(lname);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // focusNode: lname,
                      controller: weightController,
                      enabled: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'weight',
                        hintText: 'Enter your weight ',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      onFieldSubmitted: (term) {
                        //  lname.unfocus();
                        //  FocusScope.of(context).requestFocus(email);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // focusNode: age,
                      controller: ageController,
                      enabled: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'age',
                        hintText: 'Enter your age',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      onFieldSubmitted: (term) {
                        //   age.unfocus();
                        //    FocusScope.of(context).requestFocus(submit);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      //  focusNode: submit,
                      onPressed: () {
                        _getBMR().then((val) {
                          if (val['status_message'] != "Failed") {
                            setState(() {
                              // _isLoading = false ;
                           var   bmrdd = val['BMR'];
                         bmr =  bmrdd.toString();
                            });
          
                            print('Successfully');
                          } else {
                            setState(() {
                              //  _isLoading = false ;
                            });
                            // ignore: avoid_print
                            print(' fail');
                          }
          
                          print(val[""]);
                        });
          
                        
                      },
                      child: Text('คำนวณ'),
                      color: Colors.lightBlueAccent,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        width: 400.0,
                        height: 200.0,
                        child: Card(
                          color: Colors.purple,
                          elevation: 30.0,
                          child: Padding(
                            padding: EdgeInsets.all(
                              14.0,
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://software.thaiware.com/upload_misc/software/2016_04/728/12509_1604142314574F_204224.png"),
                                      radius: 24.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        "BMR (kcl)",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30.0),
                                  child: Text(
                             //       !input.contains('@')
                            //     ? "Email Id should be valid"
                            //     : null
                                    bmr != null ? bmr : "กรุณากรอกใหม่" ,
                                    style: TextStyle(
                                        color: Colors.white, fontSize:  20.0),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  margin: EdgeInsets.only(top: 30.0),
                                  child: Text(
                                    "แสดงค่าที่คำนวณได้",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index ;
    });
}


  Widget redioButton(String value ,String image, Color color , int index) {
    
    return Expanded(
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: 12.0),
        child: FlatButton(
          height: 100,
          color: currentindex ==index ? color : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0) ),
          onPressed: (){
            changeIndex(index);
          },
          child: Row(
            children: [
              Image(
                image: AssetImage(image),
                height: 30,
                width: 50,),
              Text(
                value ,
                style: TextStyle(
                  color:  currentindex == index ? Colors.white : color
                ),
                ),
            ],
          ),
          ),
          
      ));
  }

  Future<dynamic> _getBMR() async {
    //แสดง Loading
    setState(() {
      // _isLoading = true ;
    });

//       {
//     "gender":"male",
//     "height":"40",
//     "weight":"2.4",
//     "age":"1"
// }

    

    var regData = {
      "gender": currentindex == 1 ? "male" : "female",
      "height": heightController.text,
      "weight": weightController.text,
      "age": ageController.text,
    };

    print(regData);

    var response = await CallAPI().postbmr(regData, "post/postbmr.php");
    return body = json.decode(response.body);
  }
}



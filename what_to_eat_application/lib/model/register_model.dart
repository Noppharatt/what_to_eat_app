import 'package:flutter/widgets.dart';

class RegiterData {
  RegiterData( this.name ,this.iconData ,this.indexP);

  final String name;
  final IconData iconData;
  final int indexP;
  String textData = "" ;
 
}

// List<RegiterData> allReg = [
//   RegiterData(name: 'user',checkFlag: 'A' ,indexP : 0 ,),
//   RegiterData(name: 'password',checkFlag: 'B' ,indexP : 1),
//   RegiterData(name: 'fname',checkFlag: 'C',indexP : 2),
//   RegiterData(name: 'lname',checkFlag: 'D' ,indexP : 3),
//   RegiterData(name: 'email',checkFlag: 'E' ,indexP : 4),
//   RegiterData(name: 'phone',checkFlag: 'F',indexP : 5),

// ];
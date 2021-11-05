import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//static final mainBgColor = Color(0xff16192e);
final mainDarkColor = Color(0xFFDF3232);
final mainLightColor = Color(0xffffffff);
//static final whiteColor = Color(0xffffffff);
final darkGreenColor = Color(0xff23d7a5);
final grayColor = const Color(0xff838696);
final grayBgColor = const Color(0xffefeef3);

const List<String> userUrlCollection = [
  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2200&q=80',
  'https://images.unsplash.com/photo-1508921340878-ba53e1f016ec?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3450&q=80',
  'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3450&q=80',
  'https://images.unsplash.com/flagged/photo-1573740144655-bbb6e88fb18a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1575&q=80',
  'https://images.unsplash.com/photo-1559526323-cb2f2fe2591b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3450&q=80',
  'https://images.unsplash.com/photo-1588144606768-3a6a1edf7729?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3455&q=80',
];

const List<String> imageUrlCollection = [
  'https://images.unsplash.com/photo-1595677117858-01579e0d4f1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3450&q=80',
  'https://images.unsplash.com/photo-1569078912320-d53ecdd8e041?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3497&q=80',
  'https://images.unsplash.com/photo-1595671250655-56c2e18cd4c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1576&q=80',
  'https://images.unsplash.com/photo-1593642532400-2682810df593?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3450&q=80',
  'https://images.unsplash.com/photo-1593642703013-5a3b53c965f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2725&q=80',
  'https://images.unsplash.com/photo-1591890799331-94ab715fa69e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3450&q=80',
  'https://images.unsplash.com/photo-1595626259537-9510012e53ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3450&q=80',
];

//Start The Categories data
List<String> categoryImages = [
  'https://www.maephorncurry.com/wp-content/uploads/2018/03/%E0%B9%81%E0%B8%81%E0%B8%87%E0%B9%80%E0%B8%9C%E0%B9%87%E0%B8%94.jpg',
  'https://food.mthai.com/app/uploads/2018/01/Stir-Fried-Mix-Vegetables-with-Shrimp.jpg',
  'https://s359.kapook.com/pagebuilder/16a89fbd-6678-4d76-a4c0-66a1f0ea30d1.jpg',
  'https://img.wongnai.com/p/1920x0/2017/09/27/e3e5610ce8d9486aa9b1c33a83d7ab26.jpg',
  'https://shopee.co.th/blog/wp-content/uploads/2021/03/%E0%B9%80%E0%B8%A1%E0%B8%99%E0%B8%B9%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B8%AD%E0%B8%B5%E0%B8%AA%E0%B8%B2%E0%B8%99.jpg',
];

List<String> categoryTitles = [
  'แกง',
  'ผัด',
  'ยำ',
  'ทอด',
  'อาหารอิสาน',
];
List<String> categoryTitlesDouble = [
  'Fashion',
  'Food',
  'Technology',
  'Art',
  'Sport',
  'Travel',
  'Fashion',
  'Food',
  'Technology',
  'Art',
  'Sport',
  'Travel',
];
List<String> categoryPostTitles = [
  'Catchy article titles result',
  'Just the right amount',
  'New dual‑camera system',
  'Love at first, second, third',
  'Discover 33,932 code scripts',
  'Check out the newest code',
  'The most recent releases ',
  "Grab July's free items",
  'Everything you need in one place',
  'Discover this week’s Featured',
];

List<String> categoryPostNumbers = [
  '847',
  '345',
  '45',
  '634',
  '234',
  '234',
];
//End The Categories data

//Partner Logo Images

List<String> partnerLogosUrl = [
  'https://images.unsplash.com/photo-1545231027-637d2f6210f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1575&q=80',
  'https://images.unsplash.com/photo-1505489435671-80a165c60816?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1557053964-937650b63311?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1555920141-8ffbcdf2d8b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1500509356004-46b18c90ea71?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1592276064195-729f350523d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
];

AppBar customAppBar(String title) {
  return AppBar(
    backgroundColor: mainDarkColor,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
          color: mainLightColor, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    // actions: [
    //   FlatButton.icon(
    //       onPressed: () {},
    //       icon: Icon(
    //         FontAwesomeIcons.blog,
    //         size: 40,
    //         color: DataUtilities.darkGreenColor,
    //       ),
    //       label: Text(''))
    // ],
    iconTheme: IconThemeData(color: mainLightColor),
  );
}

String articleContent =
    "Start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentencesbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to thinkbahaa start A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.articleContent A paragraph is a series of related sentences developing a central idea, called the topic. Try to think developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument. A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument. bebo";

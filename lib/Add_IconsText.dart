import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconsText extends StatelessWidget {

  final IconData icon;
  final String text;


  IconsText({this.icon,this.text});

  @override
  Widget build(BuildContext context) {
    return
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Icon(icon,size: 70) ,
      SizedBox(width: 10),
      Text(text),


          ]


      );

  }
}

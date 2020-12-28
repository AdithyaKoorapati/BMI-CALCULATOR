import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onClick;
  ReusableCard({this.colour,this.cardChild,this.onClick});



  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onClick,
      child:
      Container(
           child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colour,
          )

      ),
    );
  }
}
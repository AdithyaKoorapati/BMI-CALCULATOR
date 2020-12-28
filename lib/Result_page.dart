import 'package:bmicalculatoe/Reusable_card.dart';
import 'package:flutter/material.dart';
import 'Constaints.dart';
import 'Reusable_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiResult, this.resultText, this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "RESULTS",
                style: titleTextStyle,
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: activeContainercolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: bmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: overallConclusion,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        "RE-CALCULATE",
                        style: resultButtonTheme,
                      )),
                      color: bottomContainercolor,
                      height: bottomContainerHeight,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10.0),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}

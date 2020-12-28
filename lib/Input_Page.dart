import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Add_IconsText.dart';
import 'Result_page.dart';
import 'Constaints.dart';
import 'Functionality_BMI.dart';




enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveContainerColor;
  Color femaleCardColor = inactiveContainerColor;

  Gender selectGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        colour: selectGender == Gender.male
                            ? activeContainercolor
                            : inactiveContainerColor,
                        cardChild: IconsText(
                          icon: FontAwesomeIcons.venus,
                          text: "Male",
                        ),
                        onClick: () {
                          setState(() {
                            selectGender = Gender.male;
                          });
                        })),
                Expanded(
                    child: ReusableCard(
                  colour: selectGender == Gender.female
                      ? activeContainercolor
                      : inactiveContainerColor,
                  cardChild: IconsText(
                    icon: FontAwesomeIcons.venus,
                    text: "Female",
                  ),
                  onClick: () {
                    setState(() {
                      selectGender = Gender.female;
                    });
                  },
                ))
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: activeContainercolor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Height",

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toString(),
                      style: TextStyle( fontSize: 30),
                    ),
                    Text(
                      'cm',
                      
                    )
                  ],
                ),
                Slider(
                  activeColor: Color(0xFFFFABE1),
                    inactiveColor: Color(0xffFFE6E6),
                    value: height.toDouble(),
                    min: 100.0,
                    max: 250.0,
                    onChanged: (double newNumber) {
                      setState(() {
                        height = newNumber.round();
                      });
                    })
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: activeContainercolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Text("WEIGHT")),
                      Center(child: Text(weight.toString(),style: TextStyle(fontSize: 30))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                {

                                    weight--;


                                }
                              });
                            },
                          ),
                          SizedBox(width: 30,),
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                {

                                  weight++;
                                }
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: activeContainercolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,


                    children: [
                      Center(child: Text("AGE")),
                      Center(child: Text(age.toString(),style: TextStyle(fontSize: 30),)),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          RoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                {
                                  if(age>1&&age<100){
                                    age--;
                                  }

                                }
                              });
                            },
                          ),
                         SizedBox(width: 30,),
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                {

                                    age++;


                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          GestureDetector(
            onTap: (){

              Calculation calc=Calculation(height: height,weight: weight);




              Navigator.push( context,MaterialPageRoute(builder:(context)=>ResultPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResults(),
                interpretation: calc.getInterpretation(),
              )
              )
              );
            },
            child: Container(
              child: Center(child: Text("CALCULATE",style: resultButtonTheme,)),
              color: bottomContainercolor,
              height: bottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
            ),
          )
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  RoundButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 30.0,
        height: 30.0
      ),
      fillColor: Color(0xFFFFABE1),
      elevation: 6,
      shape: CircleBorder(),
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}

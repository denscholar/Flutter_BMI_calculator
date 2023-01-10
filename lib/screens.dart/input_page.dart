import 'package:bmicalculator/calculator_logic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../reusables/base_button.dart';
import '../reusables/card_column.dart';
import '../reusables/reusable_card.dart';
import '../reusables/round_icon_button.dart';
import 'result_page.dart';

// create an enum to handle the gender logic
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 75;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFF0A0E21),
          title: const Center(child: Text('BMI Calculator')),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childCard: CardColumn(
                    cardImage: Image.asset('assets/images/man.png'),
                    label: ('MALE'),
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: (() {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  }),
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childCard: CardColumn(
                    cardImage: Image.asset('assets/images/woman.png'),
                    label: 'WOMAN',
                  ),
                ))
              ],
            )),
            Expanded(
                child: ReusableCard(
              childCard: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT',
                      textAlign: TextAlign.center, style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 23.0)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: ((double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      }),
                      max: kSliderMax,
                      min: kSliderMin,
                      activeColor: const Color(0XFFEB1555),
                      inactiveColor: const Color(0XFF8D8E98),
                    ),
                  )
                ],
              ),
              color: kActiveCardColor,
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('WEIGHT',
                          textAlign: TextAlign.center, style: kLabelTextStyle),
                      Text(weight.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            onPressed: (() {
                              setState(() {
                                weight--;
                              });
                            }),
                            icon: const Icon(FontAwesomeIcons.minus),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          RoundedIconButton(
                            onPressed: (() {
                              setState(() {
                                weight++;
                              });
                            }),
                            icon: const Icon(FontAwesomeIcons.plus),
                          )
                        ],
                      )
                    ],
                  ),
                  color: kActiveCardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('AGE',
                          textAlign: TextAlign.center, style: kLabelTextStyle),
                      Text(age.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            onPressed: (() {
                              setState(() {
                                age--;
                              });
                            }),
                            icon: const Icon(FontAwesomeIcons.minus),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          RoundedIconButton(
                            onPressed: (() {
                              setState(() {
                                age++;
                              });
                            }),
                            icon: const Icon(FontAwesomeIcons.plus),
                          )
                        ],
                      )
                    ],
                  ),
                  color: kActiveCardColor,
                )),
              ],
            )),
            BaseButton(
              label: 'CALCULATOR',
              onTap: (() {
                CalculateBMI calc = CalculateBMI(weight: weight, height: height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        )));
              }),
            ),
          ],
        ));
  }
}

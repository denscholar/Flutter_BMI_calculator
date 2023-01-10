import 'package:bmicalculator/reusables/base_button.dart';
import 'package:bmicalculator/reusables/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result screen'),
      ),
      body: Column(
        children: [
          const Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text('Your Result', style: kResultTextStyle),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      resultText!.toUpperCase(),
                      style: kOverWeightTextStyle,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      bmiResult!,
                      style: kTotalTextStyle,
                    ),
                    Text(
                      interpretation!,
                      textAlign: TextAlign.center,
                      style: kSentenceTextStyle,
                    )
                  ],
                ),
                color: kActiveCardColor,
              )),
          BaseButton(
              onTap: (() {
                Navigator.pop(context);
              }),
              label: 'RECALCULATE')
        ],
      ),
    );
  }
}

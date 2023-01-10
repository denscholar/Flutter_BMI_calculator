import 'dart:math';

class CalculateBMI {
  final int? weight;
  final int? height;

  CalculateBMI({this.weight, this.height});

  // private property
  double? _bmi;

  String calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi!.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi! > 25 && _bmi! < 29) {
      return 'Overweight';
    } else if (_bmi! > 18.5 && _bmi! < 24.9) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi! > 25 && _bmi! < 29) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi! > 18.5 && _bmi! < 24.9) {
      return 'You have a normal weight';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
import 'dart:math';

class Calculator{
  int? weight;
  int? height;
  double _bmi = 0;
  Calculator({required this.weight,required this.height});

  String getBMIResult(){
    _bmi = weight!/pow(height!/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getMassage(){
    if (_bmi > 25) {
      return 'You Have Higher Than Normal Body Weight,Do Exercise More';
    }else if(_bmi < 18){
      return 'You Have Lower Than Normal Body Weight,Eate A Bit More';
    }else{
      return 'You Have Normal Body Weight,Nice!';
    }
  }

  String getResultText(){
    if (_bmi >= 25) {
      return "Over Weight";
    }else if(_bmi <= 18){
      return "Less Weight";
    }else{
      return "Normal";
    }
  }

}
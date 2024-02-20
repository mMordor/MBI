import 'package:flutter/material.dart';
import 'package:mbi_calculator/Constatnts/constants.dart';
import 'package:mbi_calculator/brain/brain.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;
  late final Calculator cal ;
  late final String BMI;
  ResultPage({super.key,required this.height,required this.weight});

  @override
  Widget build(BuildContext context) {
    cal = Calculator(weight: weight, height: height);
    String BMI = cal.getBMIResult();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0d22),
        title: const Text('BMI CALCULATOR RESULT'),
      )
      ,
      body: Center(
        child: Column(       
          crossAxisAlignment : CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text("Your Result",style: KLableBottomButton,),
              ),
            )
            ,
            Expanded(
              flex : 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10 ),
                child: Container(
                  decoration: BoxDecoration(
                    color: KInactiveButton,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(cal.getResultText(), style: KLableCards.copyWith(color: Colors.green),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(BMI, style: KLableHeight,textAlign: TextAlign.center,),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            const Text('Normal BMI Range:', style: KLableCards,),
                            Text('18,5 - 25 kg/m2', style: KLableCards.copyWith(color: Colors.white),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical : 13.0),
                        child: Text(cal.getMassage(), style: KLableCards.copyWith(color: Colors.white),textAlign: TextAlign.center,),
                      )
                    ]
                  ),
                ),
              ),
            )
            ,
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                color: KBottomButtonColor,
                width: double.infinity,
                height: KBottomButtonHeight,
                child: Text('BACK TO CALCULATOR PAGE',style:KLableBottomButton.copyWith(fontSize: 30)),
              ),
            )
          ],
        )
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mbi_calculator/Constatnts/constants.dart';
import 'package:mbi_calculator/views/result_view.dart';
import 'package:mbi_calculator/widgets/custom_floataction_button.dart';
import 'package:mbi_calculator/widgets/increase_decrease.dart';
import '../widgets/gender_button.dart';
import '../widgets/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



enum Gender {
    male,
    female
  }

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalculatorView> {

  Color malecardbuttoncolor = KInactiveButton;
  Color femalecardbuttoncolor = KInactiveButton;
  Gender? gender;
  int height = 160;
  int weight = 60;
  int age = 26;

  void changeGender(usergender){
    gender = usergender;
    print(gender);
    if(gender == Gender.male){
      setState(() {
        malecardbuttoncolor = KActiveButton;
        femalecardbuttoncolor = KInactiveButton;
      });
    }else{
      setState(() {
        femalecardbuttoncolor = KActiveButton;
        malecardbuttoncolor = KInactiveButton;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0a0d22),
          title: const Text('BMI CALCULATOR'),
        ),
        body:Column(
          children: [
            Expanded(
              child: Row(
                children:  [
                  Expanded(
                    child: GestureDetector(
                      child: ReusabaleCard(
                        color: malecardbuttoncolor
                        ,
                        child: const GenderButton(icon: KMaleIcon,gender: 'Male',)
                      ),
                      onTap: (){
                        changeGender(Gender.male);
                        
                      },
                    )
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: ReusabaleCard(
                        color: femalecardbuttoncolor
                        ,
                        child:const GenderButton(icon: KFemaleIcon, gender: 'Female')
                      ),
                      onTap: (){
                        changeGender(Gender.female);
                        
                      },
                    ))
                ],
              ),
            )
            ,
             Expanded(child: ReusabaleCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Height',style: KLableCards,)
                  ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style: KLableHeight,)
                      ,
                      const Text('CM',style: KLableCards)                      
                    ]
                  )
                  ,
                  SliderTheme(
                    data:  SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      overlayColor: KOverlayColor,
                      thumbColor: KBottomButtonColor,
                      thumbShape: KThumbShape ,
                      overlayShape: KOverlayShape
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (newval){
                        setState(() {
                          height = newval.round();
                        });
                      }
                    ),
                  )
                ],
              ),
            ))
            ,
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ReusabaleCard(
                    child :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text('Weight',style: KLableCards),
                        Text(weight.toString(),style: KLableHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundedButton(
                                icon: FontAwesomeIcons.plus,
                                method: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundedButton(
                                icon: FontAwesomeIcons.minus,
                                method: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  )),
                  Expanded(child: ReusabaleCard(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text('Age',style: KLableCards),
                        Text(age.toString(),style: KLableHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundedButton(
                                icon: FontAwesomeIcons.plus,
                                method: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundedButton(
                                icon: FontAwesomeIcons.minus,
                                method: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(weight: weight,height: height,)));
              },
              child: Container(
                alignment: Alignment.center,
                color: KBottomButtonColor,
                width: double.infinity,
                height: KBottomButtonHeight,
                child: const Text('CALCULATE',style:KLableBottomButton),
              ),
            )
          ],
        )
      ),
    );
  }
}

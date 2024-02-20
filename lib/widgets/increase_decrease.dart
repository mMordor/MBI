import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbi_calculator/Constatnts/constants.dart';
import 'package:mbi_calculator/widgets/custom_floataction_button.dart';

class IncreaseDecrease extends StatefulWidget {
  int value;
  String lable;
  IncreaseDecrease({super.key,required this.value,required this.lable});

  @override
  State<IncreaseDecrease> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<IncreaseDecrease> {
  @override
  Widget build(BuildContext context) {
    return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(widget.lable,style: KLableCards),
                Text(widget.value.toString(),style: KLableHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundedButton(
                        icon: FontAwesomeIcons.plus,
                        method: (){
                          setState(() {
                            widget.value++;
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
                            widget.value--;
                          });
                        },
                      ),
                    )
                  ],
                )
              ],
            );
  }
}
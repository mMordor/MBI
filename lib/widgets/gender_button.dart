import 'package:flutter/material.dart';
import 'package:mbi_calculator/Constatnts/constants.dart';

class GenderButton extends StatelessWidget {
  final IconData? icon;
  final String gender;
  const GenderButton({
    super.key,
    required this.icon,
    required this.gender
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(
          icon,
          size: 80,
        )
        ,
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(gender,style: KLableCards,),
        )
      ],
    );
  }
}
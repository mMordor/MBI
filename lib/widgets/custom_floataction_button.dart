import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon; 
  final void Function()? method;
  const RoundedButton({required this.icon,required this.method}); 

  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
      fillColor: const Color(0xff4c4f5e),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation:4,
      shape: const CircleBorder(),
      onPressed: method,
      child:  Icon(icon),

    );
  }
}
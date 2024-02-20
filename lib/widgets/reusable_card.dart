import 'package:flutter/material.dart';

  const Color cardsDefultsColor = Color(0xFF1D1E33);


class ReusabaleCard extends StatelessWidget {

  final Widget? child;
  final Color? color;
  const ReusabaleCard({super.key,this.child,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.all(15),
              decoration:  BoxDecoration(
                color: color ?? cardsDefultsColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: child,
            );
  }
}
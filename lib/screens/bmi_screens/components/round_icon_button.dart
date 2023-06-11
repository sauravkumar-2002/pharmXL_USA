import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:11.0),
      child: RawMaterialButton(

        child: Icon(icon),
        constraints: BoxConstraints.tightFor(
          width: 36.0,
          height: 36.0,
        ),
        elevation: 8.0,
        shape: CircleBorder(),
        fillColor: Color(0xFFA2A6F6),
        onPressed: onPressed
      ),
    );
  }
}
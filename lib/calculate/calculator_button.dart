import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String btntxt;
  final Color btnColor;
  final Function(String) onPressed;

  const CalculatorButton({
    Key? key,
    required this.btnColor,
    required this.btntxt,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: btnColor,
      onPressed: () {
        onPressed(btntxt);
      },
      child: Text(
        btntxt,
        style: const TextStyle(color: Colors.white, fontSize: 35),
      ),
    );
  }
}

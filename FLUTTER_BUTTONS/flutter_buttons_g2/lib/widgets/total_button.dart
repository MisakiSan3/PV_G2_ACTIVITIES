import 'package:flutter/material.dart';

class TotalButton extends StatelessWidget {
  const TotalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: null,
        child: const Text('TOTAL'),
      ),
    );
  }
}

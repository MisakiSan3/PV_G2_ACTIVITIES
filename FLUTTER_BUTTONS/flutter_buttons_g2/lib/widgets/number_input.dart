import 'package:flutter/material.dart';

class NumberInput extends StatelessWidget {
  final int value;

  const NumberInput({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(value),
      initialValue: value.toString(),
      readOnly: true,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/counter_button.dart';
import '../widgets/number_input.dart';
import '../widgets/total_button.dart';


class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int sumados = 0;
  int restados = 0;

  int get total => sumados - restados;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de clicks'),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // SUMAR
              const Text('Número de clicks +'),

              Row(
                children: [
                  

                  //button
                ],
              ),

              const SizedBox(height: 20),

              // RESTAR
              const Text('Número de clicks -'),

              Row(
                children: [
                  

                  //button
                ],
              ),

              const SizedBox(height: 20),

             

            ],
          ),
        ),
      ),
    );
  }
}

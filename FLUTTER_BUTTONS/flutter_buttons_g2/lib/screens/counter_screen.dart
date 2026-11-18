
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
              const Text(
                'Número de clicks +',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const SizedBox(width: 64),
                  Expanded(
                    child: NumberInput(value: sumados),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 136, 240, 87),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.5,
                      ),
                    ),
                    child: IconTheme(
                      data: IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
                      child: CounterButton(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() {
                            sumados++;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

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

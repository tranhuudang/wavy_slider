import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wavy_slider/wavy_slider.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _value = .5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wave Slider in Action')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WavySlider(
              onChanged: (currentValue) {
                if (kDebugMode) {
                  print(currentValue);
                }
              },
            ),
            WavySlider(
              color: Colors.red,
              strokeWidth: 6,
              value: .2,
              waveWidth: 23,
              waveHeight: 15,
              width: 200,
              onChanged: (currentValue) {
                if (kDebugMode) {
                  print(currentValue);
                }
              },
            ),
            WavySlider(
              color: Colors.blue,
              strokeWidth: 6,
              value: _value,
              waveWidth: 23,
              waveHeight: 15,
              width: 200,
              onChanged: (currentValue) {
                if (kDebugMode) {
                  print(currentValue);
                }
              },
            ),
            const SizedBox(height: 16,),
            FilledButton(onPressed: (){
              setState(() {
                _value += .1;
              });
            }, child: const Text('Increase')),
          ],
        ),
      ),
    );
  }
}


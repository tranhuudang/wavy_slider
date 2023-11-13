import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wavy_slider/wavy_slider.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Wave Slider in Action')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WaveSlider(
                onChanged: (currentValue) {
                  if (kDebugMode) {
                    print("------$currentValue");
                  }
                },
              ),
              WaveSlider(
                color: Colors.red,
                strokeWidth: 6,
                value: .2,
                waveWidth: 20,
                waveHeight: 15,
                width: 200,
                onChanged: (currentValue) {
                  if (kDebugMode) {
                    print("------$currentValue");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
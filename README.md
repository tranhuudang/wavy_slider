# wavy_slider

The wave_divider package is a versatile Flutter widget that enables you to add beautiful, wave-like slider to your UI. Whether you want to enhance the visual appeal of your app or create a decorative separation between sections, the WavySlider widget makes it easy and customizable.

[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/tranhuudang/wavy_slider?style=flat&logo=github&colorB=green&label=stars)](https://github.com/tranhuudang/wavy_slider/stargazers)
[![Pub Version](https://img.shields.io/pub/v/wavy_slider.svg)](https://pub.dev/packages/wavy_slider/)

![Screenshot](https://github.com/tranhuudang/wavy_slider/blob/master/example/preview.png?raw=true)

## Usage

The `WavySlider` widget provides a simple way to create a horizontal wavy line slider. Here are some usage examples:

1. Using the default wavy slider:
```dart
  WaveSlider(
    onChanged: (currentValue) {
    if (kDebugMode) {
      print(currentValue);
    }
    },
  )
```

or a little bit of custom with:
```dart 
  WaveSlider(
    color: Colors.red,
    strokeWidth: 6,
    value: .2,
    waveWidth: 20,
    waveHeight: 15,
    width: 200,
    onChanged: (currentValue) {
      if (kDebugMode) {
        print(currentValue);
      }
    },
)
```

### Support the Library

You can support the library by liking it on pub, staring in on Github and reporting any bugs you
encounter.
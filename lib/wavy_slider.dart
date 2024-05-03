library wavy_slider;

import 'package:flutter/material.dart';

part 'components/wave_line.dart';
part 'components/wavy_line_painter.dart';
part 'components/wavy_slider_background.dart';

/// Create a horizontal wavy line slider.
///
///  The [value] argument can either be null for an indeterminate
///  progress indicator, or a non-null value between 0.0 and 1.0 for a
///  determinate progress indicator.
///
/// The [onChanged] arguments must not be null.
/// * [value] determines currently selected value for this slider.
/// * [onChanged] is called when the user is selecting a new value for the
/// slider.
class WavySlider extends StatefulWidget {
  final double value;
  final double waveHeight;
  final double waveWidth;
  final double strokeWidth;
  final double width;
  final ValueChanged<double> onChanged;
  final Color? color;
  final Color? backgroundColor;

  const WavySlider({
    super.key,
    this.value = .5,
    this.waveHeight = 20,
    this.waveWidth = 23,
    this.strokeWidth = 3,
    required this.onChanged,
    this.width = 200,
    this.color,
    this.backgroundColor,
  });

  @override
  State<WavySlider> createState() => _WavySliderState();
}

class _WavySliderState extends State<WavySlider> {
  late double _sliderValue;
  late double _width;

  @override
  Widget build(BuildContext context) {
    _sliderValue = widget.value;
    _width = _sliderValue * widget.width;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        double newValue =
            (_sliderValue + details.primaryDelta! / context.size!.width)
                .clamp(0.0, 1.0);
        widget.onChanged(newValue);
        setState(() {
          _sliderValue = newValue;
          _width = _sliderValue * widget.width;
        });
      },
      child: Stack(
        children: [
          Container(
              // Touchable height for GestureDetector to work
              color: Colors.transparent,
              height: widget.waveHeight + 10,
              child: _WavySliderBackground(
                waveHeight: widget.waveHeight,
                waveWidth: widget.waveWidth,
                thickness: widget.strokeWidth,
                width: widget.width,
                color: widget.backgroundColor ?? Theme.of(context).dividerColor,
              )),
          Container(
            // Touchable height for GestureDetector to work
            color: Colors.transparent,
            height: widget.waveHeight + 10,
            width: _width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _WaveLine(
                  waveHeight: widget.waveHeight,
                  waveWidth: widget.waveWidth,
                  waveLineColor: widget.color ?? Theme.of(context).primaryColor,
                  thickness: widget.strokeWidth,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

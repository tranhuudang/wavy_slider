library wavy_slider;

import 'package:flutter/material.dart';

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
    this.waveWidth = 20,
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
  void initState() {
    super.initState();

    _sliderValue = widget.value;
    _width = _sliderValue * widget.width;
  }

  @override
  Widget build(BuildContext context) {
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
              child: WavySliderBackground(
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
                WaveLine(
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

class WavySliderBackground extends StatefulWidget {
  final double width;
  final double waveHeight;
  final double waveWidth;
  final double thickness;
  final Color color;

  const WavySliderBackground({
    super.key,
    required this.waveHeight,
    required this.waveWidth,
    this.width = 200,
    required this.thickness,
    required this.color,
  });

  @override
  State<WavySliderBackground> createState() => _WavySliderBackgroundState();
}

class _WavySliderBackgroundState extends State<WavySliderBackground> {
  late double _width;

  @override
  void initState() {
    super.initState();
    _width = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: _width,
          child: WaveLine(
            waveHeight: widget.waveHeight,
            waveWidth: widget.waveWidth,
            waveLineColor: widget.color,
            thickness: widget.thickness,
          ),
        ),
      ],
    );
  }
}

class WaveLine extends StatelessWidget {
  final double waveHeight;
  final double waveWidth;
  final Color waveLineColor;
  final double thickness;

  const WaveLine({
    super.key,
    required this.waveHeight,
    required this.waveWidth,
    required this.waveLineColor,
    required this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: waveHeight / 2),
      child: CustomPaint(
        size: const Size(double.infinity, 0),
        painter: WavyLinePainter(
          waveColor: waveLineColor,
          strokeWidth: thickness,
          height: waveHeight,
          width: waveWidth,
        ),
      ),
    );
  }
}

class WavyLinePainter extends CustomPainter {
  final Color waveColor;
  final double strokeWidth;
  final double height;
  final double width;

  WavyLinePainter({
    required this.height,
    required this.width,
    required this.waveColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = waveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = Path();
    final waveHeight = height;
    final waveWidth = width;

    path.moveTo(0, size.height / 2 + 5);
    bool up = true;

    for (double x = 9; x < size.width; x += waveWidth) {
      if (up) {
        path.relativeQuadraticBezierTo(
          waveWidth / 2,
          -waveHeight,
          waveWidth,
          0,
        );
      } else {
        path.relativeQuadraticBezierTo(
          waveWidth / 2,
          waveHeight,
          waveWidth,
          0,
        );
      }
      up = !up;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

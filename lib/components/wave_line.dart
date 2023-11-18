part of '../wavy_slider.dart';

class _WaveLine extends StatelessWidget {
  final double waveHeight;
  final double waveWidth;
  final Color waveLineColor;
  final double thickness;

  const _WaveLine({
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
        painter: _WavyLinePainter(
          waveColor: waveLineColor,
          strokeWidth: thickness,
          height: waveHeight,
          width: waveWidth,
        ),
      ),
    );
  }
}

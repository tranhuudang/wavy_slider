part of '../wavy_slider.dart';

class _WavyLinePainter extends CustomPainter {
  final Color waveColor;
  final double strokeWidth;
  final double height;
  final double width;

  _WavyLinePainter({
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

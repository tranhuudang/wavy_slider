part of '../wavy_slider.dart';

class _WavySliderBackground extends StatefulWidget {
  final double width;
  final double waveHeight;
  final double waveWidth;
  final double thickness;
  final Color color;

  const _WavySliderBackground({
    required this.waveHeight,
    required this.waveWidth,
    this.width = 200,
    required this.thickness,
    required this.color,
  });

  @override
  State<_WavySliderBackground> createState() => _WavySliderBackgroundState();
}

class _WavySliderBackgroundState extends State<_WavySliderBackground> {
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
          child: _WaveLine(
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

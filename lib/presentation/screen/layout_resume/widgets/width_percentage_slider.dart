import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:flutter/material.dart';
import 'package:interactive_slider/interactive_slider.dart';

class WidthPercentageSlider extends StatefulWidget {
  final double initialValue;
  final ValueChanged<double> onFinished;

  const WidthPercentageSlider({
    super.key,
    required this.initialValue,
    required this.onFinished,
  });

  @override
  State<WidthPercentageSlider> createState() => _WidthPercentageSliderState();
}

class _WidthPercentageSliderState extends State<WidthPercentageSlider> {
  static const double min = 20;
  static const double max = 80;

  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'L/R: ${_value.toStringAsFixed(2)}%',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        InteractiveSlider(
          min: min,
          max: max,
          initialProgress: _value / 100,
          foregroundColor: context.theme.primaryColor,
          backgroundColor: context.theme.backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              color: context.theme.primaryColor,
              width: 1,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          onProgressUpdated: (value) {
            final safe = value;
            widget.onFinished(safe);
          },
        ),
      ],
    );
  }
}

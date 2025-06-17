import 'package:flutter/material.dart';

class SliderSelectionWidget extends StatelessWidget {
  const SliderSelectionWidget({
    super.key,
    required this.title,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.divisions,
  });

  final String title;
  final double value;
  final double minValue;
  final double maxValue;
  final int divisions;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 4,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 12),
          Slider(
            value: value,
            onChanged: onChanged,
            max: maxValue,
            min: minValue,
            divisions: divisions,
            label: value.toStringAsFixed(0),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Theme.of(context).colorScheme.onSurface,
          ),
          SizedBox(height: 12),
          Text(
            'Value: ${value.toInt()}',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';

class WinDialog extends StatelessWidget {
  final String word;
  const WinDialog({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppColors.green,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sentiment_very_satisfied,
            size: 60,
            color: Theme.of(context).colorScheme.surface,
          ),
          SizedBox(height: 20),
          Text(
            'You Won!',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: AppColors.secondary),
          ),
          SizedBox(height: 10),
          Text(
            'Congratulations! You guessed the word: $word!',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: AppColors.onSurface),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.pop();
              context.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Home',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.green,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

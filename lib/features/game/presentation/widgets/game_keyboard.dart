import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_it_frontend/features/game/presentation/bloc/game_bloc.dart';
import 'package:guess_it_frontend/features/game/presentation/bloc/game_state.dart';

import '../../../../core/theme/app_colors.dart';

class GameKeyboard extends StatelessWidget {
  final Function(String) onKeyPressed;
  final Function() onDelete;
  final Function() onSubmit;
  const GameKeyboard({
    super.key,
    required this.onKeyPressed,
    required this.onDelete,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    const rows = ['QWERTYUIOP', 'ASDFGHJKL', 'ZXCVBNM'];
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...rows.map((row) => _buildKeyboardRow(context, state, row)),
              SizedBox(height: 5),
              _buildActionRow(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionRow(BuildContext context, GameState state) {
    var currentAttempt = state.currentAttempt ?? '';
    var word = state.word ?? '';
    return Row(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 3,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  onDelete();
                },
                child: Icon(Icons.backspace, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 3,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: currentAttempt.length < word.length
                    ? null
                    : () {
                        onSubmit();
                      },
                child: Text(
                  'Enter',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildKeyboardRow(BuildContext context, GameState state, String row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: row
          .split('')
          .map((key) => _buildKey(context, state, key))
          .toList(),
    );
  }

  Widget _buildKey(BuildContext context, GameState state, String key) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 0.8,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: ElevatedButton(
            onPressed: () => onKeyPressed(key),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: getKeyColor(context, state, key),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
            child: Text(
              key,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: getTextColor(context, state, key),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getKeyColor(BuildContext context, GameState state, String key) {
    final attempts = state.attempts ?? [];
    final word = state.word ?? '';

    for (final attempt in attempts) {
      for (int i = 0; i < attempt.length; i++) {
        if (attempt[i] == key && key == word[i]) {
          return AppColors.green;
        }
      }
    }
    if (word.contains(key)) {
      for (final attempt in attempts) {
        if (attempt.contains(key)) {
          return AppColors.yellow;
        }
      }
    }
    for (final attempt in attempts) {
      if (attempt.contains(key)) {
        return Theme.of(context).colorScheme.onSurfaceVariant;
      }
    }
    return Theme.of(context).colorScheme.surface;
  }

  Color getTextColor(BuildContext context, GameState state, String key) {
    final attempts = state.attempts ?? [];
    final word = state.word ?? '';

    for (final attempt in attempts) {
      for (int i = 0; i < attempt.length; i++) {
        if (attempt[i] == key && key == word[i]) {
          return Theme.of(context).colorScheme.surface;
        }
      }
    }
    if (word.contains(key)) {
      for (final attempt in attempts) {
        if (attempt.contains(key)) {
          return Theme.of(context).colorScheme.surface;
        }
      }
    }
    return Theme.of(context).colorScheme.onSurfaceVariant;
  }
}

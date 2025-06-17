import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  final int attemptsCount;
  final int wordLength;

  const GamePage({
    super.key,
    required this.attemptsCount,
    required this.wordLength,
  });

  static String route({required int wordLength, required int attemptsCount}) =>
      Uri(
        path: '/game',
        queryParameters: {
          'wordLength': wordLength.toString(),
          'attemptsCount': attemptsCount.toString(),
        },
      ).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Column(children: [SizedBox(height: 20)]),
    );
  }
}

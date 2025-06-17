import 'package:flutter/widgets.dart';

class AttemptsWidget extends StatelessWidget {
  const AttemptsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {},
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
    );
  }
}

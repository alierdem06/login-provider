import 'package:flutter/material.dart';
import 'package:login_provider/feature/onboard/on_board_model.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({super.key, required this.model});
  final OnboardModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(model.description),
        Image.asset(model.imageWithPath),
      ],
    );
  }
}

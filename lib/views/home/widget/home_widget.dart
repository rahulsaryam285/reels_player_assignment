import 'package:flutter/material.dart';
import 'package:reels_player/main.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          'Home View',
          style: TextStyle(
            fontSize: Dimens.fifteen,
          ),
        ),
      );
}

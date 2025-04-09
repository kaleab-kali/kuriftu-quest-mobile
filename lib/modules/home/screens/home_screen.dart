import 'package:flutter/material.dart';
import 'package:kuriftuquest/core/constants/colors/colors.dart';
import 'package:kuriftuquest/core/constants/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.07),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.notifications),
        ),
        title: const Text('Home', style: AppTextStyles.headline2),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.07),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star_rounded, color: Color.fromARGB(255, 168, 128, 6)),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  constraints: const BoxConstraints(),
                ),
                const Text(
                  '3239',
                  style: AppTextStyles.headline2,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Home'),
        ],
      ),
    );
  }
}

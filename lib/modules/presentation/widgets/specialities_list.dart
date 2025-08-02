import 'package:flutter/material.dart';
import 'package:personalfit/core/constants/app_colors.dart';

class SpecialitiesList extends StatelessWidget {
  final List<String> specialities;

  const SpecialitiesList({super.key, required this.specialities});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: specialities.map((item) {
        return Chip(
          label: Text(
            item,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.primary,
        );
      }).toList(),
    );
  }
}

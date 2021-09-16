import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';
import 'package:ifood_flutter_clone/models/category.dart';

class CategoryItemComponents extends StatelessWidget {
  final Category category;

  const CategoryItemComponents({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            category.picture,
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              category.name ?? '',
              style:
                  AppTypography.small(context).copyWith(color: AppColors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

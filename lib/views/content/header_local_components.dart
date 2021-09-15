import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';

class HeaderLocalComponents extends StatelessWidget {
  final String localtion;

  const HeaderLocalComponents({
    Key? key,
    required this.localtion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              children: [
                Text(
                  localtion,
                  style: AppTypography.localTextStyle(context),
                ),
                AppIcon(
                  icon: AppIcons.arroDown,
                  size: Size(24, 24),
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

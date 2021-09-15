import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ContentTabBarComponent extends StatelessWidget {
  final TabController controller;
  final Function(int) onTap;

  const ContentTabBarComponent({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 180),
      child: TabBar(
        onTap: onTap,
        indicator: MaterialIndicator(
          color: AppColors.primaryColor,
          height: 2,
          bottomLeftRadius: 5,
          bottomRightRadius: 5,
        ),
        labelPadding: EdgeInsets.zero,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        indicatorPadding: EdgeInsets.zero,
        labelColor: AppColors.black,
        unselectedLabelColor: AppColors.black54,
        labelStyle: AppTypography.tabBarStyle(context),
        controller: controller,
        tabs: [
          Tab(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Restaurantes'),
            ),
          ),
          Tab(
            child: Text('Mercados'),
          ),
        ],
      ),
    );
  }
}

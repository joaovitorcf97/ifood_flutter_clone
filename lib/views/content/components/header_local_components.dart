import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';

class HeaderLocalComponents extends StatelessWidget {
  final String location;

  const HeaderLocalComponents({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _HeaderLocalComponentsDelegate(
        location,
      ),
    );
  }
}

class _HeaderLocalComponentsDelegate extends SliverPersistentHeaderDelegate {
  final String localtion;

  _HeaderLocalComponentsDelegate(this.localtion);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Column(
        children: [
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

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

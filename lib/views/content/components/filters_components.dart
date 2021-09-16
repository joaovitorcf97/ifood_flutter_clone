import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';

class FilterComponents extends StatelessWidget {
  const FilterComponents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _FilterComponentsDelegate(),
    );
  }
}

class _FilterComponentsDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.white,
      height: 54,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 16),
          FilterItemComponent(label: 'Ordernar', icon: AppIcons.arroDown),
          FilterItemComponent(label: 'Pra Retirar', icon: AppIcons.arroDown),
          FilterItemComponent(label: 'Entrega Grátis', icon: AppIcons.arroDown),
          FilterItemComponent(label: 'Vale Refeição', icon: AppIcons.arroDown),
          FilterItemComponent(label: 'Entrega Parceira', icon: AppIcons.arroDown),
          FilterItemComponent(label: 'Filtros', icon: AppIcons.arroDown),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 54;

  @override
  double get minExtent => 54;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class FilterItemComponent extends StatelessWidget {
  final String label;
  final String icon;

  const FilterItemComponent({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          border: Border.all(
            color: AppColors.grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(
                label,
                style: AppTypography.filterItemStyle(context).copyWith(
                  color: Colors.grey[700],
                ),
              ),
              if (icon != null)
                AppIcon(
                  icon: icon,
                  size: Size(18, 18),
                  color: AppColors.black,
                )
            ],
          ),
        ),
      ),
    );
  }
}

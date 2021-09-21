import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String pathIcons = 'assets/icons/';

class AppIcons {
  static const arroDown = '${pathIcons}arrow_down.svg';
  static const fav = '${pathIcons}fav.svg';
  static const favLine = '${pathIcons}fav_line.svg';
  static const offer = '${pathIcons}offer.svg';
  static const star = '${pathIcons}star.svg';

  static const homeActive = '${pathIcons}bottom/home_active.svg';
  static const home = '${pathIcons}bottom/home.svg';

  static const searchActive = '${pathIcons}bottom/search_active.svg';
  static const search = '${pathIcons}bottom/search.svg';

  static const ordersActive = '${pathIcons}bottom/orders_active.svg';
  static const orders = '${pathIcons}bottom/orders.svg';

  static const profileActive = '${pathIcons}bottom/profile_active.svg';
  static const profile = '${pathIcons}bottom/profile.svg';
}

class AppIcon extends StatelessWidget {
  final String icon;
  final Size size;
  final Color color;

  const AppIcon({
    Key? key,
    required this.icon,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: size.height,
      width: size.width,
      color: color,
    );
  }
}

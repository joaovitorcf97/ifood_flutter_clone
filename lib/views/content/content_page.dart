import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';
import 'package:ifood_flutter_clone/views/content/bottom_navigator_component.dart';
import 'package:ifood_flutter_clone/views/content/content_tab_bar_component.dart';
import 'package:ifood_flutter_clone/views/content/header_local_components.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                HeaderLocalComponents(
                    localtion: 'Rua das Flores do Campo, 988'),
                ContentTabBarComponent(
                  controller: tabController,
                  onTap: (index) {},
                ),
              ],
            ),
          ),
          BottomNavigatorComponent(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigatorItemComponent(
                label: 'Início',
                activeIcon: AppIcons.homeActive,
                icon: AppIcons.home,
              ),
              BottomNavigatorItemComponent(
                label: 'Busca',
                activeIcon: AppIcons.searchActive,
                icon: AppIcons.search,
              ),
              BottomNavigatorItemComponent(
                label: 'Pedidos',
                activeIcon: AppIcons.ordersActive,
                icon: AppIcons.orders,
              ),
              BottomNavigatorItemComponent(
                label: 'Perfil',
                activeIcon: AppIcons.profileActive,
                icon: AppIcons.profile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

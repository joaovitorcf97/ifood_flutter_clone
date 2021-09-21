import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/controllers/content_controller.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/core/theme/app_images.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';
import 'package:ifood_flutter_clone/models/category.dart';
import 'package:ifood_flutter_clone/views/content/components/banners_components.dart';
import 'package:ifood_flutter_clone/views/content/components/bottom_navigator_component.dart';
import 'package:ifood_flutter_clone/views/content/components/category_item_components.dart';
import 'package:ifood_flutter_clone/views/content/components/content_tab_bar_component.dart';
import 'package:ifood_flutter_clone/views/content/components/filters_components.dart';
import 'package:ifood_flutter_clone/views/content/components/header_local_components.dart';
import 'package:ifood_flutter_clone/views/content/components/restaurant_list.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final controller = ContentController();
  late List<Category> categories;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    categories = controller.getCategorys();
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxScroll) {
            return [
              HeaderLocalComponents(
                location: 'Av. São João, 1881 - Minas Gerais',
              ),
              ContentTabBarComponent(
                controller: tabController,
                onTap: (index) {},
              ),
              FilterComponents(),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    return await Future.value();
                  },
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      _CategorySession(categories: categories),
                      _BannerSession(),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 24,
                          ),
                          child: Text(
                            'Lojas',
                            style: AppTypography.sessionTitle(context),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          restaurants
                              .map(
                                (e) => RestaurantItemComponent(restaurant: e),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _BottomNavigator(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategorySession extends StatelessWidget {
  late List<Category> categories;

  _CategorySession({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 86,
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 16 : 0,
                right: index == categories.length - 1 ? 16 : 10,
              ),
              child: CategoryItemComponents(
                category: categories[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BannerSession extends StatelessWidget {
  const _BannerSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 170,
        child: BannersComponent(
          list: [
            BannerItemComponent(imagePath: AppImages.banner1),
            BannerItemComponent(imagePath: AppImages.banner2),
            BannerItemComponent(imagePath: AppImages.banner3),
            BannerItemComponent(imagePath: AppImages.banner4),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigator extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const _BottomNavigator({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigatorComponent(
      currentIndex: currentIndex,
      onTap: onTap /**/,
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
    );
  }
}

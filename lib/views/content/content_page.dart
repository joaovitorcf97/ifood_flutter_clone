import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/controllers/content_controller.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/models/category.dart';
import 'package:ifood_flutter_clone/views/content/components/bottom_navigator_component.dart';
import 'package:ifood_flutter_clone/views/content/components/category_item_components.dart';
import 'package:ifood_flutter_clone/views/content/components/content_tab_bar_component.dart';
import 'package:ifood_flutter_clone/views/content/components/header_local_components.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final controller = ContentController();
  late List<Category> categorys;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    categorys = controller.getCategorys();
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxScroll) {
            return [
              HeaderLocalComponents(
                location: 'Rua das Flores do Campo, 980 - Minas Gerais',
              ),
              ContentTabBarComponent(
                controller: tabController,
                onTap: (index) {},
              )
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
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 86,
                          child: ListView.builder(
                            itemCount: categorys.length,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: index == 0 ? 16 : 0,
                                  right:
                                      index == categorys.length - 1 ? 16 : 10,
                                ),
                                child: CategoryItemComponents(
                                  category: categorys[index],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
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
        ),
      ),
    );
  }
}

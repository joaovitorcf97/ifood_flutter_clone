import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderLocalComponents(localtion: 'Rua das Flores do Campo, 988'),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 180),
            child: TabBar(
              indicator: MaterialIndicator(
                color: AppColors.primaryColor,
                height: 2,
                bottomLeftRadius: 5,
                bottomRightRadius: 5,
              ),
              labelPadding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelColor: AppColors.black,
              unselectedLabelColor: AppColors.black54,
              labelStyle: AppTypography.bodyText(context),
              controller: tabController,
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
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BannersComponent extends StatefulWidget {
  final List<BannerItemComponent> list;

  BannersComponent({Key? key, required this.list}) : super(key: key);

  @override
  State<BannersComponent> createState() => _BannersComponentState();
}

class _BannersComponentState extends State<BannersComponent> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    _pageController.addListener(_onChangePage);
  }

  _onChangePage() {
    setState(() {
      _currentIndex = _pageController.page!.toInt();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_onChangePage);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: 110,
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: widget.list,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.list
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.list.indexOf(e) == _currentIndex ? Colors.grey[700] : Colors.grey[400],
                        ),
                        width: 6,
                        height: 6,
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class BannerItemComponent extends StatelessWidget {
  final String imagePath;

  const BannerItemComponent({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

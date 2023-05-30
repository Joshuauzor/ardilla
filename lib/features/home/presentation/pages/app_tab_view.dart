import 'package:ardilla/core/core.dart';
import 'package:ardilla/features/features.dart';
import 'package:flutter/material.dart';

class AppTabView extends StatefulWidget {
  const AppTabView({
    Key? key,
  }) : super(key: key);

  @override
  AppTabViewState createState() => AppTabViewState();
}

class AppTabViewState extends State<AppTabView> {
  int? _selectedIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      _selectedIndex = 0;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _widgetOptions = <Widget?>[
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: _widgetOptions.elementAt(_selectedIndex!),
            ),
          ),
        ],
      ),
      bottomNavigationBar: FABBottomAppBar(
        backgroundColor: AppColors.white,
        selectedColor: AppColors.primaryColor,
        height: 50,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          FABBottomAppBarItem(
            icon: AppAssets.home,
            text: 'Home',
          ),
          FABBottomAppBarItem(
            icon: AppAssets.save,
            text: 'Save',
          ),
          FABBottomAppBarItem(
            icon: AppAssets.explore,
            text: 'Explore',
          ),
          FABBottomAppBarItem(
            icon: AppAssets.learn,
            text: 'Learn',
          ),
          FABBottomAppBarItem(
            icon: AppAssets.dilla,
            text: 'Dilla',
          ),
        ],
      ),
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_appraisal/presentation/dashboard/pages/dashboard_page.dart';

import '../../../core/core.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final _widgets = [
    const DashboardPage(),
    const Center(child: Text('Index 1: Business')),
    const Center(child: Text('Index 2: School')),
    const Center(child: Text('Index 3: Profile')),
  ];

  updateIndex(int newIndex) {
    _selectedIndex = newIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgets,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) => updateIndex(index) ?? 0,
        color: AppColors.primary,
        animationCurve: Curves.linear,
        height: 50,
        index: _selectedIndex,
        items: const [
          Icon(
            Icons.home,
            size: 25.0,
            color: Colors.white,
          ),
          Icon(
            Icons.list_alt,
            size: 25.0,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            size: 25.0,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 25.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

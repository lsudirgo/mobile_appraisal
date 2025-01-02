import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:mobile_appraisal/presentation/dashboard/pages/dashboard_page.dart';
import 'package:mobile_appraisal/presentation/job/page/mainjob_page.dart';
import 'package:mobile_appraisal/presentation/profile/pages/profile_page.dart';

import '../../../core/core.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;
  const MainPage({
    super.key,
    required this.initialIndex,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex = 0;

  final _widgets = [
    const DashboardPage(),
    const MainJobPage(),
    const Center(child: Text('Index 2: School')),
    const ProfilePage(),
  ];

  _updateIndex(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Set indeks awal
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
        onTap: (index) => _updateIndex(index) ?? 0,
        color: AppColors.primary,
        animationCurve: Curves.linear,
        height: 50,
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

import 'package:flutter/material.dart';
import 'package:movies/Core/utils/app_colors.dart';
import 'package:movies/Features/home/presentation/views/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = '/main';

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    SearchView(),
    MoviesView(),
    TVShowsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.shadowMoss,
        selectedItemColor: AppColors.goldenHoney,
        unselectedItemColor: AppColors.softAsh,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Watchlist',
          ),
        ],
      ),
    );
  }
}
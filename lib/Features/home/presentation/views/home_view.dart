import 'package:flutter/material.dart';
import 'package:movies/Features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
    );
  }
}

class TVShowsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'TV Shows',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
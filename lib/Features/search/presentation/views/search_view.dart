import 'package:flutter/material.dart';
import 'package:movies/Features/search/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}

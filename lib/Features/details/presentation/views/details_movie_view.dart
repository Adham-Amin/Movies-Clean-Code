import 'package:flutter/material.dart';
import 'package:movies/Core/utils/app_styles.dart';
import 'package:movies/Features/details/presentation/widgets/details_movie_view_body.dart';

class DetailsMovieView extends StatelessWidget {
  const DetailsMovieView({super.key, required this.movieId});

  final int movieId;
  static const routeName = '/DetailsMovieView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movie', style: AppStyles.textSemiBold18),
          centerTitle: true,
        ),
        body: DetailsMovieViewBody(movieId: movieId),
      ),
    );
  }
}

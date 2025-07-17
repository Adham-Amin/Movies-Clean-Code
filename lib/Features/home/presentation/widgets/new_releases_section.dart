import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';
import 'package:movies/Core/widgets/poster_image.dart';
import 'package:movies/Features/details/presentation/views/details_movie_view.dart';
import 'package:movies/Features/home/presentation/widgets/section_container.dart';

class NewReleasesSection extends StatelessWidget {
  const NewReleasesSection({super.key, required this.movies});

  final List<MoviesEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'New Releases',
      height: 200.h,
      itemCount: movies.length,
      itemBuilder:
          (_, index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailsMovieView.routeName,
                arguments: movies[index].idMovie,
              );
            },
            child: PosterImage(movie: movies[index]),
          ),
    );
  }
}

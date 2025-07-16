import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';
import 'package:movies/Features/home/presentation/widgets/recomended_item.dart';
import 'package:movies/Features/home/presentation/widgets/section_container.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key, required this.movies});

  final List<MoviesEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Recommended',
      height: 270.h,
      itemCount: 10,
      itemBuilder:
          (_, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  offset: const Offset(0, 4),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: RecomendedItem(movie: movies[index]),
          ),
    );
  }
}
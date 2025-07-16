import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';
import 'package:movies/Core/utils/app_assets.dart';
import 'package:movies/Core/widgets/custom_network_image.dart';
import 'package:movies/Features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:movies/Features/watchlist/presentation/cubit/wishlist_state.dart';

class PosterImage extends StatelessWidget {
  final double height;
  final MoviesEntity movie;

  const PosterImage({super.key, this.height = 200, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CustomCachedNetworkImage(image: movie.posterUrl),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: BlocBuilder<WatchlistCubit, WatchlistState>(
              builder: (context, state) {
                final isBookmarked =
                    state is WatchlistLoaded &&
                    state.watchlist.any((e) => e.idMovie == movie.idMovie);

                return InkWell(
                  onTap: () {
                    context.read<WatchlistCubit>().toggleWatchlist(movie);
                  },
                  child: Image.asset(
                    isBookmarked
                        ? AppAssets.imagesBookmark
                        : AppAssets.imagesUnbookmark,
                    height: 36.h,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/utils/app_styles.dart';
import 'package:movies/Core/widgets/error_widget.dart';
import 'package:movies/Core/widgets/loading_widget.dart';
import 'package:movies/Core/widgets/poster_image.dart';
import 'package:movies/Features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:movies/Features/watchlist/presentation/cubit/wishlist_state.dart';
import 'package:movies/core/utils/app_colors.dart';

class WatchlistViewBody extends StatelessWidget {
  const WatchlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: state.watchlist.length,
              itemBuilder: (context, index) {
                return PosterImage(movie: state.watchlist[index]);
              },
            );
          } else if (state is WatchlistError) {
            return FailureWidget(message: state.message);
          } else if (state is WatchlistLoading) {
            return LoadingWidget();
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.tv_off_outlined,
                    color: AppColors.goldenHoney,
                    size: 80.sp,
                  ),
                  SizedBox(height: 10.h),
                  Text('No Movies Found', style: AppStyles.textLight13),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

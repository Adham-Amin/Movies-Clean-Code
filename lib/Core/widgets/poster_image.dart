import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/utils/app_assets.dart';
import 'package:movies/Core/widgets/custom_network_image.dart';

class PosterImage extends StatefulWidget {
  final double height;
  final String image;

  const PosterImage({super.key, this.height = 200, required this.image});

  @override
  State<PosterImage> createState() => _PosterImageState();
}

class _PosterImageState extends State<PosterImage> {
  bool showBookmark = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CustomCachedNetworkImage(image: widget.image),
          ),
          if (!showBookmark)
            Positioned(
              top: 0,
              left: 0,
              child: InkWell(
                onTap: () => setState(() => showBookmark = !showBookmark),
                child: Image.asset(AppAssets.imagesBookmark, height: 36.h),
              ),
            ),
        ],
      ),
    );
  }
}
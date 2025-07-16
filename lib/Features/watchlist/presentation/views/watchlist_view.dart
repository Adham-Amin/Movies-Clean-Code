import 'package:flutter/material.dart';
import 'package:movies/Core/utils/app_styles.dart';
import 'package:movies/Features/watchlist/presentation/widgets/watchlist_view_body.dart';

class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text('Watchlist', style: AppStyles.textSemiBold18),
    ), body: WatchlistViewBody());
  }
}

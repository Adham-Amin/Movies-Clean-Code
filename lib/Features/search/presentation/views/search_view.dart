import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/services/getit_service.dart';
import 'package:movies/Features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:movies/Features/search/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt.get<SearchCubit>(),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}

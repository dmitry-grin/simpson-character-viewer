import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simpsons_character_viewer/app/service_locator/service_locator.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/data/characters_data_source.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/data/characters_detail_data_source.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/domain/search/character_searchable.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/cubits/character_detail_cubit.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/cubits/characters_list_cubit.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/character_detail_page.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/character_search_page.dart';

import 'character_detail_arguments.dart';

class CharacterViewerRoutes {
  static const characterSearch = '/characterSearch';
  static const characterDetail = '/characterDetail';
  static const characterDetailName = 'characterDetail';

  List<RouteBase> init() {
    return [
      GoRoute(
        path: characterSearch,
        builder: (context, routerState) => BlocProvider<CharactersListCubit>(
          create: (BuildContext context) {
            return CharactersListCubit(
              charactersDataSource: CharactersDataSourceImpl(getIt<Dio>()),
              characterSearchable: CharacterSearchableImpl(),
            );
          },
          child: const CharacterSearchPage(),
        ),
      ),
      GoRoute(
        path: characterDetail,
        name: characterDetailName,
        builder: (context, routerState) {
          assert(routerState.extra is CharacterDetailArguments, 'Wrong arguments, expecting $CharacterDetailArguments');

          final arguments = routerState.extra as CharacterDetailArguments;

          return BlocProvider<CharacterDetailCubit>(
            create: (BuildContext context) => CharacterDetailCubit(
              characterDetailDataSource: CharacterDetailDataSourceImpl(
                getIt<Dio>(),
                localDataSource: getIt<CharacterDetailsLocalDataSource>(),
              ),
              arguments: arguments,
            ),
            child: const CharacterDetailPage(),
          );
        },
      )
    ];
  }
}

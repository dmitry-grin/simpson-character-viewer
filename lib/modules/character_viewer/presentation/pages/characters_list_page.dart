import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simpsons_character_viewer/app/presentation/theme/text_theme_extension.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/cubits/characters_list/characters_list_cubit.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/cubits/characters_list/characters_list_state.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/default_error_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/loading_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/sliver_search_field.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/text_highlight_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/routes/character_detail_arguments.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/routes/character_viewer_routes.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({super.key});

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();

    textEditingController = TextEditingController();
    context.read<CharactersListCubit>().fetchCharacters();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(1),
      body: SafeArea(
        child: BlocBuilder<CharactersListCubit, CharactersListState>(
          builder: (context, state) => state.map(
            loading: (_) => const LoadingWidget(),
            error: (_) => DefaultErrorWidget(onRetry: context.read<CharactersListCubit>().fetchCharacters),
            loaded: (loadedState) => _LoadedBody(
              state: loadedState,
              controller: textEditingController,
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadedBody extends StatelessWidget {
  const _LoadedBody({required this.state, required this.controller});

  final Loaded state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final items = state.searchTerm != null ? state.filteredCharacters : state.allCharacters;

    final noItemsFound = state.searchTerm != null && state.filteredCharacters.isEmpty;

    return CustomScrollView(
      slivers: [
        const CupertinoSliverNavigationBar(
          border: Border(),
          largeTitle: Text('Simpsons'),
        ),
        SliverPersistentHeader(
          delegate: SliverSearchField(controller: controller),
          pinned: true,
        ),
        if (noItemsFound) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'No Simpsons found, please correct terms',
                textAlign: TextAlign.center,
                style: context.textStyles.title,
              ),
            ),
          ),
        ] else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: TextHighlightWidget(
                  baseText: items[index].name,
                  searcherText: state.searchTerm ?? '',
                  textStyle: context.textStyles.title,
                ),
                onTap: () => context.pushNamed(
                  CharacterViewerRoutes.characterDetailName,
                  extra: CharacterDetailArguments(items[index], searchTerm: state.searchTerm),
                ),
              ),
              childCount: items.length,
            ),
          ),
      ],
    );
  }
}

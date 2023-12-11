import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/cubits/characters_list_cubit.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/default_error_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/loading_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/sliver_search_field.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/text_highlight_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/routes/character_detail_arguments.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/routes/character_viewer_routes.dart';

class CharacterSearchPage extends StatefulWidget {
  const CharacterSearchPage({super.key});

  @override
  State<CharacterSearchPage> createState() => _CharacterSearchPageState();
}

class _CharacterSearchPageState extends State<CharacterSearchPage> {
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
          builder: (context, state) {
            if (state is CharactersListLoading) {
              return const LoadingWidget();
            } else if (state is CharactersListLoaded) {
              return _LoadedBody(state: state, controller: textEditingController);
            } else if (state is CharactersListError) {
              return DefaultErrorWidget(
                onRetry: context.read<CharactersListCubit>().fetchCharacters,
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _LoadedBody extends StatelessWidget {
  const _LoadedBody({required this.state, required this.controller});

  final CharactersListLoaded state;
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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'No Simpsons found, correct terms',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
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
                  textStyle: const TextStyle(fontSize: 16),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpsons_character_viewer/app/presentation/theme/text_theme_extension.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/cubits/character_detail/character_detail_cubit.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/cubits/character_detail/character_detail_state.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/default_error_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/loading_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/text_highlight_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/routes/character_detail_arguments.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({
    super.key,
    required this.arguments,
    required this.cubit,
  });

  final CharacterDetailArguments arguments;
  final CharacterDetailCubit cubit;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  void initState() {
    super.initState();

    widget.cubit.loadImageFor(character: widget.arguments.character);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Character'),
      ),
      body: SafeArea(
        child: BlocBuilder<CharacterDetailCubit, CharactersDetailState>(builder: (context, state) {
          return state.map(
            loading: (_) => const LoadingWidget(),
            loaded: (loadedState) => _LoadedBody(state: loadedState, arguments: widget.arguments),
            error: (_) => DefaultErrorWidget(
              onRetry: () => widget.cubit.loadImageFor(character: widget.arguments.character),
            ),
          );
        }),
      ),
    );
  }
}

class _LoadedBody extends StatelessWidget {
  const _LoadedBody({
    required this.state,
    required this.arguments,
  });

  final DetailLoaded state;
  final CharacterDetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    final Widget image = state.imageData != null ? Image.memory(state.imageData!) : Image.asset('images/incognito.png');

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 32),
            image,
            const SizedBox(height: 32),
            Text(arguments.character.name, style: context.textStyles.largeTitle),
            const SizedBox(height: 16),
            TextHighlightWidget(
              baseText: arguments.character.description,
              searcherText: arguments.searchTerm ?? '',
              textStyle: context.textStyles.title,
            ),
          ],
        ),
      ),
    );
  }
}

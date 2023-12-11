import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/cubits/character_detail_cubit.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/default_error_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/loading_widget.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/pages/widgets/text_highlight_widget.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({super.key});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  void initState() {
    super.initState();

    context.read<CharacterDetailCubit>().loadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Character'),
      ),
      body: SafeArea(
        child: BlocBuilder<CharacterDetailCubit, CharacterDetailState>(builder: (context, state) {
          if (state is CharacterDetailLoading) {
            return const LoadingWidget();
          } else if (state is CharacterDetailError) {
            return DefaultErrorWidget(
              onRetry: context.read<CharacterDetailCubit>().loadImage,
            );
          } else if (state is CharacterDetailLoaded) {
            return _LoadedBody(state: state);
          }
        
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}

class _LoadedBody extends StatelessWidget {
  const _LoadedBody({
    required this.state,
  });

  final CharacterDetailLoaded state;

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
            Text(state.arguments.character.name, style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextHighlightWidget(
              baseText: state.arguments.character.text,
              searcherText: state.arguments.searchTerm ?? '',
              textStyle: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

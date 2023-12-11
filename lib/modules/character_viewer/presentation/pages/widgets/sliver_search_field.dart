import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/cubits/characters_list/characters_list_cubit.dart';


class SliverSearchField extends SliverPersistentHeaderDelegate {
  SliverSearchField({
    this.collapsedHeight = 64.0,
    this.expandedHeight = 64.0,
    required this.controller,
  });

  final double expandedHeight;
  final double collapsedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => max(expandedHeight, minExtent);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).barBackgroundColor.withOpacity(1),
        border: const Border(
          bottom: BorderSide(
            color: Color(0x4D000000),
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CupertinoSearchTextField(
          controller: controller,
          onChanged: (String? searchTerm) {
            context.read<CharactersListCubit>().search(term: searchTerm ?? '');
          },
          onSuffixTap: () {
            context.read<CharactersListCubit>().cancelSearch();
            controller.clear();
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverSearchField oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight || collapsedHeight != oldDelegate.collapsedHeight;
  }
}
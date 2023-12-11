import 'package:flutter/material.dart';

class TextHighlightWidget extends StatelessWidget {
  final String baseText;
  final String searcherText;
  final TextStyle textStyle;
  final Color? textHighlightColor;

  const TextHighlightWidget({
    required this.baseText,
    required this.searcherText,
    required this.textStyle,
    this.textHighlightColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: _highlightOccurrences(textHighlightColor ?? const Color(0xFFFFE700)),
        style: textStyle,
      ),
    );
  }

  List<TextSpan> _highlightOccurrences(Color textHighlightColor) {
    if (searcherText.isEmpty || !baseText.toLowerCase().contains(searcherText.toLowerCase())) {
      return [TextSpan(text: baseText)];
    }
    final matches = searcherText.toLowerCase().allMatches(baseText.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(text: baseText.substring(lastMatchEnd, match.start)));
      }

      children.add(
        TextSpan(
          text: baseText.substring(match.start, match.end),
          style: textStyle.copyWith(backgroundColor: textHighlightColor),
        ),
      );

      if (i == matches.length - 1 && match.end != baseText.length) {
        children.add(TextSpan(text: baseText.substring(match.end, baseText.length)));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }
}

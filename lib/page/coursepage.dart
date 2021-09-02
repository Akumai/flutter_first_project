import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({
    Key? key,
    required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    String wordPairs = generateWordPairs().take(100).join(" ");
    return Text(
      'Index 0: All $wordPairs',
      style: optionStyle,
    );
  }
}

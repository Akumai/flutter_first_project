import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:startup_namer/model/courses.dart';

class CoursesPage extends StatelessWidget {
  final TextStyle optionStyle;

  const CoursesPage({
    Key? key,
    required this.optionStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String wordPairs = generateWordPairs().take(100).join(" ");
    return SingleChildScrollView(
      child: Text(
        'Index 0: All $wordPairs',
        style: optionStyle,
      ),
    );
  }
}

class RandomCourses extends StatelessWidget {
  final int amount;

  const RandomCourses({Key? key, this.amount = 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CourseTemplate> _courses = CourseTemplate.randomCourseList(amount);
    return ListView.builder(
      itemCount: _courses.length * 2 - 1,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();
        final courseIndex = i ~/ 2;
        if (courseIndex >= _courses.length) {
          return Container();
        }
        return _buildRow(_courses[courseIndex]);
      },
    );
  }

  Widget _buildRow(CourseTemplate course) {
    return Row(
      children: [
        // Text(course.imgPath),
        SvgPicture.asset(course.imgPath, width: 40),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.header,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                course.description,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        )
      ],
    );
  }
}

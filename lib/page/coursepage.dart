import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:startup_namer/model/courses.dart';

class RandomCourses extends StatelessWidget {
  final int amount;

  const RandomCourses({Key? key, this.amount = 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CourseTemplate> _courses = CourseTemplate.randomCourseList(amount);
    return Container(
      color: Color(0xff5bc0a3),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Theme.of(context).canvasColor),
        // color: Colors.white),
        child: ListView.builder(
          itemCount: _courses.length * 2 - 1,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();
            final courseIndex = i ~/ 2;
            if (courseIndex >= _courses.length) {
              return Container();
            }
            return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/soundpage");
                },
                child: _buildRow(_courses[courseIndex]));
          },
        ),
      ),
    );
  }

  Widget _buildRow(CourseTemplate course) {
    return Row(
      children: [
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

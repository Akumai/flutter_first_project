import 'dart:math';

const loremIpsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

const svgImages = [
  "img/011-educator.svg",
  "img/014-xylophone.svg",
  "img/020-car toy.svg",
  "img/028-book.svg",
  "img/040-pyramid.svg",
];

class CourseTemplate {
  static const String defaultHeader = "Header of the Course";
  static const String defaultDescription = "Description of the Course";
  static final random = Random();

  String imgPath = defaultHeader;

  String header = defaultDescription;

  String description = svgImages[0];

  CourseTemplate(int index) {
    imgPath = randomImage();
    header = someHeader(index);
    description = randomDescription(index * 100);
  }

  static String someHeader(int index) {
    return "$defaultHeader $index";
  }

  /// Get description with [maxLength], minimal would be [defaultDescription]
  static String randomDescription(int maxLength) {
    int randomLength = max(0, maxLength - defaultDescription.length);
    String randomDesc =
        loremIpsum.substring(0, min(loremIpsum.length, randomLength));
    return "$defaultDescription $randomDesc";
  }

  static String randomImage() {
    return svgImages[random.nextInt(svgImages.length)];
  }

  static List<CourseTemplate> randomCourseList([int count = 5]) {
    var res = <CourseTemplate>[];
    for (var i = 0; i < count; i++) {
      res.add(CourseTemplate(i));
    }
    return res;
  }
}

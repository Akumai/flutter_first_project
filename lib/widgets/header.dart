import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Row(children: [
          Text("Header?", style: TextStyle(fontSize: 30, color: Colors.white)),
          Expanded(child: Container()),
          IconButton(
            icon: Icon(
              Icons.supervised_user_circle,
              size: 24,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ]));
  }
}

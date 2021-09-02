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
          Text("Header?", style: TextStyle(fontSize: 30)),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("img/011-educator.png"),
            ),
          ),
        ]));
  }
}

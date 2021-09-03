import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      // color: Colors.green,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xff5bc0a3), Color(0xff5baccc)]),
      ),
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
      ]),
    );
  }
}

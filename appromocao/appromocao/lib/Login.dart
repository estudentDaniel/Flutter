import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FieldTitle extends StatelessWidget {
  FieldTitle({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3, bottom: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(color: Colors.blue, fontSize: 20),
          ),
          Text(
            "$subtitle: ",
            style: const TextStyle(color: Color.fromARGB(255, 19, 19, 20)),
          ),
        ],
      ),
    );
  }
}

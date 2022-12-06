import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PageTitle extends StatelessWidget {
  PageTitle({this.label, this.iconData, this.onTap, this.highlighted: true});

  late String? label;
  final IconData? iconData;
  final VoidCallback? onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label!,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: highlighted ? Colors.black : Colors.blue,
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? Colors.blue : Colors.black,
      ),
      onTap: onTap,
    );
  }
}

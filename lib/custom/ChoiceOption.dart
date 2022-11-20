import 'package:flutter/material.dart';
import 'package:last_year_project/utils/constants.dart';

class ChoiceOption extends StatelessWidget {
  final String text;
  final Widget child;
  final EdgeInsets padding;
  final double width, height;

  const ChoiceOption(
      {Key? key,
      required this.text,
      required this.padding,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.only(left: 15, right: 20, top: 13, bottom: 13),
      child: Row(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: COLOR_WHITE,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2),
            ),
            padding: padding,
            child: Center(child: child),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: themeData.textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final dynamic itemData;

  const CardItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.asset(
            itemData["image"],
          ),
        ),
      ]),
    );
  }
}

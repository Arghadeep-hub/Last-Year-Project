import 'package:flutter/material.dart';
import 'package:last_year_project/custom/BorderBox.dart';
import 'package:last_year_project/sample_data.dart';
import 'package:last_year_project/utils/constants.dart';
import 'package:last_year_project/utils/widget_functions.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 18;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: Size.width,
          height: Size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    BorderBox(
                      padding: EdgeInsets.all(0),
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.menu,
                        color: COLOR_BLACK,
                      ),
                    ),
                    BorderBox(
                      padding: EdgeInsets.all(0),
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.settings,
                        color: COLOR_BLACK,
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Text(
                  "Connected",
                  style: themeData.textTheme.bodyText2,
                ),
              ),
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Text(
                  "SAMSUNG Screen",
                  style: themeData.textTheme.headline1,
                ),
              ),
              const Padding(
                padding: sidePadding,
                child: Divider(
                  height: 25,
                  color: COLOR_GREY,
                ),
              ),
              addVerticalSpace(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ["Bluetooth", "Message", "Voice Over"]
                      .map((filter) => ChoiceOption(text: filter))
                      .toList(),
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                    itemCount: RE_DATA.length,
                    itemBuilder: (context, index) {
                      return Text("Item");
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 13,
      ),
      margin: const EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

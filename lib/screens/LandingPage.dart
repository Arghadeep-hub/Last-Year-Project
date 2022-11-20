import 'package:flutter/material.dart';
import 'package:last_year_project/custom/BorderBox.dart';
import 'package:last_year_project/custom/ChoiceOption.dart';
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
                      width: 45,
                      height: 45,
                      child: Icon(
                        Icons.menu,
                        color: COLOR_BLACK,
                      ),
                    ),
                    BorderBox(
                      padding: EdgeInsets.all(0),
                      width: 45,
                      height: 45,
                      child: Icon(
                        Icons.bedtime,
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
                  children: const [
                    Padding(
                      padding: sidePadding,
                      child: ChoiceOption(
                        padding: EdgeInsets.all(0),
                        width: 40,
                        height: 40,
                        text: "Connect via Bluetooth",
                        child: Icon(
                          Icons.bluetooth,
                          color: COLOR_BLACK,
                        ),
                      ),
                    ),
                    Padding(
                      padding: sidePadding,
                      child: ChoiceOption(
                        padding: EdgeInsets.all(0),
                        width: 40,
                        height: 40,
                        text: "Record a Message",
                        child: Icon(
                          Icons.keyboard_voice_rounded,
                          color: COLOR_BLACK,
                        ),
                      ),
                    ),
                    Padding(
                      padding: sidePadding,
                      child: ChoiceOption(
                        padding: EdgeInsets.all(0),
                        width: 40,
                        height: 40,
                        text: "Type a Message",
                        child: Icon(
                          Icons.keyboard,
                          color: COLOR_BLACK,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(20),
              Expanded(
                child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                    itemCount: RE_DATA.length,
                    itemBuilder: (context, index) {
                      // return CardItem(itemData: RE_DATA[index]);
                      return Text("data");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final dynamic itemData;

  const CardItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                itemData["image"],
              ),
            ),
            const Positioned(
              top: 15,
              right: 15,
              child: BorderBox(
                height: 50,
                padding: EdgeInsets.all(0),
                width: 50,
                child: Icon(
                  Icons.favorite_border,
                  color: COLOR_BLACK,
                ),
              ),
            )
          ],
        ),
        addVerticalSpace(15),
        Row(
          children: [
            Text(
              "${(itemData["amount"])}",
              style: themeData.textTheme.headline1,
            ),
            addHorizontalSpace(10),
            Text(
              "${itemData["address"]}",
              style: themeData.textTheme.bodyText2,
            ),
            addHorizontalSpace(10),
            Text(
              "${itemData["bedrooms"]} bedrooms/ ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
              style: themeData.textTheme.headline5,
            )
          ],
        )
      ]),
    );
  }
}

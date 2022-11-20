import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:last_year_project/custom/BorderBox.dart';
import 'package:last_year_project/custom/ChoiceOption.dart';
import 'package:last_year_project/utils/constants.dart';
import 'package:last_year_project/utils/widget_functions.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var _speechToText = stts.SpeechToText();
  bool isListening = false;
  String infoText = "Please press button for speaking.";

  void listen() async {
    if (!isListening) {
      bool available = await _speechToText.initialize(
        onStatus: (status) => print("$status"),
        onError: (errorNotification) => print("$errorNotification"),
      );

      if (available) {
        setState(() {
          isListening = true;
        });
        _speechToText.listen(
          onResult: (result) => setState(() {
            infoText = result.recognizedWords;
          }),
        );
      }
    } else {
      setState(() {
        isListening = false;
      });
      _speechToText.stop();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speechToText = stts.SpeechToText();
  }

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
                  ],
                ),
              ),
              addVerticalSpace(20),
              SingleChildScrollView(
                child: Padding(
                  padding: sidePadding,
                  child: Text(
                    infoText,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: isListening,
          repeat: true,
          endRadius: 80,
          glowColor: Colors.red,
          duration: Duration(milliseconds: 1000),
          child: FloatingActionButton(
            onPressed: () {
              listen();
            },
            child: Icon(isListening ? Icons.mic : Icons.mic_none),
          ),
        ),
      ),
    );
  }
}

import 'package:benchease/presentation/dashboard/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../application/domain/models/application_config.dart';
import '../../core/domain/utils/constants/app_colors.dart';
import '../../core/presentation/widgets/application_logo.dart';
import '../../core/presentation/widgets/at_text.dart';
import 'package:text_to_speech/text_to_speech.dart';
import '../../core/presentation/widgets/keep_elevated_button.dart';
import '../../generated/assets.gen.dart';
import '../dashboard/bloc/dashboard_bloc.dart';
import '../dashboard/bloc/dashboard_state.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key, this.config}) : super(key: key);

  static const String routeName = '/welcome';
  static const String screenName = 'welcomeScreen';

  final ApplicationConfig? config;

  static ModalRoute<WelcomeScreen> route({ApplicationConfig? config}) =>
      MaterialPageRoute<WelcomeScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => WelcomeScreen(config: config),
      );

  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  TextToSpeech tts = TextToSpeech();
  bool page1 = true;
  bool page2 = false;
  bool page3 = false;
  bool page4 = false;

  @override
  void initState() {
    super.initState();
    String text =
        "Hello, Good day!, Welcome to Bench Ease! Streamlining the workday for Bench employees.";
    double volume = 1.0;
    tts.setVolume(volume);
    String language = 'en-US';
    tts.setLanguage(language);

    tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
        listener: (BuildContext context, DashboardState state) {},
        builder: (BuildContext context, DashboardState state) {
          return SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                return true;
              },
              child: Scaffold(
                  backgroundColor: AppColors.white,
                  body: Stack(children: <Widget>[
                    Positioned(
                      top: 0,
                      right: 0,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: SvgPicture.asset(
                          Assets.images.gear.path,
                          width: 70,
                          height: 70,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      left: -20,
                      child: SvgPicture.asset(
                        Assets.images.cogLoader.path,
                        width: 90,
                        height: 90,
                        color: AppColors.secondary,
                      ),
                    ),
                    Visibility(
                      visible: page1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 150,
                          ),
                          const Center(
                            child: ApplicationLogo(
                              height: 180,
                              width: 180,
                            ),
                          ),
                          const Center(
                            child: ATText(
                              text: 'Welcome to Bench Ease!',
                              fontSize: 26,
                              weight: FontWeight.bold,
                              fontColor: AppColors.secondary,
                            ),
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 18, right: 18),
                              child: ATText(
                                text:
                                    'Streamlining the workday for Bench employees.',
                                fontSize: 16,
                                fontColor: AppColors.black,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, top: 40),
                            child: SizedBox(
                              width: double.infinity,
                              child: KeepElevatedButton(
                                color: AppColors.secondary,
                                isLoading: state.isLoading,
                                cogColor: AppColors.white,
                                onPressed: () {
                                  setState(() {
                                    String text =
                                        "What is Bench Ease? What does it do? Who\'s it for? Press the next button to know more.";
                                    tts.speak(text);
                                    page1 = false;
                                    page2 = true;
                                    page3 = false;
                                    page4 = false;
                                  });
                                },
                                text: 'Continue',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //PAGE 2
                    Visibility(
                      visible: page2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 150,
                          ),
                          const Center(
                            child: ATText(
                              text: 'What is Bench Ease?',
                              fontSize: 26,
                              weight: FontWeight.bold,
                              fontColor: AppColors.secondary,
                            ),
                          ),
                          const Center(
                            child: ATText(
                              text: 'What does it do? Who\'s it for?',
                              fontSize: 16,
                              fontColor: AppColors.black,
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              child: Image(
                                width: 200,
                                height: 200,
                                image: Assets.images.people,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, top: 40),
                            child: SizedBox(
                              width: double.infinity,
                              child: KeepElevatedButton(
                                color: AppColors.secondary,
                                isLoading: state.isLoading,
                                cogColor: AppColors.white,
                                onPressed: () {
                                  setState(() {
                                    String text =
                                        "Bench Ease is a project designed to simplify and improve the daily tasks and experience of Bench Employees.";
                                    tts.speak(text);
                                    page1 = false;
                                    page2 = false;
                                    page3 = true;
                                    page4 = false;
                                  });
                                },
                                text: 'Next',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //PAGE 3
                    Visibility(
                      visible: page3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 150,
                          ),
                          const Center(
                            child: ATText(
                              text: 'We are Bench Ease',
                              fontSize: 26,
                              weight: FontWeight.bold,
                              fontColor: AppColors.secondary,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18, right: 18),
                            child: ATText(
                              text:
                                  'Bench Ease is a project designed to simplify',
                              fontSize: 16,
                              fontColor: AppColors.black,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18, right: 18),
                            child: ATText(
                              text:
                                  'and improve the daily tasks and experience of Bench Employees.',
                              fontSize: 16,
                              fontColor: AppColors.black,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              child: Image(
                                width: 250,
                                height: 200,
                                image: Assets.images.shakehand,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, top: 40),
                            child: SizedBox(
                              width: double.infinity,
                              child: KeepElevatedButton(
                                color: AppColors.secondary,
                                isLoading: state.isLoading,
                                cogColor: AppColors.white,
                                onPressed: () {
                                  setState(() {
                                    String text =
                                        "Let\'s start now! We\'ll walk you through the process and let\'s search a skill to filter the bench employees specifically.";
                                    tts.speak(text);
                                    page1 = false;
                                    page2 = false;
                                    page3 = false;
                                    page4 = true;
                                  });
                                },
                                text: 'Next',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //PAGE 4
                    Visibility(
                      visible: page4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 150,
                          ),
                          const Center(
                            child: ATText(
                              text: 'Let\'s start now!',
                              fontSize: 26,
                              weight: FontWeight.bold,
                              fontColor: AppColors.secondary,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18, right: 18),
                            child: ATText(
                              text:
                                  'We\'ll walk you through the process and let\'s search a skill to filter the bench employees',
                              fontSize: 16,
                              fontColor: AppColors.black,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const Center(
                            child: ATText(
                              text: 'specifically.',
                              fontSize: 16,
                              fontColor: AppColors.black,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              child: Image(
                                width: 250,
                                height: 200,
                                image: Assets.images.getstarted,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, top: 40),
                            child: SizedBox(
                              width: double.infinity,
                              child: KeepElevatedButton(
                                color: AppColors.secondary,
                                isLoading: state.isLoading,
                                cogColor: AppColors.white,
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      DashboardScreen.route(
                                          config: widget.config));
                                },
                                text: 'Get Started',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
            ),
          );
        });
  }
}

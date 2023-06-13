import 'package:benchease/application/domain/models/application_config.dart';
import 'package:benchease/core/data/mixin/back_pressed_mixin.dart';
import 'package:benchease/core/domain/utils/constants/app_colors.dart';
import 'package:benchease/core/presentation/widgets/application_logo.dart';
import 'package:benchease/core/presentation/widgets/at_text.dart';
import 'package:benchease/presentation/dashboard/presentation/dashboard_screen.dart';
import 'package:benchease/presentation/landing/bloc/landing_screen_bloc.dart';
import 'package:benchease/presentation/landing/bloc/landing_screen_state.dart';
import 'package:benchease/presentation/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/presentation/widgets/keep_elevated_button.dart';
import '../../../core/presentation/widgets/at_textfield.dart';
import '../../../generated/assets.gen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key, this.config}) : super(key: key);

  static const String routeName = '/landing';
  static const String screenName = 'landingScreen';

  final ApplicationConfig? config;

  static ModalRoute<LandingScreen> route({ApplicationConfig? config}) =>
      MaterialPageRoute<LandingScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => LandingScreen(
          config: config,
        ),
      );

  @override
  _LandingScreen createState() => _LandingScreen();
}

class _LandingScreen extends State<LandingScreen> with BackPressedMixin {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  bool isEditApi = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingScreenBloc, LandingScreenState>(
        listener: (BuildContext context, LandingScreenState state) {
      print('${!state.isLoading} ${state.isLoggedIn} ${!state.hasError}');
      if (!state.isLoading && state.isLoggedIn && !state.hasError) {
        isLoading = false;
        if (!state.didFinish) {
          Navigator.of(context).pushReplacement(
            WelcomeScreen.route(config: widget.config),
          );
        } else {
          Navigator.of(context).pushReplacement(
            DashboardScreen.route(config: widget.config),
          );
        }
      }
    }, builder: (BuildContext context, LandingScreenState state) {
      return SafeArea(
          child: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Scaffold(
                backgroundColor: AppColors.secondary,
                /*drawer: LandingDrawer(
                  landingBloc: context.read<LandingScreenBloc>(),
                ),*/
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        right: 0,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: SvgPicture.asset(
                            Assets.images.gear.path,
                            width: 130,
                            height: 130,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: SvgPicture.asset(
                          Assets.images.gear.path,
                          width: 130,
                          height: 130,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .97,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Center(
                                          child: ApplicationLogo(
                                            height: 180,
                                            width: 180,
                                          ),
                                        ),
                                        const ATText(
                                          text: 'Username',
                                          fontSize: 16,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ATTextfield(
                                          textEditingController:
                                              usernameController,
                                          textInputAction: TextInputAction.next,
                                          hintText: 'Enter your username',
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const ATText(
                                          text: 'Password',
                                          fontSize: 16,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ATTextfield(
                                          textEditingController:
                                              passwordController,
                                          textInputAction: TextInputAction.next,
                                          hintText: 'Enter your password',
                                          isSuffixIcon: true,
                                          isPasswordField: true,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Visibility(
                                          visible: state.hasError,
                                          child: ATText(
                                            text: state.errorMessage,
                                            fontSize: 14,
                                            fontColor: AppColors.criticalRed,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: KeepElevatedButton(
                                            color: AppColors.secondary,
                                            isLoading: state.isLoading,
                                            cogColor: AppColors.white,
                                            onPressed: () {
                                              context
                                                  .read<LandingScreenBloc>()
                                                  .login(
                                                      username:
                                                          usernameController
                                                              .text,
                                                      password:
                                                          passwordController
                                                              .text);
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            text: 'Login',
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .1,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

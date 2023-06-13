import 'package:benchease/presentation/dashboard/presentation/dashboard_screen.dart';
import 'package:benchease/presentation/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:benchease/application/domain/models/application_config.dart';
import 'package:benchease/core/presentation/widgets/application_logo.dart';
import 'package:benchease/core/presentation/widgets/at_loading_indicator.dart';
import 'package:benchease/generated/i18n.dart';
import 'package:benchease/presentation/splash/bloc/splashscreen_bloc.dart';
import 'package:benchease/presentation/splash/bloc/splashscreen_state.dart';

import '../landing/presentation/landing_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, this.config}) : super(key: key);

  static const String routeName = '/splash';
  static const String screenName = 'splashScreen';

  final ApplicationConfig? config;

  static ModalRoute<SplashScreen> route({ApplicationConfig? config}) =>
      MaterialPageRoute<SplashScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => SplashScreen(config: config),
      );

  @override
  Widget build(BuildContext context) {
    context.read<SplashScreenBloc>().loadSplashScreen(config: config);
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
        listener: (BuildContext context, SplashScreenState state) {
      if (!state.isLoading) {
        Navigator.of(context).pushReplacement(
          LandingScreen.route(config: config),
        );
      }
    }, builder: (BuildContext context, SplashScreenState state) {
      return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * .2),
                const ApplicationLogo(
                  width: 180,
                  height: 180,
                ),
                const SizedBox(height: 40),
                const CustomLoader(
                  height: 40,
                  width: 40,
                )
                /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(I18n.of(context).powered_by,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    )),
                const SizedBox(
                  width: 5,
                ),
                CompanyName(
                  firstname: I18n.of(context).company_firstname,
                  lastname: I18n.of(context).company_lastname,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ATText(
                  text: state.apiUrl,
                  fontSize: 12,
                  fontColor: AppColors.black,
                )
              ],
            )*/
              ],
            )
          ],
        ),
      );
    });
  }
}

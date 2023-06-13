import 'package:benchease/core/presentation/widgets/at_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../application/domain/models/application_config.dart';
import '../../../core/domain/utils/constants/app_colors.dart';
import '../../../core/presentation/widgets/at_textfield.dart';
import '../../../core/presentation/widgets/keep_elevated_button.dart';
import '../../../generated/assets.gen.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_state.dart';

class AddSkillScreen extends StatefulWidget {
  const AddSkillScreen({Key? key, this.config}) : super(key: key);

  static const String routeName = '/addSkill';
  static const String screenName = 'addSkillScreen';

  final ApplicationConfig? config;

  static ModalRoute<AddSkillScreen> route({ApplicationConfig? config}) =>
      MaterialPageRoute<AddSkillScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => AddSkillScreen(config: config),
      );

  @override
  _AddSkillScreen createState() => _AddSkillScreen();
}

class _AddSkillScreen extends State<AddSkillScreen> {
  final TextEditingController skillController = TextEditingController();

  String? skillGroup;

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            top: 30,
                            bottom: 10,
                          ),
                          child: ATText(
                            text: 'Create Skill',
                            fontColor: AppColors.black,
                            fontSize: 18,
                            weight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            bottom: 10,
                          ),
                          child: ATText(
                            text: 'Please input skill details',
                            fontColor: AppColors.silver,
                            fontSize: 14,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            top: 20,
                            bottom: 20,
                          ),
                          child: ATText(
                            text: 'SKILL NAME',
                            fontColor: AppColors.black,
                            fontSize: 14,
                            weight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          child: ATTextfield(
                            textEditingController: skillController,
                            textInputAction: TextInputAction.done,
                            hintText: 'Input Skill',
                            borderRadius: 6,
                            borderColor: AppColors.silver,
                          ),
                        ),
                        /*const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            top: 30,
                            bottom: 10,
                          ),
                          child: ATText(
                            text: 'SKILL CATEGORY',
                            fontColor: AppColors.black,
                            fontSize: 14,
                            weight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Wrap(
                            children: <Widget>[
                              SizedBox(
                                width: 130,
                                child: Row(
                                  children: <Widget>[
                                    Radio<String>(
                                      value: 'primary',
                                      groupValue: skillGroup,
                                      onChanged: radioOnChanged,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          skillGroup = 'primary';
                                        });
                                      },
                                      child: const ATText(
                                        text: 'Primary',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                child: Row(
                                  children: <Widget>[
                                    Radio<String>(
                                      value: 'secondary',
                                      groupValue: skillGroup,
                                      onChanged: radioOnChanged,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          skillGroup = 'secondary';
                                        });
                                      },
                                      child: const ATText(
                                        text: 'Secondary',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                child: Row(
                                  children: <Widget>[
                                    Radio<String>(
                                      value: 'other',
                                      groupValue: skillGroup,
                                      onChanged: radioOnChanged,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          skillGroup = 'other';
                                        });
                                      },
                                      child: const ATText(
                                        text: 'Others',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),*/
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
                                if (skillController.text.isNotEmpty) {
                                  context
                                      .read<DashboardBloc>()
                                      .addSkill(skillController.text)
                                      .then((value) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: ATText(
                                          text:
                                              'The skill is now added to the list.',
                                          weight: FontWeight.bold,
                                          fontColor: AppColors.white,
                                        ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: AppColors.secondary,
                                      ),
                                    );
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: ATText(
                                        text: 'Cannot input an empty skill.',
                                        weight: FontWeight.bold,
                                        fontColor: AppColors.white,
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: AppColors.criticalRed,
                                    ),
                                  );
                                }
                              },
                              text: 'Create',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                )),
          );
        });
  }

  void radioOnChanged(String? value) {
    setState(() {
      skillGroup = value;
      print(skillGroup);
    });
  }
}

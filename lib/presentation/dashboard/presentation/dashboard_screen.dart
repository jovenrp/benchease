import 'package:avatar_glow/avatar_glow.dart';
import 'package:benchease/core/presentation/widgets/at_loading_indicator.dart';
import 'package:benchease/generated/fonts.gen.dart';
import 'package:benchease/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:benchease/presentation/dashboard/bloc/dashboard_state.dart';
import 'package:benchease/presentation/dashboard/domain/models/hotskill_model.dart';
import 'package:benchease/presentation/dashboard/presentation/add_skill_screen.dart';
import 'package:benchease/presentation/employee_detail/presentation/employee_detail_screen.dart';
import 'package:benchease/core/domain/utils/string_extensions.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../../application/domain/models/application_config.dart';
import '../../../core/domain/utils/constants/app_colors.dart';
import '../../../core/presentation/widgets/at_text.dart';
import '../../../generated/assets.gen.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../domain/models/user_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, this.config}) : super(key: key);

  static const String routeName = '/dashboard';
  static const String screenName = 'dashboardScreen';

  final ApplicationConfig? config;

  static ModalRoute<DashboardScreen> route({ApplicationConfig? config}) => MaterialPageRoute<DashboardScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => DashboardScreen(config: config),
      );

  @override
  _DashboardScreen createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  TextEditingController searchController = TextEditingController();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();

  TextToSpeech tts = TextToSpeech();

  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();

  late stt.SpeechToText _speech;
  bool isListening = false;
  double confidence = 1.0;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    context.read<DashboardBloc>().getHotSkills();
    context.read<DashboardBloc>().getAllSkills();
    context.read<DashboardBloc>().getDemoStatus();
    //context.read<DashboardBloc>().searchSkill('javascript');
    double volume = 1.0;
    tts.setVolume(volume);
    String language = 'en-US';
    tts.setLanguage(language);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
        listener: (BuildContext context, DashboardState state) {},
        builder: (BuildContext context, DashboardState state) {
          return SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Scaffold(
                  backgroundColor: AppColors.white,
                  body: Stack(
                    children: <Widget>[
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
                      ShowCaseWidget(
                        onStart: (index, key) {
                          if (index == 0) {
                            String text = 'This is a search dropdown that lets you look for a skill of a bench employee.';
                            tts.speak(text);
                          } else if (index == 1) {
                            String text = 'This button is for adding a skill not listed on the search bar.';
                            tts.speak(text);
                          } else if (index == 2) {
                            String text = 'These are the top 10 frequently searched skills.';
                            tts.speak(text);
                            context.read<DashboardBloc>().clearDemo(true);
                          }
                        },
                        builder: Builder(
                          builder: (BuildContext context) {
                            if (state.didFinished == false) {
                              Future.delayed(const Duration(milliseconds: 500), () {
                                ShowCaseWidget.of(context).startShowCase([_one, _two, _three]);
                              });
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 18,
                                    top: 30,
                                    bottom: 10,
                                  ),
                                  child: ATText(
                                    text: 'Search Skill',
                                    fontColor: AppColors.black,
                                    fontSize: 18,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 18, right: 18),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Expanded(
                                          child: Showcase(
                                            key: _one,
                                            overlayColor: AppColors.primary,
                                            showcaseBackgroundColor: AppColors.secondary,
                                            contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                            descTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.white, fontFamily: FontFamily.poppins),
                                            description: 'This is a search dropdown that lets you look for a skill of a bench employee.',
                                            child: SizedBox(
                                              height: 40,
                                              child: DropdownSearch<String>.multiSelection(
                                                key: _openDropDownProgKey,
                                                /*dropdownBuilder: (context, List<String> selectedItem) {
                                          for (String item in selectedItem) {
                                            return ATText(
                                              text: item,
                                            );
                                          }
                                          return const Text('');
                                        },*/
                                                popupProps: PopupPropsMultiSelection.menu(
                                                  showSelectedItems: true,
                                                  showSearchBox: true,
                                                  searchFieldProps: TextFieldProps(
                                                    decoration: InputDecoration(
                                                      labelText: "Select a skill",
                                                      hintText: "Select a skill",
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        borderSide: const BorderSide(color: AppColors.secondary),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        borderSide: const BorderSide(color: AppColors.secondary),
                                                      ),
                                                      contentPadding: const EdgeInsets.all(10),
                                                    ),
                                                  ),
                                                ),
                                                dropdownSearchDecoration: InputDecoration(
                                                  labelText: "Select a skill",
                                                  hintText: "Select a skill",
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    borderSide: const BorderSide(color: AppColors.secondary),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    borderSide: const BorderSide(color: AppColors.secondary),
                                                  ),
                                                  contentPadding: const EdgeInsets.all(10),
                                                ),
                                                items: state.allSkills ?? <String>[],
                                                onChanged: (List<String>? item) {
                                                  String skills = '';
                                                  for (String skill in item ?? <String>[]) {
                                                    skills += '$skill,';
                                                  }
                                                  if (skills.isNotEmpty) {
                                                    context.read<DashboardBloc>().searchSkill(skills).then((value) {
                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                      context.read<DashboardBloc>().getHotSkills();
                                                    });
                                                  }
                                                },
                                              ),
                                            ),
                                          ), /*ATTextfield(
                                      textEditingController: searchController,
                                      textInputAction: TextInputAction.next,
                                      hintText: 'Search...',
                                      isPrefixIcon: true,
                                      borderRadius: 10,
                                      onFieldSubmitted: (String? value) {
                                        context.read<DashboardBloc>().searchSkill(value).then((value) => FocusManager.instance.primaryFocus?.unfocus());
                                      },
                                    ),*/
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Showcase(
                                          key: _two,
                                          overlayColor: AppColors.primary,
                                          showcaseBackgroundColor: AppColors.secondary,
                                          contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                          descTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.white, fontFamily: FontFamily.poppins),
                                          description: 'This button is for adding a skill not listed on the search bar',
                                          child: ConstrainedBox(
                                            constraints: const BoxConstraints(maxWidth: 45),
                                            child: ElevatedButton(
                                              onPressed: () => Navigator.of(context)
                                                  .push(
                                                AddSkillScreen.route(config: widget.config),
                                              )
                                                  .then((value) {
                                                context.read<DashboardBloc>().getHotSkills();
                                                context.read<DashboardBloc>().getAllSkills();
                                              }),
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size.zero, // Set this
                                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
                                                  primary: AppColors.secondary),
                                              child: const Icon(
                                                Icons.add_rounded,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 18,
                                    top: 20,
                                  ),
                                  child: ATText(
                                    text: 'HOT SKILLS',
                                    fontColor: AppColors.black,
                                    fontSize: 14,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
                                  child: Showcase(
                                    key: _three,
                                    overlayColor: AppColors.primary,
                                    showcaseBackgroundColor: AppColors.secondary,
                                    contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                    descTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.white, fontFamily: FontFamily.poppins),
                                    description: 'These are the top 10 frequently searched skills.',
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: <Widget>[
                                        for (HotSkillModel item in state.hotSkills ?? <HotSkillModel>[])
                                          Container(
                                            padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              color: AppColors.secondary,
                                            ),
                                            child: ATText(
                                              text: item.title,
                                              fontColor: AppColors.white,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 18,
                                    right: 18,
                                  ),
                                  child: Table(
                                    border: const TableBorder(
                                      bottom: BorderSide(
                                        color: AppColors.black,
                                        width: .5,
                                      ),
                                    ),
                                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                    columnWidths: const <int, TableColumnWidth>{
                                      0: FlexColumnWidth(),
                                      1: FlexColumnWidth(),
                                    },
                                    children: <TableRow>[
                                      TableRow(children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 18),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: const <Widget>[
                                                ATText(
                                                  text: 'Name',
                                                  fontColor: AppColors.black,
                                                  fontSize: 16,
                                                  weight: FontWeight.bold,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Icon(
                                                  Icons.sort,
                                                  color: AppColors.black,
                                                  size: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 18),
                                          child: Row(
                                            children: const <Widget>[
                                              ATText(
                                                text: 'Skills',
                                                fontColor: AppColors.black,
                                                fontSize: 16,
                                                weight: FontWeight.bold,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Icon(
                                                Icons.sort,
                                                color: AppColors.black,
                                                size: 20,
                                              )
                                            ],
                                          ),
                                        ),
                                      ])
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: state.isLoading == true
                                      ? Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: MediaQuery.of(context).size.height * .1,
                                            ),
                                            const Center(
                                              child: CustomLoader(
                                                width: 50,
                                                height: 50,
                                              ),
                                            )
                                          ],
                                        )
                                      : state.users?.isEmpty == true
                                          ? const Padding(
                                              padding: EdgeInsets.only(top: 0),
                                              child: Center(
                                                child: ATText(
                                                  text: 'No records to show',
                                                  fontColor: AppColors.primary,
                                                ),
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                                              child: ListView.builder(
                                                itemCount: (state.users?.length ?? 0),
                                                itemBuilder: (BuildContext context, int index) {
                                                  return InkWell(
                                                    onTap: () => Navigator.of(context).push(
                                                      EmployeeDetailScreen.route(config: widget.config, user: state.users?[index]),
                                                    ),
                                                    child: Table(
                                                      border: const TableBorder(
                                                        bottom: BorderSide(
                                                          color: AppColors.black,
                                                          width: .5,
                                                        ),
                                                      ),
                                                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                                      columnWidths: const <int, TableColumnWidth>{
                                                        0: FlexColumnWidth(),
                                                        1: FlexColumnWidth(),
                                                      },
                                                      children: <TableRow>[
                                                        TableRow(decoration: BoxDecoration(color: (index % 2) == 0 ? AppColors.white : AppColors.lightBlue), children: <Widget>[
                                                          Padding(
                                                            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 18),
                                                            child: Container(
                                                              alignment: Alignment.centerLeft,
                                                              child: ATText(
                                                                text:
                                                                    '${state.users?[index].firstName?.capitalizeFirstofEach()} ${state.users?[index].lastName?.capitalizeFirstofEach()}',
                                                                fontColor: AppColors.black,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 18),
                                                            child: ATText(
                                                              text: context.read<DashboardBloc>().getUserSkill(state.users?[index].skills).capitalizeFirstofEach(),
                                                              fontColor: AppColors.black,
                                                              fontSize: 14,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ])
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ), floatingActionButton: AvatarGlow(
                endRadius: 40.0,
                glowColor: AppColors.secondary,
                animate: isListening,
                child: FloatingActionButton(
                  backgroundColor: AppColors.secondary,
                  onPressed: () {
                    _listen(state.users ?? <UserModel>[]);
                  },
                  child: const Icon(Icons.mic, color: AppColors.white,),
                ),
              ),),
            ),
          );
        });
  }

  void _listen(List<UserModel> users)  async {
    if (!isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus $val'),
        onError: (val) {
          String text = 'I\'m sorry, Could you try that again.';
          tts.speak(text);
          //print('onError $val');
        },
      );
      if (available) {
        setState(() {
          isListening = true;
        });
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() {
        isListening = false;
        if (_text.contains('search')) {
          List<String> texts = _text.split(' ');
          String searchedSkill = '';
          int index = 0;
          for (String item in texts) {
            if (index > 0) {
              searchedSkill += '$item,';
            }
            index++;
          }
          tts.speak('Searching $searchedSkill');
          context.read<DashboardBloc>().searchSkill(searchedSkill);
        } else if (_text.contains('select')) {
          /*List<String> texts = _text.split(' ');
          String searchedSkill = '';
          int index = 0;
          for (String item in texts) {
            if (index > 0) {
              searchedSkill += '$item,';
            }
            index++;
          }*/
          EmployeeDetailScreen.route(config: widget.config, user: users[0]);
        } else {
          //print('none');
          String text = 'I\'m sorry, I could not do that right now.';
          tts.speak(text);
        }
        _speech.stop();
      });
    }
  }
}

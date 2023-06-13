import 'package:benchease/core/presentation/widgets/at_text.dart';
import 'package:benchease/presentation/employee_detail/bloc/employee_detail_bloc.dart';
import 'package:benchease/presentation/employee_detail/bloc/employee_detail_state.dart';
import 'package:benchease/presentation/employee_detail/presentation/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../application/domain/models/application_config.dart';
import '../../../core/domain/utils/constants/app_colors.dart';
import '../../../core/presentation/widgets/keep_elevated_button.dart';
import '../../../generated/assets.gen.dart';
import '../../dashboard/domain/models/user_model.dart';

class EmployeeDetailScreen extends StatefulWidget {
  const EmployeeDetailScreen({Key? key, this.config, this.user})
      : super(key: key);

  static const String routeName = '/employeeDetail';
  static const String screenName = 'employeeDetailScreen';

  final ApplicationConfig? config;
  final UserModel? user;

  static ModalRoute<EmployeeDetailScreen> route(
          {ApplicationConfig? config, UserModel? user}) =>
      MaterialPageRoute<EmployeeDetailScreen>(
        settings: const RouteSettings(name: routeName),
        builder: (_) => EmployeeDetailScreen(
          config: config,
          user: user,
        ),
      );

  @override
  _EmployeeDetailScreen createState() => _EmployeeDetailScreen();
}

class _EmployeeDetailScreen extends State<EmployeeDetailScreen> {
  @override
  void initState() {
    super.initState();
    //context.read<EmployeeDetailBloc>().getUserSkills(widget.user?.id);
    context.read<EmployeeDetailBloc>().getHotSkills(widget.user);
    //context.read<EmployeeDetailBloc>().getOtherSkills();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeDetailBloc, EmployeeDetailState>(
      listener: (BuildContext context, EmployeeDetailState state) {},
      builder: (BuildContext context, EmployeeDetailState state) {
        return SafeArea(
            child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.secondary,
              iconTheme: const IconThemeData(color: AppColors.background),
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: AppColors.white,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomContainer(
                    progress: 0.6,
                    size: 110,
                    backgroundColor: AppColors.secondary,
                    progressColor: AppColors.white,
                    picture: Positioned(
                      left: 50,
                      top: 5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.semiGrey,
                                border: Border.all(
                                    color: AppColors.white, width: 4)),
                            child: const Icon(
                              Icons.person,
                              color: AppColors.white,
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    name: Positioned(
                      left: MediaQuery.of(context).size.width * .37,
                      top: MediaQuery.of(context).size.height * .059,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: ATText(
                              text:
                                  '${widget.user?.firstName} ${widget.user?.lastName}',
                              weight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const ATText(
                            text: 'Flutter Developer',
                            fontSize: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const <int, TableColumnWidth>{
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 18),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      Assets.images.location.path,
                                      width: 20,
                                      height: 20,
                                      color: AppColors.black,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 18),
                                      child: ATText(
                                        text: 'Hybrid',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    Assets.images.person.path,
                                    width: 15,
                                    height: 15,
                                    color: AppColors.black,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: ATText(
                                      text: 'Codev Talent Manager',
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 18),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      Assets.images.timeshift.path,
                                      width: 17,
                                      height: 17,
                                      color: AppColors.black,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 12),
                                      child: ATText(
                                        text: '6:00 AM - 3:00 PM',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    Assets.images.dayshift.path,
                                    width: 20,
                                    height: 20,
                                    color: AppColors.black,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: ATText(
                                      text: 'Monday - Friday',
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 18),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      Assets.images.email.path,
                                      width: 15,
                                      height: 15,
                                      color: AppColors.black,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: ATText(
                                        text: widget.user?.email,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    Assets.images.contact.path,
                                    width: 17,
                                    height: 17,
                                    color: AppColors.black,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: ATText(
                                      text: '09652765522',
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 20),
                    width: double.infinity,
                    child: KeepElevatedButton(
                      color: AppColors.secondary,
                      isLoading: false,
                      cogColor: AppColors.white,
                      onPressed: () {
                        _launchInBrowser(Uri.parse(
                            'https://go.kierquebral.com/api/v1/report/resume/${widget.user?.id}'));
                      },
                      text: 'Download CV',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 18, right: 18, top: 20),
                    child: ATText(
                      text: 'Primary Skills',
                      weight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 10),
                    child: Wrap(
                      spacing: 7,
                      runSpacing: 10,
                      children: <Widget>[
                        for (String item in state.hotSkills ?? <String>[])
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: AppColors.secondary,
                            ),
                            child: ATText(
                              text: item,
                              fontColor: AppColors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 18, right: 18, top: 20),
                    child: ATText(
                      text: 'Secondary Skills',
                      weight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 10),
                    child: Wrap(
                      spacing: 7,
                      runSpacing: 10,
                      children: <Widget>[
                        for (String item in state.secondarySkills ?? <String>[])
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: AppColors.secondary,
                            ),
                            child: ATText(
                              text: item,
                              fontColor: AppColors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 18, right: 18, top: 30),
                    child: ATText(
                      text: 'Additional Skills',
                      weight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 10),
                    child: Wrap(
                      spacing: 7,
                      runSpacing: 10,
                      children: <Widget>[
                        for (String item in state.otherSkills ?? <String>[])
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: AppColors.secondary, width: 1.5),
                            ),
                            child: ATText(
                              text: item,
                              fontColor: AppColors.secondary,
                              weight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

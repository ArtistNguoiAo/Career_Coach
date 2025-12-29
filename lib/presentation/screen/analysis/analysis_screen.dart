import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/analysis/cubit/analysis_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key, required this.sessionId});

  final int sessionId;

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnalysisCubit()..init(widget.sessionId),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AutoRouter.of(context).maybePop();
            },
            child: Icon(FontAwesomeIcons.chevronLeft, color: context.theme.backgroundColor, size: 20),
          ),
          centerTitle: true,
          title: Text(
            context.language.analysis,
            style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
          ),
          backgroundColor: context.theme.primaryColor,
        ),
        body: BlocBuilder<AnalysisCubit, AnalysisState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 64,
                    child: RadarChart(
                      RadarChartData(
                        radarShape: RadarShape.polygon,
                        tickCount: 3,
                        ticksTextStyle: TextStyleUtils.normal(
                          color: context.theme.textColor,
                          fontSize: 10,
                        ),
                        tickBorderData: BorderSide(color: context.theme.primaryDarkColor),
                        gridBorderData: BorderSide(color: context.theme.primaryDarkColor),
                        titleTextStyle: TextStyleUtils.normal(
                          color: context.theme.textColor,
                          fontSize: 14,
                        ),
                        getTitle: (index, angle) {
                          switch (index) {
                            case 0:
                              return RadarChartTitle(text: context.language.technicalScore);
                            case 1:
                              return RadarChartTitle(text: context.language.communicationScore);
                            case 2:
                              return RadarChartTitle(text: context.language.confidenceScore);
                            default:
                              return const RadarChartTitle(text: '');
                          }
                        },
                        dataSets: [
                          RadarDataSet(
                            fillColor: context.theme.primaryColor.withAlpha((0.3 * 255).round()),
                            borderColor: context.theme.primaryColor,
                            borderWidth: 2,
                            dataEntries: [
                              RadarEntry(value: state.analysisEntity?.technicalScore.toDouble() ?? 0),
                              RadarEntry(value: state.analysisEntity?.communicationScore.toDouble() ?? 0),
                              RadarEntry(value: state.analysisEntity?.confidenceScore.toDouble() ?? 0),
                            ],
                          ),
                          RadarDataSet(
                            fillColor: Colors.transparent,
                            borderColor: Colors.transparent,
                            dataEntries: const [
                              RadarEntry(value: 100),
                              RadarEntry(value: 100),
                              RadarEntry(value: 100),
                            ],
                          ),
                        ],
                  
                        radarBorderData: const BorderSide(color: Colors.transparent),
                        titlePositionPercentageOffset: 0.1,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

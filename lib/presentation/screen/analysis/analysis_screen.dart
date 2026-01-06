import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/analysis/cubit/analysis_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: context.theme.backgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Lottie.asset(MediaUtils.ltBot, height: 130, fit: BoxFit.cover),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: context.theme.backgroundColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha((0.2 * 255).toInt()),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    context.language.overallScore,
                                    style: TextStyleUtils.normal(
                                      color: context.theme.primaryDarkColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  SleekCircularSlider(
                                    initialValue: state.analysisEntity?.overallScore ?? 0,
                                    min: 0,
                                    max: 100,
                                    innerWidget: (value) {
                                      return Center(
                                        child: Text(
                                          '${value.toInt()}',
                                          style: TextStyleUtils.bold(
                                            color: Color(0xFFF6A881),
                                            fontSize: 32,
                                          ),
                                        ),
                                      );
                                    },
                                    appearance: CircularSliderAppearance(
                                      startAngle: 270,
                                      angleRange: 360,
                                      size: 120,
                                      customWidths: CustomSliderWidths(
                                        trackWidth: 8,
                                        progressBarWidth: 12,
                                        shadowWidth: 28,
                                      ),
                                      customColors: CustomSliderColors(
                                        dotColor: Colors.white.withAlpha((0.8 * 255).toInt()),
                                        trackColor: Color(0xFFFFD4BE).withAlpha((0.4 * 255).toInt()),
                                        progressBarColor:  Color(0xFFF6A881),
                                        shadowColor: Color(0xFFFFD4BE),
                                        shadowStep: 10.0,
                                        shadowMaxOpacity: 0.6,
                                      ),
                                    ),
                                    onChange: (value) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 240,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: context.theme.backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.2 * 255).toInt()),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 100,
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            horizontalInterval: 20,
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: context.theme.primaryDarkColor,
                              strokeWidth: 1,
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(
                            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 20,
                                reservedSize: 32,
                                getTitlesWidget: (value, _) => Text(
                                  value.toInt().toString(),
                                  style: TextStyleUtils.normal(
                                    color: context.theme.textColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 60,
                                getTitlesWidget: (value, _) {
                                  String text;
                                  switch (value.toInt()) {
                                    case 0:
                                      text = context.language.technicalScore;
                                      break;
                                    case 1:
                                      text = context.language.communicationScore;
                                      break;
                                    case 2:
                                      text = context.language.confidenceScore;
                                      break;
                                    default:
                                      return const SizedBox.shrink();
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      text,
                                      textAlign: TextAlign.center,
                                      style: TextStyleUtils.normal(
                                        color: context.theme.textColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(
                                  toY: state.analysisEntity?.technicalScore.toDouble() ?? 0,
                                  width: 20,
                                  borderRadius: BorderRadius.circular(6),
                                  color: context.theme.primaryColor,
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(
                                  toY: state.analysisEntity?.communicationScore.toDouble() ?? 0,
                                  width: 20,
                                  borderRadius: BorderRadius.circular(6),
                                  color: context.theme.primaryColor,
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(
                                  toY: state.analysisEntity?.confidenceScore.toDouble() ?? 0,
                                  width: 20,
                                  borderRadius: BorderRadius.circular(6),
                                  color: context.theme.primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: context.theme.backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.2 * 255).toInt()),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: '${context.language.strengths}: ',
                              style: TextStyleUtils.bold(
                                color: context.theme.primaryDarkColor,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: state.analysisEntity?.strengths ?? '',
                                  style: TextStyleUtils.normal(
                                    color: context.theme.primaryDarkColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Text.rich(
                            TextSpan(
                              text: '${context.language.weaknesses}: ',
                              style: TextStyleUtils.bold(
                                color: context.theme.primaryDarkColor,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: state.analysisEntity?.weaknesses ?? '',
                                  style: TextStyleUtils.normal(
                                    color: context.theme.primaryDarkColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Text.rich(
                            TextSpan(
                              text: '${context.language.detailedFeedback}: ',
                              style: TextStyleUtils.bold(
                                color: context.theme.primaryDarkColor,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: state.analysisEntity?.detailedFeedback ?? '',
                                  style: TextStyleUtils.normal(
                                    color: context.theme.primaryDarkColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                        ],
                      )
                    ),
                    SizedBox(height: 16),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: context.theme.backgroundColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha((0.2 * 255).toInt()),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text.rich(
                          TextSpan(
                            text: '${context.language.recommendations}:\n',
                            style: TextStyleUtils.bold(
                              color: context.theme.primaryDarkColor,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: state.analysisEntity?.recommendations ?? '',
                                style: TextStyleUtils.normal(
                                  color: context.theme.primaryDarkColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

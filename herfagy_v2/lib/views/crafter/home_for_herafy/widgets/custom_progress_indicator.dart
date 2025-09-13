import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../viewmodels/home_crafter_view_model.dart';
import 'completed_uncompleted_projects_widget.dart';
import 'your_progress_widget.dart';
import 'package:herfagy_v2/utils/size_config.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Container(
      margin: EdgeInsets.all(SizeConfig.width(fraction: 0.03)),
      padding: EdgeInsets.all(SizeConfig.width(fraction: 0.05)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const YourProgressWidget(),
          SizedBox(height: SizeConfig.height(fraction: 0.015)),
          Selector<ProgressProvider, double>(
            selector: (_, vm) => vm.progress,
            builder: (_, progress, __) {
              return LinearPercentIndicator(
                percent: progress,
                lineHeight: SizeConfig.height(fraction: 0.012),
                animation: true,
                barRadius: const Radius.circular(20),
                progressColor: Colors.white,
                backgroundColor: Colors.white.withAlpha(77),
              );
            },
          ),
          SizedBox(height: SizeConfig.height(fraction: 0.015)),
          const CompletedUncompletedProjectsWidget(),
        ],
      ),
    );
  }
}

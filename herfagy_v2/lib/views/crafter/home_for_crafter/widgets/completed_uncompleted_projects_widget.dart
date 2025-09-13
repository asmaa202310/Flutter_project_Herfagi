import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utils/localization_extension.dart';
import '../../../../viewmodels/home_crafter_view_model.dart';

class CompletedUncompletedProjectsWidget extends StatelessWidget {
  const CompletedUncompletedProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Selector<ProgressProvider, int>(
          selector: (_, vm) => vm.completedProjects,
          builder: (_, completed, __) {
            return Text(
              context.localization.completedProjects(completed),
              style: const TextStyle(fontSize: 14, color: Colors.white),
            );
          },
        ),
        Selector<ProgressProvider, int>(
          selector: (_, vm) => vm.uncompletedProjects,
          builder: (_, uncompleted, __) {
            return Text(
              context.localization.uncompletedProjects(uncompleted),
              style: const TextStyle(fontSize: 14, color: Colors.white),
            );
          },
        ),
      ],
    );
  }
}

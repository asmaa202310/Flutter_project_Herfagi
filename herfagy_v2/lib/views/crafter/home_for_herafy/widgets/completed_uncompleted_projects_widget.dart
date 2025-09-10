import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              "مشاريع مكتملة: $completed",
              style: const TextStyle(fontSize: 14, color: Colors.white),
            );
          },
        ),
        Selector<ProgressProvider, int>(
          selector: (_, vm) => vm.uncompletedProjects,
          builder: (_, uncompleted, __) {
            return Text(
              "غير مكتملة: $uncompleted",
              style: const TextStyle(fontSize: 14, color: Colors.white),
            );
          },
        ),
      ],
    );
  }
}

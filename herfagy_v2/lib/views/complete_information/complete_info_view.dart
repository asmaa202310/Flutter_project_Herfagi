import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/complete_info_view_model.dart';
import 'package:herfagy_v2/views/complete_information/widgets/complete_info_view_body.dart';
import 'package:provider/provider.dart';

class CompleteInfoView extends StatelessWidget {
  const CompleteInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => CompleteInfoViewModel(),
        child: const CompleteInfoViewBody(),
      ),
    );
  }
}

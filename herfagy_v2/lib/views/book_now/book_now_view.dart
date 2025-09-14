import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/size_config.dart';
import '../../viewmodels/book_now_view_model.dart';
import 'widgets/book_now_view_body.dart';

class BookNowView extends StatelessWidget {
  const BookNowView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => BookNowViewModel(),
        child: const BookNowViewBody(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';

import '../../utils/size_config.dart';

import 'widgets/book_now_view_body.dart';

class BookNowView extends StatelessWidget {
  const BookNowView({super.key, required this.crafter});
  final Profile crafter;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(body: BookNowViewBody(crafter: crafter));
  }
}

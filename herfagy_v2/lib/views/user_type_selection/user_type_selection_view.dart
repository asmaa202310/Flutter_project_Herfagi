import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/user_type_selection_view_body.dart';

class UserTypeSelectionView extends StatelessWidget {
  const UserTypeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const UserTypeSelectionViewBody());
  }
}

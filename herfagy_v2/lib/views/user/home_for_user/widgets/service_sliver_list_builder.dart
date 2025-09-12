import 'package:flutter/material.dart';

import '../../../../viewmodels/home_user_view_model.dart';
import 'service_item.dart';

class ServiceSliverListBuilder extends StatelessWidget {
  const ServiceSliverListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: HomeUserViewModel.servicesList.length,
        (context, index) {
          var service = HomeUserViewModel.servicesList[index];
          return ServiceItem(
           
            service: service,
          );
        },
      ),
    );
  }
}

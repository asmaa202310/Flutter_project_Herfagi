import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/service_operation_view_model.dart';
import 'package:provider/provider.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/models/service.dart';
import '../../../user/home_for_user/widgets/category_item.dart';

class CrafterServicesBuilder extends StatelessWidget {
  const CrafterServicesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final profileVM = Provider.of<ProfileOperationViewModel>(context, listen: false);
    final serviceVM = Provider.of<ServiceOperationViewModel>(context, listen: false);

    return FutureBuilder<Profile?>(
      future: profileVM.getCurrentUserProfile(),
      builder: (context, profileSnapshot) {
        if (!profileSnapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final currentUser = profileSnapshot.data!;

        if (currentUser.serviceId == null) {
          return const Center(child: Text("No services found"));
        }

        return FutureBuilder<Service?>(
          future: serviceVM.getServiceById(currentUser.serviceId!),
          builder: (context, serviceSnapshot) {
            if (!serviceSnapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final service = serviceSnapshot.data!;
            return Padding(
              padding: EdgeInsets.all(SizeConfig.width(fraction: 0.04)),
              child: Center(
                child: CategoryItem(category: service, marginRight: 0),
              ),
            );
          },
        );
      },
    );
  }
}

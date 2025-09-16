import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:provider/provider.dart';
import 'service_item.dart';
import 'package:herfagy_v2/models/service.dart';

class ServiceSliverListBuilder extends StatefulWidget {
  final List<Service> services;

  const ServiceSliverListBuilder({super.key, required this.services});

  @override
  State<ServiceSliverListBuilder> createState() =>
      _ServiceSliverListBuilderState();
}

class _ServiceSliverListBuilderState extends State<ServiceSliverListBuilder> {
  List<Profile> profilesCrafters = [];
  List<Profile> profilesUsers = [];
  List<Service> servicesW = [];

  void _matchProfilesWithServices(List<Profile> profiles) {
    profilesCrafters.clear();
    servicesW.clear();

    bool foundCrafter = false;

    for (var profile in profiles) {
      for (var service in widget.services) {
        if (profile.serviceId == service.id) {
          profilesCrafters.add(profile);
          servicesW.add(service);
          foundCrafter = true;
          break;
        }
      }

      if (!foundCrafter) {
        profilesUsers.add(profile);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profiles = Provider.of<ProfileOperationViewModel>(context, listen: false).profiles;
    _matchProfilesWithServices(profiles);

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        var service = servicesW[index];
        var profilesCrafter = profilesCrafters[index];
        return ServiceItem(
          service: service,
          profilesCrafter: profilesCrafter,
          profilesUsers: profilesUsers,
        );
      }, childCount: servicesW.length),
    );
  }
}

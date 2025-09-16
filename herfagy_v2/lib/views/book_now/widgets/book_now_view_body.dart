import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/service.dart';
import 'package:herfagy_v2/utils/get_order_status_extension.dart';
import 'package:provider/provider.dart';
import 'package:herfagy_v2/models/order.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/modelsOperationsViewModel/order_operation_view_model.dart';
import '../../../viewmodels/book_now_view_model.dart';
import '../../../viewmodels/supabase/ModelsOperationsViewModel/service_operation_view_model.dart';
import '../../../utils/size_config.dart';
import '../../login/widgets/custom_text_field.dart';
import '../../onboarding/widgets/custom_elevated_button.dart';
import '../../user/orders_for_user/widgets/custom_general_app_bar.dart';

class BookNowViewBody extends StatelessWidget {
  const BookNowViewBody({super.key, required this.crafter});
  final Profile crafter;

  Future<void> _pickDate(BuildContext context) async {
    final provider = context.read<BookNowViewModel>();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      provider.setDate(picked);
    }
  }

  Future<void> _submitBooking(BuildContext context) async {
    final provider = Provider.of<BookNowViewModel>(context, listen: false);
    final currentProfile = await Provider.of<ProfileOperationViewModel>(
      context,
      listen: false,
    ).getCurrentUserProfile();

    if (!context.mounted) return;
    final localization = context.localization;

    if (!provider.validateForm() || provider.selectedDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(localization.requiredField)));
      return;
    }

    if (currentProfile == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(localization.reject)));
      return;
    }

    final OrderOperationViewModel operationViewModel =
        Provider.of<OrderOperationViewModel>(context, listen: false);

    Order newOrder = Order(
      serviceId: crafter.serviceId!,
      customerId: currentProfile.id,
      crafterId: crafter.id,
      date: provider.selectedDate!,
      status: OrderStatus.newOrder,
      details: provider.detailsController.text,
    );

    await operationViewModel.addOrder(newOrder);

    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(localization.completed)));
  }

  @override
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookNowViewModel>(context, listen: false);
    final serviceVM = Provider.of<ServiceOperationViewModel>(
      context,
      listen: false,
    );
    final profileVM = Provider.of<ProfileOperationViewModel>(
      context,
      listen: false,
    );
    final localization = context.localization;

    return FutureBuilder<Profile?>(
      future: profileVM.getCurrentUserProfile(),
      builder: (context, profileSnapshot) {
        if (!profileSnapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final currentProfile = profileSnapshot.data!;

        provider.nameController.text = currentProfile.username;
        provider.phoneController.text = currentProfile.phone ?? "";
        provider.addressController.text = currentProfile.location ?? "";

        return FutureBuilder<Service?>(
          future: serviceVM.getServiceById(crafter.serviceId!),
          builder: (context, serviceSnapshot) {
            final selectedService = serviceSnapshot.data;

            return CustomScrollView(
              slivers: [
                CustomGeneralSliverAppBar(
                  text: localization.bookNow,
                  automaticallyImplyLeading: true,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.width(fraction: 0.05)),
                    child: Form(
                      key: provider.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            label: localization.nameLabel,
                            hint: localization.nameHint,
                            controller: provider.nameController,
                            prefixIcon: Icons.person,
                            enabled: false,
                          ),
                          SizedBox(height: SizeConfig.height(fraction: 0.02)),

                          CustomTextField(
                            label: localization.phoneNumber,
                            hint: localization.enterPhoneNumber,
                            controller: provider.phoneController,
                            prefixIcon: Icons.phone,
                            keyboardType: TextInputType.phone,
                            validator: (value) => value == null || value.isEmpty
                                ? localization.requiredField
                                : null,
                          ),
                          SizedBox(height: SizeConfig.height(fraction: 0.02)),

                          CustomTextField(
                            label: localization.address,
                            hint: localization.enterAddress,
                            controller: provider.addressController,
                            prefixIcon: Icons.location_on,
                            validator: (value) => value == null || value.isEmpty
                                ? localization.requiredField
                                : null,
                          ),
                          SizedBox(height: SizeConfig.height(fraction: 0.02)),

                          CustomTextField(
                            label: localization.serviceType,
                            hint: localization.serviceType,
                            controller: TextEditingController(
                              text: selectedService?.name ?? "Loading...",
                            ),
                            enabled: false,
                            prefixIcon: Icons.build,
                          ),
                          SizedBox(height: SizeConfig.height(fraction: 0.02)),

                          CustomTextField(
                            label: localization.serviceDetails,
                            hint: localization.enterServiceDetails,
                            controller: provider.detailsController,
                            prefixIcon: Icons.description,
                            validator: (value) => value == null || value.isEmpty
                                ? localization.requiredField
                                : null,
                          ),
                          SizedBox(height: SizeConfig.height(fraction: 0.03)),

                          CustomElevatedButton(
                            onTap: () => _pickDate(context),
                            text: localization.selectDate,
                            fontSize: SizeConfig.text(fraction: 0.045),
                            height: SizeConfig.height(fraction: 0.07),
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(height: SizeConfig.height(fraction: 0.03)),

                          Selector<BookNowViewModel, DateTime?>(
                            selector: (_, provider) => provider.selectedDate,
                            builder: (_, selectedDate, _) {
                              if (selectedDate == null) {
                                return const SizedBox.shrink();
                              }
                              return Text(
                                "${localization.selectedDate} ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                style: TextStyle(
                                  fontSize: SizeConfig.text(fraction: 0.04),
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: SizeConfig.height(fraction: 0.05)),

                          CustomElevatedButton(
                            onTap: () => _submitBooking(context),
                            text: localization.confirmBooking,
                            fontSize: SizeConfig.text(fraction: 0.05),
                            height: SizeConfig.height(fraction: 0.07),
                            backgroundColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

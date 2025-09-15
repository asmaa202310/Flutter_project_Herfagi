import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:provider/provider.dart';

import '../../../utils/get_localize_title.dart';
import '../../../utils/size_config.dart';
import '../../../viewmodels/book_now_view_model.dart';
import '../../login/widgets/custom_text_field.dart';
import '../../onboarding/widgets/custom_elevated_button.dart';
import '../../user/orders_for_user/widgets/custom_general_app_bar.dart';

class BookNowViewBody extends StatelessWidget {
  const BookNowViewBody({super.key});

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

  void _submitBooking(BuildContext context) {
    final provider = context.read<BookNowViewModel>();
    final localization = context.localization;

    if (!provider.validateForm() ||
        provider.selectedService == null ||
        provider.selectedDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(localization.requiredField)));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(localization.completed)));
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<BookNowViewModel>();
    final localization = context.localization;
    final List<String> services = GetLocalizeTitle.getServices(context);

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
                    prefixIcon: Icons.phone,
                    validator: (value) => value == null || value.isEmpty
                        ? localization.requiredField
                        : null,
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
                  DropdownButtonFormField<String>(
                    initialValue: provider.selectedService,
                    decoration: InputDecoration(
                      labelText: localization.serviceType,
                      prefixIcon: const Icon(Icons.build, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: services.map((service) {
                      return DropdownMenuItem<String>(
                        value: service,
                        child: Text(service),
                      );
                    }).toList(),
                    onChanged: provider.setService,
                    validator: (value) =>
                        value == null ? localization.requiredField : null,
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

                  Selector<BookNowViewModel, String?>(
                    selector: (_, provider) => provider.selectedService,
                    builder: (_, selectedService, _) {
                      if (selectedService == null) {
                        return const SizedBox.shrink();
                      }
                      return Text(
                        "${localization.selectedService} $selectedService",
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
  }
}

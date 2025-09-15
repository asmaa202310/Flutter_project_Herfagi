import 'package:flutter/material.dart';
import 'package:herfagy_v2/constants/app_colors.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/views/onboarding/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import '../../../utils/get_localize_title.dart';
import '../../../viewmodels/complete_info_view_model.dart';

class CompleteInfoViewBody extends StatelessWidget {
  const CompleteInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompleteInfoViewModel>();
    final localization = context.localization;
    SizeConfig.init(context);
    List<String> services = GetLocalizeTitle.getServices(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.height(fraction: 0.04)),
            Text(
              localization.completeInfo,
              style: TextStyle(
                color: AppColors.kPrimaryColorLight,
                fontSize: SizeConfig.width(fraction: 0.095),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: SizeConfig.height(fraction: 0.05)),
            Text(
              localization.completeInfoNote,
              style: TextStyle(
                fontSize: SizeConfig.width(fraction: 0.05),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: SizeConfig.height(fraction: 0.1)),
            Text(
              localization.serviceType,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: provider.selectedService,
              decoration: InputDecoration(
                hintText: localization.selectService,
                prefixIcon: const Icon(
                  Icons.build,
                  color: AppColors.kPrimaryColorLight,
                ),
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
            const SizedBox(height: 20),
            Text(
              localization.uploadIdCardTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: provider.pickIdCardImage,
              child: Container(
                height: SizeConfig.height(fraction: 0.22),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: provider.idCardImage == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.upload_file,
                            size: 50,
                            color: AppColors.kPrimaryColorLight,
                          ),
                          const SizedBox(height: 10),
                          Text(localization.uploadIdCard),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          provider.idCardImage!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
              ),
            ),
            const Spacer(),
            CustomElevatedButton(
              onTap: () {},
              text: context.localization.next,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}

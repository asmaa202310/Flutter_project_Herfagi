import 'package:flutter/material.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/utils/size_config.dart';
import 'package:herfagy_v2/viewmodels/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'switch_item.dart';

class SettingsSection extends StatefulWidget {
  final VoidCallback onLogout;

  const SettingsSection({super.key, required this.onLogout});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.generalSettings,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: SizeConfig.width(fraction: 0.05),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        SwitchItem(
          icon: Icons.dark_mode,
          title: localization.darkMode,
          value: themeViewModel.isDarkMode,
          onChanged: (value) {
            themeViewModel.toggleDarkMode(value);
          },
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: widget.onLogout,
            icon: Icon(
              Icons.logout,
              color: Colors.white,
              size: SizeConfig.width(fraction: 0.05),
            ),
            label: Text(
              localization.logout,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.width(fraction: 0.05),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

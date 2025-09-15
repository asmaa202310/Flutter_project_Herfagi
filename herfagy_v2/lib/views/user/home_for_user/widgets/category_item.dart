import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/service.dart';
import '/utils/size_config.dart';
import '../../../../utils/get_localize_title.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    this.paddingAll,
    this.marginRight,
  });

  final Service category;
  final double? paddingAll;
  final double? marginRight;

  static final List<Color> _colors = [
    Colors.blue,
    Colors.lightBlueAccent,
    Colors.indigo,
    Colors.blueGrey,
    Colors.cyan,
  ];

  static final Map<String, IconData> _iconsMap = {
    "airConditioning": Icons.ac_unit,
    "painter": Icons.format_paint,
    "plumber": Icons.water_damage,
    "electrician": Icons.flash_on,
    "carpenter": Icons.handyman,
    "cleaning": Icons.cleaning_services,
    "gardener": Icons.park,
    "mechanic": Icons.build,
    "teacher": Icons.school,
    "doctor": Icons.local_hospital,
  };

  static final Map<String, ServiceKey> _serviceKeyMap = {
    "electrician": ServiceKey.electrician,
    "carpenter": ServiceKey.carpenter,
    "plumber": ServiceKey.plumber,
    "painter": ServiceKey.painter,
    "blacksmith": ServiceKey.blacksmith,
    "airConditioning": ServiceKey.airConditioning,
  };

  IconData _getIconData(String iconName) {
    return _iconsMap[iconName] ?? Icons.category;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final color = _colors[category.id % _colors.length];
    return Container(
      width: SizeConfig.width(fraction: 0.27),
      padding: EdgeInsets.all(paddingAll ?? SizeConfig.width(fraction: 0.03)),
      margin: EdgeInsets.only(
        right: marginRight ?? SizeConfig.width(fraction: 0.04),
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getIconData(category.name),
            size: SizeConfig.width(fraction: 0.07),
            color: color,
          ),
          SizedBox(height: SizeConfig.height(fraction: 0.01)),
          Text(
            GetLocalizeTitle.getLocalizedTitle(
              context,
              _serviceKeyMap[category.name] ?? ServiceKey.electrician,
            ),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              fontSize: SizeConfig.width(fraction: 0.039),
            ),
          ),
        ],
      ),
    );
  }
}

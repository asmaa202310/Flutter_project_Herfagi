// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:herfagy_v2/utils/size_config.dart';
// import '../../../user/home_for_user/widgets/category_item.dart';

// class CrafterServicesBuilder extends StatelessWidget {
//   const CrafterServicesBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);

//     return Consumer<CrafterServicesProvider>(
//       builder: (context, provider, _) {
//         return Padding(
//           padding: EdgeInsets.all(SizeConfig.width(fraction: 0.04)),
//           child: Center(
//             child: Wrap(
//               spacing: SizeConfig.width(fraction: 0.03),
//               runSpacing: SizeConfig.width(fraction: 0.03),
//               children: List.generate(provider.services.length, (index) {
//                 final service = provider.services[index];
//                 return GestureDetector(
//                   onTap: () {},
//                   child: CategoryItem(category: service, marginRight: 0),
//                 );
//               }),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

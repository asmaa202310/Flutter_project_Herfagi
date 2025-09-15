// import 'package:flutter/material.dart';
// import '/utils/localization_extension.dart';
// import '/utils/get_localize_title.dart';
// import '../../../../models/old/request_model.dart';
// import 'buttom_sheet_action_buttons.dart';

// class RequestDetailsBottomSheet extends StatelessWidget {
//   const RequestDetailsBottomSheet({super.key, required this.request});

//   final RequestModel request;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             context.localization.serviceDetails,
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//           const SizedBox(height: 12),
//           Text(
//             "${context.localization.service}: ${GetLocalizeTitle.getLocalizedTitle(context, request.serviceKey)}",
//           ),
//           Text("${context.localization.customer}: ${request.customerName}"),
//           Text("${context.localization.date}: ${request.date}"),
//           const SizedBox(height: 10),
//           Text("${context.localization.description}: ${request.details}"),
//           const SizedBox(height: 20),
//           BottomSheetActionButtons(request: request),
//         ],
//       ),
//     );
//   }
// }

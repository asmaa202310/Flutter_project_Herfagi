// import 'package:flutter/material.dart';
// import 'package:herfagy_v2/utils/get_order_status_extension.dart';
// import 'package:herfagy_v2/utils/size_config.dart';
// import '/utils/get_localize_title.dart';
// import '/utils/localization_extension.dart';
// import 'package:provider/provider.dart';
// import '../../../../models/order.dart';
// import '../../../../models/service.dart';
// import '../../../../viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
// import 'custom_icon_button.dart';
// import 'request_details_bottom_sheet.dart';

// class RequestCard extends StatelessWidget {
//   const RequestCard({super.key, required this.order});

//   final Order order;

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     final serviceKey = GetLocalizeTitle.fromString(order.date);
//     return Card(
//       elevation: 3.0,
//       color: Colors.white,
//       shadowColor: Colors.blue.withAlpha(128),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       clipBehavior: Clip.antiAlias,
//       child: ListTile(
//         leading: const Icon(Icons.assignment_outlined, color: Colors.blue),
//         title: FutureBuilder<Service>(
//           future: order.getService(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Text("...");
//             }
//             return Text(
//               GetLocalizeTitle.getLocalizedTitle(context, snapshot.data!.title),
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             );
//           },
//         ),
//         subtitle: FutureBuilder<String>(
//           future: order.person("user"),
//           builder: (context, snapshot) {
//             final personName = snapshot.data ?? "...";
//             return Text(
//               "${context.localization.customer}: $personName\n${order.date}",
//             );
//           },
//         ),
//         trailing: Row(
//           spacing: SizeConfig.width(fraction: 0.03),
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CustomIconButton(
//               onTap: () => _showRequestDetails(context),
//               icon: Icons.info_outline,
//               color: Colors.orange,
//             ),
//             CustomIconButton(
//               onTap: () {
//                 context.read<OrderOperationViewModel>().updateOrder(
//                       Order(
//                         serviceId: order.serviceId,
//                         customerId: order.customerId,
//                         crafterId: order.crafterId,
//                         date: order.date,
//                         details: order.details,
//                         status: OrderStatus.inProgress,
//                       ),
//                     );
//               },
//               icon: Icons.check,
//               color: Colors.green,
//             ),
//             CustomIconButton(
//               onTap: () {
//                 context.read<OrderOperationViewModel>().updateOrder(
//                       Order(
//                         serviceId: order.serviceId,
//                         customerId: order.customerId,
//                         crafterId: order.crafterId,
//                         date: order.date,
//                         details: order.details,
//                         status: OrderStatus.rejected,
//                       ),
//                     );
//               },
//               icon: Icons.close,
//               color: Colors.red,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showRequestDetails(BuildContext context) {
//     final viewModel = context.read<OrderOperationViewModel>();
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return ChangeNotifierProvider.value(
//           value: viewModel,
//           child: RequestDetailsBottomSheet(order: order, request: null,),
//         );
//       },
//     );
//   }
// }

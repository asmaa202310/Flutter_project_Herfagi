import 'package:flutter/material.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import '../../../user/orders_for_user/widgets/order_details_bottom_sheet.dart';
import '/utils/localization_extension.dart';
import 'package:provider/provider.dart';
import '../../../user/orders_for_user/widgets/custom_general_app_bar.dart';
import '../../../user/orders_for_user/widgets/orders_sliver_list_builder.dart';

class CrafterOrdersViewBody extends StatelessWidget {
  const CrafterOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderOperationViewModel>(
      builder: (context, viewModel, child) {
        return CustomScrollView(
          slivers: [
            CustomGeneralSliverAppBar(text: context.localization.orders),
            OrdersSliverListBuilder(
              orders: viewModel.orders,
              viewerType: OrderViewerType.crafter,
            ),
          ],
        );
      },
    );
  }
}

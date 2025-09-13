import 'package:flutter/material.dart';
import '/utils/localization_extension.dart';
import 'package:provider/provider.dart';
import '../../../../viewmodels/home_crafter_view_model.dart';
import 'request_card.dart';

class NewRequestsList extends StatelessWidget {
  const NewRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RequestsProvider>(
      builder: (context, viewModel, child) {
        if (viewModel.requests.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(context.localization.noNewRequests),
              ),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final request = viewModel.requests[index];
            return RequestCard(key: ValueKey(request), request: request);
          }, childCount: viewModel.requests.length),
        );
      },
    );
  }
}

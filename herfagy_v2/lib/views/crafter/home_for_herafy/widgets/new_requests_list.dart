import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../viewmodels/home_crafter_view_model.dart';
import 'request_card.dart';

class NewRequestsList extends StatelessWidget {
  const NewRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RequestsProvider>(
      builder: (context, requestsProvider, child) {
        if (requestsProvider.requests.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text("لا توجد طلبات جديدة."),
              ),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final request = requestsProvider.requests[index];
            return RequestCard(request: request, index: index);
          }, childCount: requestsProvider.requests.length),
        );
      },
    );
  }
}

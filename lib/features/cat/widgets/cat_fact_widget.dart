import 'package:cat_fact_client/cat_fact_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CatFactWidget extends StatelessWidget {
  const CatFactWidget({
    required this.fact,
    super.key,
  });
  final CatFact fact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fact.text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat.yMMMMd(Localizations.localeOf(context).toString())
                .format(fact.createdAt),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

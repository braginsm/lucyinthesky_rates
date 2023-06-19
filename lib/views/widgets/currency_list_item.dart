import 'package:flutter/material.dart';

class CurrencyListItem extends StatelessWidget {
  const CurrencyListItem({
    required this.title,
    required this.base,
    required this.today,
    required this.yesterday,
    super.key,
  });

  final String title;
  final String base;
  final double today;
  final double yesterday;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('1 $base'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(today.toStringAsFixed(4)),
          const SizedBox(width: 8),
          Text(yesterday.toStringAsFixed(4)),
        ],
      ),
    );
  }
}

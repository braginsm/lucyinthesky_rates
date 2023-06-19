import 'package:flutter/material.dart';
import 'package:lucyinthesky_rates/res/strings.dart';

class ErrorContent extends StatelessWidget {
  const ErrorContent({required this.description, this.onReload, super.key});

  final String description;
  final VoidCallback? onReload;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Strings.error, style: theme.textTheme.headlineLarge),
          const SizedBox(height: 16),
          Text(
            description,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          if (onReload != null) ...[
            const SizedBox(height: 24),
            TextButton(onPressed: onReload, child: Text(Strings.reload)),
          ]
        ],
      ),
    );
  }
}

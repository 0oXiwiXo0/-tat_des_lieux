import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Widget réutilisable pour un champ de texte avec label sur la gauche
class LabeledTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;
  final double labelWidth;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.labelWidth = 80.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Text(
            label,
            style: const TextStyle(fontSize: AppConstants.fontSizeRegular),
          ),
        ),
        const SizedBox(width: AppConstants.spacingSmall),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 1.0),
              isDense: true,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

/// Widget pour un champ de texte avec label long (prend toute la largeur)
class LongLabeledTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;

  const LongLabeledTextField({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Text(
            label,
            style: const TextStyle(fontSize: AppConstants.fontSizeRegular),
          ),
        ),
        const SizedBox(width: AppConstants.spacingSmall),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 1.0),
              isDense: true,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

/// Widget pour un champ de texte seul (sans label)
class PlainTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const PlainTextField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(width: AppConstants.spacingSmall),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 1.0),
              isDense: true,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

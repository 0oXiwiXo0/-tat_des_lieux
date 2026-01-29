import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../pages/labeled_text_field.dart';

/// Section pour les informations du bailleur
class BailleurSection extends StatelessWidget {
  final ValueChanged<String> onNomChanged;
  final ValueChanged<String> onDomicileChanged;

  const BailleurSection({
    super.key,
    required this.onNomChanged,
    required this.onDomicileChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Le bailleur ou son représentant :',
          style: TextStyle(
            fontSize: AppConstants.fontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.spacingXSmall),
        LabeledTextField(
          label: 'Nom :',
          onChanged: onNomChanged,
        ),
        LabeledTextField(
          label: 'Domicile :',
          onChanged: onDomicileChanged,
        ),
        const SizedBox(height: AppConstants.spacingLarge),
      ],
    );
  }
}

/// Section pour les informations du locataire
class LocataireSection extends StatelessWidget {
  final ValueChanged<String> onNomChanged;
  final ValueChanged<String> onNouvelleAdresseChanged;
  final ValueChanged<String> onNouvelleAdresseLigne2Changed;

  const LocataireSection({
    super.key,
    required this.onNomChanged,
    required this.onNouvelleAdresseChanged,
    required this.onNouvelleAdresseLigne2Changed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'et',
            style: TextStyle(
              fontSize: AppConstants.fontSizeLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: AppConstants.spacingXSmall),
        const Text(
          'Le locataire :',
          style: TextStyle(
            fontSize: AppConstants.fontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.spacingXSmall),
        LabeledTextField(
          label: 'Nom :',
          onChanged: onNomChanged,
        ),
        LongLabeledTextField(
          label: 'Si état de lieu de sortie, nouvelle adresse :',
          onChanged: onNouvelleAdresseChanged,
        ),
        PlainTextField(
          onChanged: onNouvelleAdresseLigne2Changed,
        ),
        const SizedBox(height: AppConstants.spacingXXLarge),
      ],
    );
  }
}

/// Section pour les compteurs
class CompteursSection extends StatelessWidget {
  final ValueChanged<String> onElectriciteChanged;
  final ValueChanged<String> onGazChanged;
  final ValueChanged<String> onEauChanged;
  final ValueChanged<String> onInternetChanged;

  const CompteursSection({
    super.key,
    required this.onElectriciteChanged,
    required this.onGazChanged,
    required this.onEauChanged,
    required this.onInternetChanged,
  });

  Widget _buildCompteurField({
    required String label,
    required String hint,
    required IconData icon,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
            ),
            hintText: hint,
            labelText: label,
            prefixIcon: Icon(icon),
          ),
          onChanged: onChanged,
        ),
        const SizedBox(height: AppConstants.spacingLarge),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Identification compteurs et relèves',
          style: TextStyle(
            fontSize: AppConstants.fontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.spacingLarge),
        _buildCompteurField(
          label: 'Electricité',
          hint: 'Relève',
          icon: Icons.flash_on,
          onChanged: onElectriciteChanged,
        ),
        _buildCompteurField(
          label: 'Gaz',
          hint: 'Relève',
          icon: Icons.fireplace,
          onChanged: onGazChanged,
        ),
        _buildCompteurField(
          label: 'Eau',
          hint: 'Relève',
          icon: Icons.water,
          onChanged: onEauChanged,
        ),
        _buildCompteurField(
          label: 'Internet',
          hint: 'N° fibre',
          icon: Icons.wifi,
          onChanged: onInternetChanged,
        ),
      ],
    );
  }
}

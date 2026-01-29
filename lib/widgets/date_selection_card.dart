import 'package:flutter/material.dart';

/// Widget pour la carte de sélection de date (Entrée ou Sortie)
class DateSelectionCard extends StatelessWidget {
  final bool isEntreeChecked;
  final bool isSortieChecked;
  final DateTime? dateEntree;
  final DateTime? dateSortie;
  final ValueChanged<bool> onEntreeChanged;
  final ValueChanged<bool> onSortieChanged;
  final ValueChanged<DateTime> onDateEntreeSelected;
  final ValueChanged<DateTime> onDateSortieSelected;

  const DateSelectionCard({
    super.key,
    required this.isEntreeChecked,
    required this.isSortieChecked,
    required this.dateEntree,
    required this.dateSortie,
    required this.onEntreeChanged,
    required this.onSortieChanged,
    required this.onDateEntreeSelected,
    required this.onDateSortieSelected,
  });

  String _formatDate(DateTime? date) {
    if (date == null) {
      final now = DateTime.now();
      return '${now.day.toString().padLeft(2, '0')}/'
          '${now.month.toString().padLeft(2, '0')}/'
          '${now.year}';
    }
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _selectDate(
    BuildContext context,
    DateTime? currentDate,
    ValueChanged<DateTime> onDateSelected,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Row(
        children: [
          Expanded(
            child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Entrée'),
              subtitle: InkWell(
                onTap: () => _selectDate(context, dateEntree, onDateEntreeSelected),
                child: Text(
                  _formatDate(dateEntree),
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
              value: isEntreeChecked,
              onChanged: (bool? value) {
                if (value != null) {
                  onEntreeChanged(value);
                }
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Sortie'),
              subtitle: InkWell(
                onTap: () => _selectDate(context, dateSortie, onDateSortieSelected),
                child: Text(
                  _formatDate(dateSortie),
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
              value: isSortieChecked,
              onChanged: (bool? value) {
                if (value != null) {
                  onSortieChanged(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

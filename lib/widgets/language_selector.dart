import 'package:codenames/utils/lang.dart';
import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    super.key,
    required this.language,
    required this.onChanged,
  });

  final String language;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Оберіть мову гри:',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onChanged('ukranian'),
              child: _buildCard(context, '🇺🇦', 'ukranian'),
            ),
            GestureDetector(
              onTap: () => onChanged('russian'),
              child: _buildCard(context, '🏳️', 'russian'),
            ),
            GestureDetector(
              onTap: () => onChanged('english'),
              child: _buildCard(context, '🇬🇧', 'english'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, String emoji, String languageValue) {
    final isSelected = language == languageValue;
    var textSelectedColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
    return Card(
      color: isSelected ? Theme.of(context).colorScheme.primary : null,
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              emoji,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              dict[languageValue]!,
              style: TextStyle(color: isSelected ? textSelectedColor : null),
            ),
          ],
        ),
      ),
    );
  }
}

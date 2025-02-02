import 'package:codenames/generated/l10n.dart';
import 'package:codenames/shared/constants.dart';
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
          S.of(context).chooseGameLanguageDD,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onChanged('uk'),
              child: _buildCard(context, '🇺🇦', 'uk'),
            ),
            GestureDetector(
              onTap: () => onChanged('ru'),
              child: _buildCard(context, '🏳️', 'ru'),
            ),
            GestureDetector(
              onTap: () => onChanged('en'),
              child: _buildCard(context, '🇬🇧', 'en'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, String emoji, String languageValue) {
    final isSelected = language == languageValue;
    var textSelectedColor = Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white;
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
              Constants.dictionaries[languageValue]!,
              style: TextStyle(color: isSelected ? textSelectedColor : null),
            ),
          ],
        ),
      ),
    );
  }
}

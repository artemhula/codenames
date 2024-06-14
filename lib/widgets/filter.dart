import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.filter_alt_outlined, size: 30),
        Text('Фільтри:', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 15),
        Badge(
          label: const Text('0'),
          offset: const Offset(10, -10),
          child: Text(
            'Ім\'я',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        const SizedBox(width: 20),
        Badge(
          label: const Text('2'),
          offset: const Offset(10, -10),
          child: Text(
            'Мова',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

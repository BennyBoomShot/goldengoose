import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/locale_provider.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeNotifier = ref.read(localeProvider.notifier);
    return DropdownButton<Locale>(
      value: context.locale,
      items: context.supportedLocales.map((locale) {
        return DropdownMenuItem(
          value: locale,
          child: Text(locale.languageCode.toUpperCase()),
        );
      }).toList(),
      onChanged: (locale) async {
        if (locale != null) {
          context.setLocale(locale);
          await localeNotifier.setLocale(locale);
        }
      },
    );
  }
} 
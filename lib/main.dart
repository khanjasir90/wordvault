import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:wordvault/network/search_api.dart';
import 'package:wordvault/theme.dart';
import 'package:wordvault/theme_toggle_widget.dart';
import 'package:wordvault/widgets/search_field.dart';

void main() {
  runApp(const WordVaultApp());
}

class WordVaultApp extends StatefulWidget {
  const WordVaultApp({super.key});

  @override
  State<WordVaultApp> createState() => _WordVaultAppState();
}

class _WordVaultAppState extends State<WordVaultApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeToggleWidget(
      isDarkMode: isDarkMode,
      onThemeChanged: toggleTheme,
      child: MaterialApp(
        title: 'Word Vault',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  Widget get darkToggleWidget {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: PaddingUtils.p12),
      child: Image.asset('assets/images/light.png'),
    );
  }

  Widget get lightToggleWidget {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.only(right: PaddingUtils.p12),
      child: Image.asset('assets/images/dark.png'),
    );
  }

  bool isDarkModeSelected(BuildContext context) {
    return ThemeToggleWidget.of(context)!.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                ThemeToggleWidget.of(context)!.onThemeChanged();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: isDarkModeSelected(context)
                    ? darkToggleWidget
                    : lightToggleWidget,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(PaddingUtils.p16),
              child: Text(
                'Word Vault',
                style: context.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SearchFieldListSuggestion(
                onSearch: SearchApiImpl().getSearchResults,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

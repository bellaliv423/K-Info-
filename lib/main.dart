import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:k_info/l10n/app_localizations.dart';
import 'package:k_info/core/routing/app_router.dart';
import 'package:k_info/core/theme/app_theme.dart';
import 'package:k_info/data/providers/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  // await Supabase.initialize(
  //   url: ApiConstants.supabaseUrl,
  //   anonKey: ApiConstants.supabaseAnonKey,
  // );

  runApp(
    const ProviderScope(
      child: KInfoApp(),
    ),
  );
}

class KInfoApp extends ConsumerWidget {
  const KInfoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'K-Info',
      debugShowCheckedModeBanner: false,

      // Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      // Localization
      locale: locale,
      supportedLocales: const [
        Locale('en', ''),      // English
        Locale('zh', ''),      // Simplified Chinese
        Locale('zh', 'TW'),    // Traditional Chinese
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Routing
      routerConfig: AppRouter.router,
    );
  }
}

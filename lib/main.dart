import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'base/tools/define/app_colors.dart';
import 'base/tools/define/app_fonts.dart';
import 'base/tools/languages.dart';
import 'base/tools/singleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageType.values.map((type) => type.locale).toList(),
        path: 'assets/translations',
        fallbackLocale: LanguageType.vietnamese.locale,
        saveLocale: true,
        useOnlyLangCode: true,
        child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    currentLang = LanguageType.instance(context.locale.languageCode);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'app_name_here',
      theme: ThemeData(
          fontFamily: AppFonts.roboto,
          primaryColor: AppColors().primary,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: AppColors().primary)),
      home: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: const Text("Hello base app"),
      ),
    );
  }
}
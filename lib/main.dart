import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:career_coach/presentation/core/mode/language/cubit/language_cubit.dart';
import 'package:career_coach/presentation/core/mode/language/inherited_language_widget.dart';
import 'package:career_coach/presentation/core/mode/theme/cubit/theme_cubit.dart';
import 'package:career_coach/presentation/core/mode/theme/inherited_theme_widget.dart';
import 'package:career_coach/presentation/core/route/app_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DiConfig.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()..init()),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()..init()),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) {
          return InheritedLanguageWidget(
            languageModeEnum: languageState.languageModeEnum,
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return InheritedThemeWidget(
                  themeModeEnum: themeState.themeModeEnum,
                  child: MaterialApp.router(
                    theme: ThemeData(useMaterial3: true),
                    routerConfig: _appRouter.config(),
                    debugShowCheckedModeBanner: false,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

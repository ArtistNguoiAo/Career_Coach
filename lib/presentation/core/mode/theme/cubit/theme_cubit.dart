import 'package:bloc/bloc.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:career_coach/presentation/core/mode/theme/inherited_theme_widget.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeModeEnum: ThemeModeEnum.light));

  Future<void> init() async {
    final themeModeString = await LocalCache.getString(StringCache.theme);
    if (themeModeString.isEmpty) {
      await LocalCache.setString(StringCache.theme, ThemeModeEnum.light.name);
      emit(const ThemeState(themeModeEnum: ThemeModeEnum.light));
    } else {
      emit(ThemeState(themeModeEnum: ThemeModeEnum.values.byName(themeModeString)));
    }
  }

  Future<void> changeTheme(ThemeModeEnum themeModeEnum) async {
    await LocalCache.setString(StringCache.theme, themeModeEnum.name);
    emit(ThemeState(themeModeEnum: themeModeEnum));
  }
}

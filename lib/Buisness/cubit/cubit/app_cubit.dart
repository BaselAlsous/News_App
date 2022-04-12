import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test/Data/Helper/helper_function.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  // todo:  Function To CONVERTE Theme
  bool isDark = false;

  void convertTheme({ bool? shaerdTheme}) {
    if(shaerdTheme !=null){
      isDark = shaerdTheme ;
      emit(ConverteThemeStatus());

    }else{
    isDark = !isDark;
    HelperFunaction.put(key: 'isDark', value: isDark).then((value) {
      emit(ConverteThemeStatus());
    });
    }

  }

}

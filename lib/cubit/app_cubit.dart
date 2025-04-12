

import 'package:bloc/bloc.dart';
import 'package:tourists_guide/cubit/cubit_app_states.dart';

class AppCubit  extends Cubit<CubitAppStates>{
  AppCubit():super (InitialState()){
    emit(WelcomeState());
  }
  
}
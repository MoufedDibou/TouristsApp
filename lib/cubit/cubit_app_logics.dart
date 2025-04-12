import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourists_guide/cubit/app_cubit.dart';
import 'package:tourists_guide/cubit/cubit_app_states.dart';
import 'package:tourists_guide/pages/welcome_page.dart';

class CubitAppLogics extends StatefulWidget {
  const CubitAppLogics({super.key});

  @override
  State<CubitAppLogics> createState() => _CubitAppLogicsState();
}

class _CubitAppLogicsState extends State<CubitAppLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit,CubitAppStates>(builder: (context,state){
if(state is WelcomeState){
  return WelcomePage(title: "Welcome Page");
}
else
return Container();
      }
      ),
    );
  }
}
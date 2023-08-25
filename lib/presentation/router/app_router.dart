import 'package:bloc_example/logic/cubit/counter_cubit.dart';
import 'package:bloc_example/presentation/screens/home_screen.dart';
import 'package:bloc_example/presentation/screens/second_screen.dart';
import 'package:bloc_example/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const HomeScreen(
                      title: 'Home screen', color: Colors.blue),
                ));
      case '/second':
        return MaterialPageRoute(
            builder: (newContext) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondScreen(
                      title: 'Second screen', color: Colors.yellow),
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (newContext) => BlocProvider.value(
                  value: _counterCubit,
                  child: const ThirdScreen(
                      title: 'Third screen', color: Colors.purple),
                ));
      default:
        return MaterialPageRoute(
            builder: (newContext) =>
                const HomeScreen(title: 'Home screen', color: Colors.blue));
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}

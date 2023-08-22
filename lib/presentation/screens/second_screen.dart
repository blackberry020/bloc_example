import 'package:bloc_example/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class SecondScreen extends StatefulWidget {
  const SecondScreen(
      {super.key,
      required this.title,
      required this.color,
      required this.counterCubit});

  final String title;
  final Color color;
  final CounterCubit counterCubit;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.counterCubit,
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocConsumer<CounterCubit, CounterState>(
                    listener: (context, state) {
                      ScaffoldMessenger.of(context).clearSnackBars();

                      if (state.wasIncremented == true) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("incremented!"),
                          duration: Duration(milliseconds: 300),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("decremented!"),
                          duration: Duration(milliseconds: 300),
                        ));
                      }
                    },
                    builder: (context, state) {
                      return Text(
                        "${state.counterValue}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: "scr2",
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).decrement();
                          //context.bloc<CounterCubit>().decrement();
                        },
                        child: const Icon(Icons.exposure_minus_1),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        child: const Icon(Icons.plus_one),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

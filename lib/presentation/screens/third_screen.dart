import 'package:bloc_example/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BackButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/');
              },
              color: widget.color,
            ),
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
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: const Icon(Icons.exposure_minus_1),
                ),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  heroTag: "scrThird",
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: const Icon(Icons.plus_one),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

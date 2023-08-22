import 'package:bloc_example/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter_cubit', () {

    CounterCubit counterCubit = CounterCubit();

    setUp((){
      counterCubit = CounterCubit();
    });
    tearDown((){
      counterCubit.close();
    });

    test('the initial state', (){ expect(counterCubit.state, CounterState(counterValue: 0, wasIncremented: false)); return; });
    blocTest('the cubit should emit a CounterState(counterValue: 1, wasIncremented: true) when cubit.increment() is called', 
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)]
    );

    blocTest('the cubit should emit a CounterState(counterValue: -1, wasIncremented: false) when cubit.decrement() is called', 
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)]
    );

  });
}
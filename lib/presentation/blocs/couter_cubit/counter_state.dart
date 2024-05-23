part of 'counter_cubit.dart';

//String name = 'Fernando';
//String otroNombr = 'Fernando';
//name == otroNombr => true

// CounterState(0,0) == CounterState(0,0) => true

//Recuerda instalar Equatable
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0,
    this.transactionCount = 0,
  });

  copyWith({
    int? counter,
    int? transactionCount,
  }) =>
      CounterState(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount,
      );

  @override
  List<Object> get props => [counter, transactionCount];
}

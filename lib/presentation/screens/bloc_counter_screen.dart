import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocVounterView(),
    );
  }
}

class BlocVounterView extends StatelessWidget {
  const BlocVounterView({
    super.key,
  });

  void increaseCounterBy( BuildContext context, [ int value = 1] ) {
    context.read<CounterBloc>() 
    .add( CounterIncreased(value) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          ( CounterBloc counterBloc ) => Text('Counter values: ${counterBloc.state.transactionCount}'), 
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => context.read<CounterBloc>().resetBy()
          )
        ],
      ),
      body: Center(
        child: context.select(
          ( CounterBloc counterBloc ) => Text('Counter values: ${counterBloc.state.counter}'), 
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => increaseCounterBy(context, 3),
            child: const Text('+3'),
          ),
    
          const SizedBox(height: 10),
          
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => increaseCounterBy(context, 2),
            child: const Text('+2'),
          ),
    
          const SizedBox(height: 10),
          
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => increaseCounterBy(context),
            child: const Text('+1'),
          ),
          
        ],
      )
    );
  }
}

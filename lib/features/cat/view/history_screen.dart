import 'package:cat_trivia/features/cat/bloc/cat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactHistoryScreen extends StatelessWidget {
  const FactHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fact History'),
      ),
      body: BlocBuilder<CatBloc, CatState>(
        bloc: context.read<CatBloc>(),
        builder: (context, state) {
          if (state is CatFactHistoryLoaded) {
            return ListView.builder(
              itemCount: state.history.length,
              itemBuilder: (context, index) {
                final fact = state.history[index];
                return ListTile(
                  title: Text(fact.text),
                  subtitle: Text(fact.createdAt.toString()),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No facts saved.'),
            );
          }
        },
      ),
    );
  }
}

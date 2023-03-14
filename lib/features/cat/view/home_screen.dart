import 'package:cat_trivia/features/cat/bloc/cat_bloc.dart';
import 'package:cat_trivia/features/cat/widgets/cat_fact_widget.dart';
import 'package:cat_trivia/features/cat/widgets/cat_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Trivia'),
      ),
      body: BlocConsumer<CatBloc, CatState>(
        listener: (context, state) {
          if (state is CatError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is CatInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                if (state is CatImageLoaded) ...[
                  Expanded(
                    child: CatImageWidget(image: state.image),
                  ),
                ],
                if (state is CatFactLoaded) ...[
                  CatFactWidget(fact: state.fact),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CatBloc>().add(LoadNextFactEvent());
                    },
                    child: const Text('Another fact!'),
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/fact-history');
        },
        tooltip: 'Fact history',
        child: const Icon(Icons.history),
      ),
    );
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:cat_fact_client/cat_fact_client.dart';
import 'package:cat_fact_repository/cat_fact_repository.dart';
import 'package:cat_image_client/cat_image_client.dart';
import 'package:cat_trivia/features/cat/bloc/cat_bloc.dart';
import 'package:cat_trivia/features/cat/view/view.dart';
import 'package:cat_trivia/l10n/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage/local_storage.dart';

class App extends StatelessWidget {
  App({super.key});

  final _repository = CatFactRepositoryImpl(
    catFactClient: CatFactClient(Dio()),
    catImageClient: CatImageClient(Dio()),
    storage: LocalStorage(Hive.box<CatFact>('fact_box')),
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => _repository,
      child: BlocProvider(
        create: (context) => CatBloc(_repository)
          ..add(LoadCatFactEvent())
          ..add(LoadCatImageEvent()),
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomeScreen(),
          routes: {
            '/fact-history': (context) => const FactHistoryScreen(),
          },
        ),
      ),
    );
  }
}

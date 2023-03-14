import 'package:hive_flutter/hive_flutter.dart';

/// {@template local_storage}
/// A dart package which cache the cat facts to local storage.
/// {@endtemplate}
class LocalStorage {
  /// {@macro local_storage}
  const LocalStorage(this._box);

  // Defines box to store data.
  final Box<dynamic> _box;

  /// Saves data.
  Future<void> saveData(dynamic data) async {
    await _box.add(data);
  }

  /// Retrieves data.
  Future<List<dynamic>> getData() async {
    return _box.values.toList().reversed.toList();
  }
}

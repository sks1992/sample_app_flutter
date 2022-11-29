import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageBindings {
  // Create storage
  final storage = const FlutterSecureStorage();

  // Write value
  Future<void> writeValue({required String key, dynamic value}) {
    return storage.write(key: key, value: value);
  }

  // Delete value
  void deleteValue(String key) async {
    storage.delete(key: key);
  }

  // Read value
  Future<String> readValue(String key) async {
    String? value = await storage.read(key: key);
    return value ?? "";
  }

  // Delete all
  void deleteAll() async {
    storage.deleteAll();
  }

  // Read all values
  Future readAll() async {
    Map<String, String> value = await storage.readAll();
    return value;
  }
}

class LocalStorage {
  static LocalStorage sharedInstance = LocalStorage._internal();

  factory LocalStorage() {
    return sharedInstance;
  }

  LocalStorageBindings localStorageBindings = LocalStorageBindings();

  LocalStorage._internal();

  void writeValue({required String key, dynamic value}) {
    localStorageBindings.writeValue(key: key, value: value);
  }

  void deleteValue(String key) async {
    localStorageBindings.deleteValue(key);
  }

  Future<String> readValue(String key) async {
    return await localStorageBindings.readValue(key);
  }

  void deleteAll() async {
    localStorageBindings.deleteAll();
  }

  Future readAll() async {
    return await localStorageBindings.readAll();
  }
}

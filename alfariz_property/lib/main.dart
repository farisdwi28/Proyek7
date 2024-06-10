import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

void main() async {
  // Inisialisasi GetStorage
  await GetStorage.init();
  
  runApp(const App());
}

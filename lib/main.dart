import 'package:depenses/widgets/page_acceuil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageAcceuil(),
    ),
  );
}

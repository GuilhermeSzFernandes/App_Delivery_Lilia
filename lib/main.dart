import 'package:flutter/material.dart';
import 'screens/tela_lojas.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'App Lojas',
    home: TelaLojas(),
    );
  }
}

import 'package:awesome_protfolio/provider/current_state.dart';
import 'package:awesome_protfolio/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CurrentState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Awesome Portfolio',
        theme: ThemeData(
          useMaterial3: true, // optional modern theme
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

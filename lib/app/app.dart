import 'package:flutter/material.dart';
import 'package:grow_simplee_assignment/app/app_state.dart';
import 'package:grow_simplee_assignment/screens/home_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppState()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sleeepy_time/theme.dart';
import 'package:provider/provider.dart';
import 'controller/shared_state.dart';
import 'view/home_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SharedState()..loadSleepTime()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(ThemeData.light().textTheme);
    return MaterialApp(
      title: 'Sleepy Time',
      theme: materialTheme.light().copyWith(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimary,
            size: 34,
          ),
        ),
      ),
      darkTheme: materialTheme.light(),
      themeMode: ThemeMode.system,
      home: const HomeView(title: 'Sleeepy Time'),
    );
  }
}

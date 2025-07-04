import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'data/database.dart';
import 'data/repository.dart';
import 'screens/home_screen.dart';

class FarrierLogApp extends StatelessWidget {
  const FarrierLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Single database instance for the whole app
    return Provider<AppDatabase>(
      create: (_) => AppDatabase(),
      dispose: (_, db) => db.close(),
      child: MultiProvider(
        providers: [
          Provider(create: (context) => context.read<AppDatabase>().visitsDao),
          Provider(create: (context) => context.read<AppDatabase>().barnDao),
          Provider(create: (context) => context.read<AppDatabase>().ownerDao),
          ChangeNotifierProvider(create: (context) => HorseRepository(context.read<AppDatabase>())),
          ChangeNotifierProvider(create: (context) => BarnRepository(context.read<AppDatabase>())),
          ChangeNotifierProvider(create: (context) => OwnerRepository(context.read<AppDatabase>())),
          ChangeNotifierProvider(create: (context) => VisitRepository(context.read<AppDatabase>())),
          ChangeNotifierProvider(create: (context) => OwnerBarnRepository(context.read<AppDatabase>())),
        ],
        child: MaterialApp(
          title: 'Farrier Log App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            useMaterial3: true,
            fontFamily: 'Roboto',
          ),
          locale: const Locale('en', 'US'),
          supportedLocales: const [
            Locale('en', 'US'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultMaterialLocalizations.delegate, // Add this for fallback
],
          home: const HomeScreen(),
        ),
      ),
    );
  }
}

// This code defines the main application widget for a Flutter app.
// It sets up a provider for the database and multiple repositories, and initializes the app with a home screen.
// The app uses Material Design with a teal color scheme and Material 3 components.
// The HomeScreen widget is the main screen of the app, which includes a bottom navigation bar and displays different content based on the selected tab.
// The app is structured to allow for easy access to the database and repositories throughout the app using the Provider package.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'views/home_screen.dart';
import 'views/page1.dart';
import 'views/page2.dart';
import 'views/page3.dart';

/// The main entry point of the Flutter application.
/// This function initializes the app and runs it.
void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
///
/// This widget sets up the [GoRouter] for navigation management
/// and provides the MaterialApp configuration.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Application title displayed in the app switcher
      title: 'Flutter Drawer Navigation',

      // Theme configuration for the entire application
      theme: ThemeData(
        // Sets the primary color scheme based on a seed color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Applies Material Design 3 styling
        useMaterial3: true,
      ),

      // Router configuration delegate from GoRouter
      routerConfig: _router,

      // Disables the debug banner in debug mode
      debugShowCheckedModeBanner: false,
    );
  }
}

/// GoRouter configuration for managing application routes.
///
/// This router defines all the available routes in the application
/// and handles navigation between different screens.
final GoRouter _router = GoRouter(
  // The initial route that appears when the app starts
  initialLocation: '/',

  // List of all available routes in the application
  routes: [
    /// Home route - The main landing page with navigation drawer
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),

    /// Page 1 route - First destination accessible from the drawer
    GoRoute(
      path: '/page1',
      name: 'page1',
      builder: (context, state) => const Page1(),
    ),

    /// Page 2 route - Second destination accessible from the drawer
    GoRoute(
      path: '/page2',
      name: 'page2',
      builder: (context, state) => const Page2(),
    ),

    /// Page 3 route - Third destination accessible from the drawer
    GoRoute(
      path: '/page3',
      name: 'page3',
      builder: (context, state) => const Page3(),
    ),
  ],

  /// Error page builder for handling invalid routes
  ///
  /// This is called when a user tries to navigate to a route that doesn't exist
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Error'), backgroundColor: Colors.red),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Page not found: ${state.matchedLocation}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Go to Home'),
          ),
        ],
      ),
    ),
  ),
);

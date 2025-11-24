import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Page1 is the first destination page accessible from the navigation drawer.
///
/// This page demonstrates a simple screen with content and a button to
/// navigate back to the home page using GoRouter.
class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a title for this page
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Colors.blue,
        // The back button is automatically added by Flutter
        // when there's a route to go back to
      ),

      // Main content of Page 1
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Page icon
              const Icon(
                Icons.looks_one_rounded,
                size: 100,
                color: Colors.blue,
              ),

              const SizedBox(height: 24),

              // Page title
              Text(
                'This is Page 1',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 16),

              // Page description
              const Text(
                'This is the first page in the navigation demonstration. '
                'You can navigate here from the drawer menu.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Informational card with page details
              Card(
                elevation: 4,
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.navigation_rounded,
                        size: 48,
                        color: Colors.blue.shade700,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Navigation Features',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '• Use the back button to return\n'
                        '• Use the drawer menu for other pages\n'
                        '• Use the button below for direct navigation',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Button to navigate back to home
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to home page using GoRouter's go method
                  // This replaces the current route in the navigation stack
                  context.go('/');
                },
                icon: const Icon(Icons.home),
                label: const Text('Return to Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 16),

              // Alternative: Button using pop method
              OutlinedButton.icon(
                onPressed: () {
                  // Alternative navigation method using pop
                  // This goes back to the previous page in the stack
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/');
                  }
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Go Back'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

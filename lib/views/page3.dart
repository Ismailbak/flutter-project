import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Page3 is the third destination page accessible from the navigation drawer.
///
/// This page completes the navigation demonstration with a unique purple theme
/// and consistent navigation functionality.
class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a title for this page
      appBar: AppBar(
        title: const Text('Page 3'),
        backgroundColor: Colors.purple,
        // The back button is automatically added by Flutter
      ),

      // Main content of Page 3
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Page icon
              const Icon(
                Icons.looks_3_rounded,
                size: 100,
                color: Colors.purple,
              ),

              const SizedBox(height: 24),

              // Page title
              Text(
                'This is Page 3',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),

              const SizedBox(height: 16),

              // Page description
              const Text(
                'You have reached the third page! This demonstrates how easy '
                'it is to add multiple pages to your Flutter navigation.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Informational card with GoRouter details
              Card(
                elevation: 4,
                color: Colors.purple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.route_rounded,
                        size: 48,
                        color: Colors.purple.shade700,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'GoRouter Benefits',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '• Declarative routing configuration\n'
                        '• Deep linking support\n'
                        '• URL-based navigation\n'
                        '• Type-safe route parameters\n'
                        '• Easy error handling',
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
                  // Navigate to home page using GoRouter
                  context.go('/');
                },
                icon: const Icon(Icons.home),
                label: const Text('Return to Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 16),

              // Alternative navigation button
              OutlinedButton.icon(
                onPressed: () {
                  // Go back using the navigation stack
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/');
                  }
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Go Back'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.purple,
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Page2 is the second destination page accessible from the navigation drawer.
///
/// This page demonstrates a screen with different styling and content,
/// along with navigation capabilities back to the home page.
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a title for this page
      appBar: AppBar(
        title: const Text('Page 2'),
        backgroundColor: Colors.green,
        // The back button is automatically added by Flutter
      ),

      // Main content of Page 2
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Page icon
              const Icon(
                Icons.looks_two_rounded,
                size: 100,
                color: Colors.green,
              ),

              const SizedBox(height: 24),

              // Page title
              Text(
                'This is Page 2',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 16),

              // Page description
              const Text(
                'Welcome to the second page! This page has a green theme '
                'and demonstrates consistent navigation patterns.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Informational card with features
              Card(
                elevation: 4,
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.featured_play_list_rounded,
                        size: 48,
                        color: Colors.green.shade700,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Page Features',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '• Unique green color theme\n'
                        '• Consistent navigation structure\n'
                        '• Material Design 3 components\n'
                        '• Responsive layout design',
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
                  backgroundColor: Colors.green,
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
                  foregroundColor: Colors.green,
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

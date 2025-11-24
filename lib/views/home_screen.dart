import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// HomeScreen is the main landing page of the application.
///
/// This screen displays a welcome message and includes a navigation drawer
/// that allows users to navigate to different pages in the app.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar at the top of the screen
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // The leading hamburger menu icon is automatically added by Flutter
        // when a Drawer is present
      ),

      // Drawer widget for navigation menu
      drawer: _buildDrawer(context),

      // Main content of the home screen
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome icon
              Icon(
                Icons.home_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 24),

              // Welcome title
              Text(
                'Welcome to Flutter Drawer Navigation!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Description text
              Text(
                'Use the drawer menu (tap the ☰ icon) to navigate to different pages.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Informational card
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 48,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'This project demonstrates:\n'
                        '• Drawer navigation in Flutter\n'
                        '• GoRouter for routing\n'
                        '• Multiple screens with navigation\n'
                        '• Material Design 3 styling',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the navigation drawer widget.
  ///
  /// The drawer provides a side menu with navigation options to different
  /// pages in the application. It includes a header with user information
  /// and a list of navigation items.
  ///
  /// [context] - The build context used for navigation
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove default padding to make the drawer header full-width
        padding: EdgeInsets.zero,
        children: [
          // Drawer header with app branding and user information
          DrawerHeader(
            decoration: BoxDecoration(
              // Use the primary color from the theme
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // App icon
                Icon(
                  Icons.menu_book_rounded,
                  size: 64,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 12),
                // App title
                Text(
                  'Navigation Menu',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Subtitle
                Text(
                  'Select a page',
                  style: TextStyle(
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Navigation item for Home
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: true, // Highlight since we're on the home page
            selectedTileColor: Theme.of(
              context,
            ).colorScheme.primary.withOpacity(0.1),
            onTap: () {
              // Close the drawer
              Navigator.pop(context);
              // Navigate to home (we're already here, but this demonstrates the pattern)
              context.go('/');
            },
          ),

          // Divider for visual separation
          const Divider(),

          // Navigation item for Page 1
          ListTile(
            leading: const Icon(Icons.looks_one),
            title: const Text('Page 1'),
            subtitle: const Text('First page'),
            onTap: () {
              // Close the drawer before navigating
              Navigator.pop(context);
              // Navigate to page 1 using GoRouter
              context.go('/page1');
            },
          ),

          // Navigation item for Page 2
          ListTile(
            leading: const Icon(Icons.looks_two),
            title: const Text('Page 2'),
            subtitle: const Text('Second page'),
            onTap: () {
              // Close the drawer before navigating
              Navigator.pop(context);
              // Navigate to page 2 using GoRouter
              context.go('/page2');
            },
          ),

          // Navigation item for Page 3
          ListTile(
            leading: const Icon(Icons.looks_3),
            title: const Text('Page 3'),
            subtitle: const Text('Third page'),
            onTap: () {
              // Close the drawer before navigating
              Navigator.pop(context);
              // Navigate to page 3 using GoRouter
              context.go('/page3');
            },
          ),

          // Another divider
          const Divider(),

          // Additional navigation item (About/Settings example)
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              // Close the drawer
              Navigator.pop(context);
              // Show an about dialog
              showAboutDialog(
                context: context,
                applicationName: 'Flutter Drawer Navigation',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.menu_book_rounded, size: 48),
                children: [
                  const Text(
                    'A demonstration of Drawer navigation with GoRouter in Flutter.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

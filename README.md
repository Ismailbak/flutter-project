# Flutter Drawer Navigation with GoRouter

## Project Overview

This Flutter project demonstrates the implementation of a **navigation drawer** (also known as a hamburger menu) integrated with **GoRouter** for declarative, URL-based routing. The application showcases best practices for building multi-page Flutter applications with Material Design 3 components.

### Purpose

The primary goal of this project is to provide a clear, educational example of:
- Implementing a Drawer widget for side-menu navigation
- Using GoRouter for modern, declarative routing
- Structuring a Flutter project with multiple screens
- Creating consistent navigation patterns across pages
- Following Flutter best practices with comprehensive documentation

## Project Structure

```
flutter/
├── lib/
│   ├── main.dart                 # Application entry point with GoRouter configuration
│   └── views/
│       ├── home_screen.dart      # Home page with navigation drawer
│       ├── page1.dart            # First destination page (blue theme)
│       ├── page2.dart            # Second destination page (green theme)
│       └── page3.dart            # Third destination page (purple theme)
├── pubspec.yaml                  # Project dependencies and configuration
└── report.md                     # This documentation file
```

## Navigation Architecture

### GoRouter Configuration

The application uses **GoRouter** (version 14.0.0) for navigation management. GoRouter provides several advantages:

- **Declarative Routing**: Routes are defined in a centralized configuration
- **URL-based Navigation**: Each page has a unique URL path
- **Deep Linking Support**: Can navigate directly to any page using URLs
- **Type Safety**: Route parameters and navigation are type-safe
- **Error Handling**: Built-in support for handling invalid routes

#### Route Configuration

The application defines the following routes:

| Route Path | Route Name | Screen Widget | Description |
|------------|------------|---------------|-------------|
| `/` | `home` | `HomeScreen` | Main landing page with drawer |
| `/page1` | `page1` | `Page1` | First destination (blue theme) |
| `/page2` | `page2` | `Page2` | Second destination (green theme) |
| `/page3` | `page3` | `Page3` | Third destination (purple theme) |

### Drawer Widget Integration

The **Drawer** is implemented in `home_screen.dart` and provides a side navigation menu. When a user taps the hamburger menu icon (☰) in the AppBar, the drawer slides in from the left.

#### How Drawer Works with GoRouter

1. **User Interaction**: User taps a menu item in the drawer
2. **Drawer Closes**: `Navigator.pop(context)` closes the drawer
3. **Route Navigation**: `context.go('/page1')` navigates to the target page
4. **Page Renders**: GoRouter renders the corresponding widget

Example navigation flow from the drawer:

```dart
ListTile(
  leading: const Icon(Icons.looks_one),
  title: const Text('Page 1'),
  onTap: () {
    Navigator.pop(context);      // Close the drawer
    context.go('/page1');         // Navigate using GoRouter
  },
),
```

### Navigation Methods

The project demonstrates two navigation approaches:

#### 1. Direct Navigation (`context.go()`)

```dart
ElevatedButton(
  onPressed: () => context.go('/'),
  child: const Text('Return to Home'),
)
```

- Navigates to a specific route by path
- Replaces the current route in the navigation stack
- Best for direct navigation to known routes

#### 2. Stack-based Navigation (`context.pop()`)

```dart
OutlinedButton(
  onPressed: () {
    if (context.canPop()) {
      context.pop();              // Go back in navigation stack
    } else {
      context.go('/');            // Fallback to home
    }
  },
  child: const Text('Go Back'),
)
```

- Pops the current route from the navigation stack
- Returns to the previous page
- Best for back navigation behavior

## Screen Details

### Home Screen (`home_screen.dart`)

- **Features**: 
  - Navigation drawer with menu items
  - Welcome message and project information
  - Material Design 3 styling
  - About dialog accessible from drawer

- **Navigation**: 
  - Drawer provides access to all pages
  - Highlighted menu item shows current location

### Individual Pages (`page1.dart`, `page2.dart`, `page3.dart`)

Each page includes:

- **Unique Theme**: Different color scheme (blue, green, purple)
- **Consistent Layout**: AppBar, centered content, navigation buttons
- **Educational Content**: Information about navigation and features
- **Dual Navigation**: "Return to Home" and "Go Back" buttons
- **Automatic Back Button**: AppBar includes back button automatically

## Code Documentation

All code in this project includes:

- **Dart Doc Comments**: Triple-slash (`///`) comments for classes and functions
- **Inline Comments**: Explanatory comments for complex logic
- **Parameter Documentation**: Clear descriptions of function parameters
- **Implementation Notes**: Guidance on when and how to use each component

Example:

```dart
/// Builds the navigation drawer widget.
/// 
/// The drawer provides a side menu with navigation options to different
/// pages in the application.
/// 
/// [context] - The build context used for navigation
Widget _buildDrawer(BuildContext context) {
  // Implementation
}
```

## How to Run the Application

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (included with Flutter)
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)
- An emulator or physical device for testing

### Step-by-Step Instructions

#### 1. Install Dependencies

Navigate to the project directory and run:

```bash
flutter pub get
```

This command downloads all required packages, including `go_router`, and generates necessary files.

#### 2. Verify Flutter Installation

Check that Flutter is properly installed:

```bash
flutter doctor
```

Resolve any issues indicated by the doctor command.

#### 3. Run the Application

For debugging on an emulator or connected device:

```bash
flutter run
```

For a release build:

```bash
flutter run --release
```

For web (if web support is enabled):

```bash
flutter run -d chrome
```

#### 4. Interact with the Application

- **Open Drawer**: Tap the ☰ icon in the AppBar
- **Navigate**: Select any page from the drawer menu
- **Return Home**: Use the "Return to Home" button on any page
- **Go Back**: Use the back button in the AppBar or "Go Back" button
- **About Dialog**: Open the drawer and tap "About"

## Key Concepts Demonstrated

### 1. Material Design 3

The application uses Material Design 3 (`useMaterial3: true`) with:
- Modern color schemes based on seed colors
- Updated component styling
- Improved accessibility

### 2. State Management

This project uses `StatelessWidget` throughout, demonstrating:
- Stateless navigation patterns
- Context-based routing with GoRouter
- No need for complex state management for simple navigation

### 3. Widget Composition

Screens are built using Flutter's composable widget system:
- Scaffold for basic page structure
- AppBar for top navigation
- Drawer for side menu
- Column/Row for layout
- Card for grouped content
- Buttons for user actions

### 4. Responsive Design

The application uses:
- `Center` and `MainAxisAlignment` for content positioning
- `Padding` for consistent spacing
- `SizedBox` for precise spacing control
- Theme-based colors for consistency

## Extending the Project

### Adding New Pages

1. **Create a new screen file** in `lib/views/`:

```dart
// lib/views/page4.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    // Your page implementation
  }
}
```

2. **Add a route** in `main.dart`:

```dart
GoRoute(
  path: '/page4',
  name: 'page4',
  builder: (context, state) => const Page4(),
),
```

3. **Add a drawer menu item** in `home_screen.dart`:

```dart
ListTile(
  leading: const Icon(Icons.looks_4),
  title: const Text('Page 4'),
  onTap: () {
    Navigator.pop(context);
    context.go('/page4');
  },
),
```

### Adding Route Parameters

GoRouter supports path and query parameters:

```dart
GoRoute(
  path: '/user/:id',
  builder: (context, state) {
    final userId = state.pathParameters['id'];
    return UserPage(userId: userId);
  },
),
```

### Adding Nested Navigation

For more complex apps, use `ShellRoute` for nested navigation:

```dart
ShellRoute(
  builder: (context, state, child) {
    return ScaffoldWithNavBar(child: child);
  },
  routes: [
    // Child routes
  ],
),
```

## Learning Resources

- **Flutter Documentation**: https://flutter.dev/docs
- **GoRouter Package**: https://pub.dev/packages/go_router
- **Material Design 3**: https://m3.material.io/
- **Flutter Navigation**: https://docs.flutter.dev/ui/navigation

## Troubleshooting

### Common Issues

**Issue**: `go_router` package not found
- **Solution**: Run `flutter pub get`

**Issue**: Import errors in IDE
- **Solution**: Run `flutter pub get` and restart your IDE

**Issue**: Hot reload doesn't work after route changes
- **Solution**: Perform a hot restart (press `R` in the terminal)

**Issue**: Drawer doesn't appear
- **Solution**: Ensure the Scaffold has a `drawer` property set

## Conclusion

This project provides a solid foundation for understanding Flutter navigation patterns. The combination of Drawer and GoRouter creates a robust, maintainable navigation system suitable for both simple and complex applications.

The extensive code comments and documentation make it easy to understand how each component works and how they interact together, making this project an excellent learning resource for Flutter developers at any level.

---

**Project Version**: 1.0.0  
**Flutter SDK**: >=3.0.0 <4.0.0  
**Last Updated**: November 24, 2025

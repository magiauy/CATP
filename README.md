# Flutter Age Selection App

A Flutter application with age selection functionality and SOS emergency features.

## Features

- **Age Selection Screen**: Interactive age group selection with smooth animations
- **SOS Emergency Page**: Quick access to emergency services with professional cards
- **Custom Alert System**: Beautiful notification system with multiple types
- **Responsive Design**: Optimized for mobile devices
- **State Management**: Provider-based architecture

## Screenshots

### Age Selection Screen
- Interactive age group selection (12-18, 18-30)
- Smooth animations and transitions
- SOS button for emergency access

### SOS Emergency Page
- Emergency call button (113)
- Quick access to various services:
  - Child Protection
  - Public Safety
  - Anti-Narcotics
  - Public Relations
  - Counseling Services

## Technical Stack

- **Framework**: Flutter
- **State Management**: Provider
- **Architecture**: MVC Pattern
- **Navigation**: Named Routes
- **Animations**: Custom AnimationController

## Project Structure

```
lib/
├── constants/
│   ├── colors.dart
│   ├── images_constants.dart
│   ├── regex_constants.dart
│   └── string.dart
├── controllers/
│   ├── age_selection_controller.dart
│   └── sos_controller.dart
├── routes/
│   └── app_routes.dart
├── screens/
│   └── sos_screen.dart
├── views/
│   └── screens/
│       ├── age_selection_screen.dart
│       ├── login_screen.dart
│       ├── register_screen.dart
│       ├── forgot_password_screen.dart
│       └── alert_demo_screen.dart
└── widgets/
    └── sos_card.dart
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.17.0)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/flutter-age-selection-app.git
cd flutter-age-selection-app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Key Features Implementation

### Age Selection with Animations
- **Hold Effects**: Press and hold for selection
- **Scale Animations**: Interactive visual feedback
- **Opacity Changes**: Smooth transitions between states
- **Shadow Effects**: Dynamic shadow based on selection

### SOS Emergency System
- **Emergency Button**: One-tap access to emergency services
- **Service Cards**: Professional service cards with icons
- **Gradient Background**: Eye-catching emergency theme
- **Quick Navigation**: Seamless navigation between screens

### Custom Alert System
- **Multiple Types**: Success, Error, Warning, Confirm
- **Overlay Notifications**: Non-intrusive user feedback
- **Auto-dismiss**: Automatic timeout functionality
- **Custom Styling**: Consistent with app theme

## Code Quality

- **Clean Architecture**: Separation of concerns
- **Reusable Components**: Modular widget structure
- **Consistent Styling**: Centralized theme management
- **Error Handling**: Comprehensive error management
- **Type Safety**: Full Dart type safety

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-feature`
3. Commit your changes: `git commit -am 'Add new feature'`
4. Push to the branch: `git push origin feature/new-feature`
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

- **Developer**: [MaGiaUy]
- **Email**: [magiauy46@gmail.com]
- **GitHub**: [https://github.com/magiauy]

## Acknowledgments

- Flutter team for the amazing framework
- Provider package for state management
- Community contributors for inspiration

---

**Note**: This is a demo application showcasing Flutter capabilities. For production use, please ensure proper testing and security measures are implemented.

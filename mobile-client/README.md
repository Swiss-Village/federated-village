# mobile-client

Mobile application source built with Flutter (Dart). This package contains the app shell, authentication flows, and content consumption features.

Suggested stack

- Flutter (Dart) — single codebase for Android and iOS.
- State management: Riverpod / Provider / Bloc (choose per team preference)
- Networking: http / dio / graphql client

Example dev commands (Flutter)

```bash
# get dependencies
flutter pub get

# run on the default device
flutter run

# run on iOS simulator
flutter run -d ios

# run on Android emulator
flutter run -d android

# build release APK
flutter build apk

# build iOS (archive)
flutter build ios
```

Notes

- Document any native platform setup (Android SDK, Xcode, signing) in this README.
- Use `shared` for cross-platform models and utilities where possible.

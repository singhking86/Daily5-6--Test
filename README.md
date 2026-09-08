# DailyCollect Pro

A from-scratch Android app for tracking a physical collection (figurines, scale models,
statues, cards, etc.) — MVVM + Repository pattern, offline-first Room storage, Jetpack
Compose / Material 3 UI, and optional Retrofit-based sync.

> **Note on origin:** This project was built independently from a written feature
> specification. No code, layouts, strings, or assets were extracted or copied from any
> third-party app or APK.

## Tech stack

- Kotlin, Jetpack Compose, Material 3 (dynamic color)
- MVVM + Repository pattern, `domain/` use-case layer
- Room (offline-first local storage)
- Retrofit + OkHttp (optional background sync — app is fully usable with no backend)
- Hilt for dependency injection
- Coil for image loading
- Navigation Compose

## Project structure

```
app/src/main/java/com/dailycollect/pro/
  ui/          Compose screens, theme, components, viewmodels
  data/        Room entities/DAO/DB, Retrofit API + DTOs, repository impl
  domain/      Domain models, use cases, repository interface
  di/          Hilt modules (Database, Network, Repository)
```

## Key features implemented

- **Dashboard**: grid/list toggle, live search, category filter chips, shimmer loading
  skeletons, empty states (no items vs. no search results), FAB to add items.
- **Item Detail**: full spec sheet (material, manufacturer, scale, packaging condition,
  purchase price/date, notes).
- **Add/Edit**: validated form (required title, numeric price validation).
- **Network resilience**: `network_security_config.xml` allows cleartext only for
  local/LAN addresses and a local-sync placeholder domain (keeps HTTPS-only for real
  remote traffic, while still solving local-IP/captive-portal Wi-Fi issues). All network
  failure modes (timeout, DNS failure, no connection, captive portal, server error) are
  mapped to specific, user-facing messages with a Retry action — the local Room cache
  keeps the app usable regardless of network state.
- **Localization**: English (`values/strings.xml`) and Punjabi/Gurmukhi
  (`values-pa/strings.xml`), wired through `locales_config.xml` for Android 13+
  per-app language support.
- **Accessibility & polish**: dark mode via Material You dynamic color, 8dp-grid
  spacing, semantics labels on empty states, adaptive launcher icon.

## Building

1. Open the project root in Android Studio (Koala/Ladybug or newer recommended).
   Android Studio will regenerate the Gradle wrapper JAR automatically on first sync.
   - If building from the command line instead, run `gradle wrapper --gradle-version 8.7`
     once (requires a local Gradle install) to generate `gradle/wrapper/gradle-wrapper.jar`,
     then use `./gradlew assembleDebug`.
2. Sync Gradle, then Run on a device/emulator running API 24+.

## Notes / next steps you may want

- `NetworkModule.BASE_URL` is a placeholder — point it at a real backend if you want
  cloud sync; the app works fully offline without one.
- No unit/UI tests are included yet — the `domain/usecase` layer (especially
  `AddItemUseCase.validate`) is the highest-value place to start.
- Launcher icons are simple generated placeholders (vector + raster fallback);
  swap in real brand artwork before shipping.

# Fogonesia - Lightweight MVC Architecture

A simple, pragmatic MVC-style structure that keeps the codebase clear without over-engineering.

## Folder Structure

```
lib/
├── main.dart
├── app/                    # App setup & DI
│   └── app_bootstrap.dart
│
├── core/                   # App-wide concerns
│   ├── theme/              # Theming
│   ├── home_page.dart      # Main shell / navigation
│   └── settings/           # App config, theme controller
│
├── features/               # Feature-first MVC
│   ├── recipe/
│   │   ├── model/          # Recipe entity
│   │   ├── controller/     # RecipeController
│   │   ├── screens/        # View layer
│   │   └── widgets/        # Feature-specific widgets
│   ├── chat/
│   ├── dietary/
│   └── auth/
│
├── services/               # Data layer (DB, API)
│   ├── database_service.dart
│   ├── gemini_service.dart
│   └── auth_service.dart
│
└── shared/                 # Cross-cutting
    ├── routes.dart
    ├── chat_message.dart
    ├── build_recipe_prompt.dart
    └── widgets/            # Shared UI (drawer, chat bubble, input bar)
```

## Conventions

- **Model**: Data structures and business logic (e.g. `Recipe`, `DietaryOptions`)
- **Controller**: State + coordination (ChangeNotifier, talks to services)
- **View**: Screens and widgets under `screens/` and `widgets/`
- **Services**: Database, API, auth—used by controllers, not by views

## 📱 FogonesIA

**FogonesIA** is an Android recipe app with AI support that helps users explore, generate, and manage recipes based on their dietary preferences.  
This is a **learning project** focused on Flutter architecture, state management, and API integration.

> 🚧 **Status:** In development

---

## ✨ Features

### ✅ Implemented

- 💬 **AI Chat (Home Screen)**
    
    - Users can prompt an AI assistant
        
    - The AI responds with structured **JSON**
        
    - Responses are parsed and rendered as **Flutter Cards**
        
- 🥗 **Dietary Restrictions**
    
    - Configurable dietary constraints using switches
        
- 🌗 **Theme Support**
    
    - Light and Dark mode
        
    - Persisted using `shared_preferences`
        
- 🔐 **Environment-based API Key**
    
    - Gemini API key stored safely in `lib/key/api.dart` (gitignored; not committed)

- 🔐 **Authentication**

    - Email/password with Firebase Auth
    - Google Sign-In (Firebase Auth)
        

### 🚧 Planned (TODO)

- 💾 Migrate persistence from `sqflite` to Drift

- 🧹 UI polish and UX improvements
    

---

## 🖼️ Screenshots

|Chat screen with AI prompt and response|

<img width="1003" height="1069" alt="chat" src="https://github.com/user-attachments/assets/f6c566a6-0907-42d2-b8be-e8bd536171fb" />

Switches ON/OFF for dietary constraints|

<img width="578" height="918" alt="dietary" src="https://github.com/user-attachments/assets/5ebc7ef5-dd6f-44da-b606-77092ad4808f" />

---

## 🛠️ Tech Stack

### Core

- **Flutter:** stable (see `.docs/STACK.md`)

- **Dart SDK:** `^3.9.2` (see `pubspec.yaml`)
    
- **Target Platform:** Android
    

### Architecture

- Feature-first (learning-focused)

- **State Management:** Riverpod (`flutter_riverpod`)

- **Navigation:** `go_router`
    

### AI

- **Gemini API**
    

### Storage

- Local only
    
    - `shared_preferences`
        
    - Drift (`drift` + `sqlite3_flutter_libs`) + `path_provider` for DB path
        

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  shared_preferences: ^2.5.4
  drift: ^2.28.0
  sqlite3_flutter_libs: ^0.5.39
  path_provider: ^2.1.5
  path: ^1.9.1
  firebase_core: ^4.2.1
  firebase_auth: ^6.1.2
  http: ^1.6.0
  flutter_dotenv: ^6.0.0
  flutter_riverpod: ^3.2.1
  riverpod_annotation: ^4.0.2
  go_router: ^17.1.0
  google_sign_in: ^7.2.0
```

---

## 🔑 Environment Variables

This project can use a `.env` file for optional configuration (not committed).

### `.env` example

```env
GOOGLE_WEB_CLIENT_ID=your_web_client_id_here
```

> ⚠️ The `.env` file is **not included** in the repository and should never be committed.

### Gemini API key

Gemini’s API key is stored under `lib/key/api.dart`, which is gitignored (`lib/key/` is not committed). Only `lib/services/gemini_service.dart` reads it.

---

## 🚀 Getting Started

### Prerequisites

- Flutter (stable)

- Dart SDK compatible with `pubspec.yaml` (`sdk: ^3.9.2`)

- Android emulator or physical device
    
- Firebase project configured (Android `google-services.json` present)

- Gemini API key (via `lib/key/api.dart`)
    

### Installation

```bash
git clone https://github.com/your-username/fogonesia.git
cd fogonesia
flutter pub get
```

Optionally create a `.env` file at the project root and add `GOOGLE_WEB_CLIENT_ID` (only needed for some Google Sign-In setups).

```bash
flutter run
```

---

## 🎯 Project Goals

- Learn Flutter app architecture beyond basics
    
- Practice Riverpod-based state management
    
- Work with structured AI responses (JSON → UI)
    
- Build reusable and testable components
    
- Prepare for future expansion (recipes, persistence, editing)
    

---

## 📌 Notes

- Firebase authentication is implemented (email/password + Google Sign-In)
    
- This project is **not production-ready**
    
- API responses are assumed to be structured JSON (subject to validation improvements)
    

---

## 📄 License

This project is for educational purposes.  
License to be defined.

---

## 🙌 Acknowledgments

- Flutter & Dart teams
    
- Google Gemini API
    
- Open-source Flutter ecosystem
    

---

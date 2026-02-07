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
    
    - Gemini API key stored safely in `.env` (not committed)
        

### 🚧 Planned (TODO)

- 💾 Save generated recipes locally (SQLite)
    
- 📚 Recipes screen to list saved recipes
    
- ✏️ Editable recipes
    
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

- **Flutter:** 3.35.6
    
- **Dart SDK:** 3.9.2
    
- **Target Platform:** Android
    

### Architecture

- MVC-ish (learning-focused)
    
- **State Management:** Provider
    

### AI

- **Gemini API**
    

### Storage

- Local only
    
    - `shared_preferences`
        
    - `sqflite`
        

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  shared_preferences: ^2.5.4
  provider: ^6.1.5+1
  sqflite: ^2.4.2
  path: ^1.9.1
  firebase_core: ^4.2.1
  firebase_auth: ^6.1.2
  http: ^1.6.0
  flutter_dotenv: ^6.0.0
```

---

## 🔑 Environment Variables

This project uses a `.env` file to store sensitive data.

### `.env` example

```env
GEMINI_API_KEY=your_api_key_here
```

> ⚠️ The `.env` file is **not included** in the repository and should never be committed.

---

## 🚀 Getting Started

### Prerequisites

- Flutter 3.35.6
    
- Dart SDK 3.9.2
    
- Android emulator or physical device
    
- Gemini API key
    

### Installation

```bash
git clone https://github.com/your-username/fogonesia.git
cd fogonesia
flutter pub get
```

Create a `.env` file at the project root and add your Gemini API key.

```bash
flutter run
```

---

## 🎯 Project Goals

- Learn Flutter app architecture beyond basics
    
- Practice Provider-based state management
    
- Work with structured AI responses (JSON → UI)
    
- Build reusable and testable components
    
- Prepare for future expansion (recipes, persistence, editing)
    

---

## 📌 Notes

- Firebase is currently included for future authentication features
    
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

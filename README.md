# consyst_test

# 📝 My Notes

My Notes is a Flutter application that allows users to securely sign up, log in, and manage their personal notes. Built using **Flutter**, **Firebase**, and **GetX**, the app ensures a smooth, reactive, and modular experience for note-taking.

## 🚀 Features

### 🔐 User Authentication
- Sign up and log in using **Firebase Authentication**
- Email/password-based authentication
- Proper error handling (e.g., invalid email, wrong password, network errors)

### 🗒️ Notes Management
- Authenticated users can **create**, **edit**, and **delete** personal notes
- Each note includes:
  - A **title**
  - **Content**
  - **Timestamp** (date & time)
- All notes are stored in **Firebase Cloud Firestore**
- Notes list view:
  - Displays all notes by the authenticated user
  - Tapping a note navigates to the note details screen

### 👤 User Profile
- Profile screen displays the current user’s email
- Log out functionality

---



---

## 📦 Tech Stack

| Technology      | Usage                          |
|-----------------|--------------------------------|
| **Flutter**     | UI Toolkit                     |
| **Firebase**    | Authentication & Firestore     |
| **GetX**        | State management & navigation  |
| **MVC Pattern** | Clean and modular architecture |

---

## 🧠 State Management

Used **GetX** for:
- Routing and navigation
- State updates and reactive variables
- Dependency injection

---

## 📁 Project Structure

```bash
lib
├── Colors.dart
├── Constants.dart
├── app
│   ├── data
│   ├── modules
│   │   ├── authentication
│   │   │   ├── bindings
│   │   │   │   └── authentication_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── authentication_controller.dart
│   │   │   └── views
│   │   │       ├── authentication_view.dart
│   │   │       └── textformfields.dart
│   │   ├── notes
│   │   │   ├── bindings
│   │   │   │   └── notes_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── notes_controller.dart
│   │   │   └── views
│   │   │       ├── notes_detailed_view.dart
│   │   │       ├── notes_edit_view.dart
│   │   │       └── notes_view.dart
│   │   ├── profile
│   │   │   ├── bindings
│   │   │   │   └── profile_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── profile_controller.dart
│   │   │   └── views
│   │   │       └── profile_view.dart
│   │   └── splashscreen
│   │       ├── bindings
│   │       │   └── splashscreen_binding.dart
│   │       ├── controllers
│   │       │   └── splashscreen_controller.dart
│   │       └── views
│   │           └── splashscreen_view.dart
│   └── routes
│       ├── app_pages.dart
│       └── app_routes.dart
├── enumConstants.dart
├── firebase_options.dart
├── main.dart
└── provider_api.dart

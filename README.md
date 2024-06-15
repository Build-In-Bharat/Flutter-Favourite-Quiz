# Flutter Quiz App

A simple Flutter application to display quizzes fetched from an API. Users can view all quizzes or only their favorite quizzes.

## Features

- View all available quizzes.
- Mark quizzes as favorite.
- Switch between viewing all quizzes and favorite quizzes.
- View quiz details and questions.

## Screenshots

<table>
  <tr>
    <td><img src="https://i.postimg.cc/cHfsnj6k/Whats-App-Image-2024-06-14-at-4-45-22-PM.jpg" alt="image1" width="300"/></td>
    <td><img src="https://i.postimg.cc/GtrbJQyL/Whats-App-Image-2024-06-14-at-4-45-23-PM.jpg" alt="image2" width="300"/></td>
  </tr>
  <tr>
    <td><img src="https://i.postimg.cc/BnyswsKw/Whats-App-Image-2024-06-14-at-4-45-24-PM.jpg" alt="image3" width="300"/></td>
    <td><img src="https://i.postimg.cc/zGLYhMcw/Whats-App-Image-2024-06-14-at-4-45-25-PM.jpg" alt="image4" width="300"/></td>
  </tr>
</table>


## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Yashshukla11/Quiz.git
   ```
2. **Redirect to app directory**
   ```bash
   cd quiz_app
   ```
3. **Install dependencies**
   ```bash
   flutter pub get
   ```
4. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

The project follows the recommended structure for Flutter applications, implementing best practices such as the Repository pattern for API consumption and Provider for state management.
```bash
lib
├── main.dart
├── app.dart
├── models
│   ├── option.dart
│   ├── question.dart
│   └── quiz.dart
├── providers
│   └── quiz_provider.dart
├── repositories
│   └── quiz_repository.dart
├── screens
│   ├── home_screen.dart
│   ├── favourit_quiz_screen.dart
│   ├── quiz_list_screen.dart
│   └── quiz_detail_screen.dart
├── services
│   └── api_service.dart
├── utils
│   └── constants.dart
└── widgets
    └── quiz_tile.dart

```
## Attachment
I have attached the apk file [here](https://github.com/Yashshukla11/Quiz/blob/main/app-release.apk).

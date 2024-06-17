# Flutter-Favourite-Quiz

This Flutter application fetches and displays a list of quizzes from a remote API. It allows users to mark quizzes as favorites and view them in a separate section. The app uses the Provider pattern for state management and the Repository pattern for separating the API consumption layer from the view layer. Additionally, it handles network connectivity issues gracefully by displaying an icon and message when there is no internet connection.

## Table of Contents

1. [Installation](#installation)
2. [Project Structure](#project-structure)
3. [Key Files and Code Explanation](#key-files-and-code-explanation)
   - [main.dart](#maindart)
   - [HomeScreen](#homescreen)
   - [QuizProvider](#quizprovider)
   - [QuizRepository](#quizrepository)
   - [ApiService](#apiservice)
4. [Handling Network Issues](#handling-network-issues)
5. [Running the App](#running-the-app)

## 1. Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/kamranaar/Flutter-Favourite-Quiz.git
   cd Flutter-Favourite-Quiz
   ```
2. **Install Dependencies:**:
   ```bash
   flutter pub get
   ```
3. **Run the App:**:
   ```bash
   flutter run
   ```

## 2. Project Structure

```
        lib/
        ├── main.dart
        ├── screens/
        │ ├── home_screen.dart
        │ ├── liked_quiz_screen.dart
        │ └── main_navigator.dart
        ├── providers/
        │ ├── connectivity_provider.dart
        │ ├── main_navigation_provider.dart
        │ └── quiz_provider.dart
        ├── repositories/
        │ ├── connectivity_repository.dart
        │ └── quiz_repository.dart
        ├── services/
        │ ├── api_service.dart
        │ └── connectivity_service.dart
        ├── models/
        │ ├── connectivity_state.dart
        │ ├── quiz.dart
        │ └── quiz.g.dart
        └── widgets/
        ├── quiz_items.dart
        └── quiz_list.dart
```

## 3. Key Files and Explaination

- main.dart

  The entry point of the application. It sets up the QuizProvider using the Provider package and initializes the HomeScreen.

- HomeScreen

  The main screen that displays the list of quizzes. It uses a FutureBuilder to fetch quizzes and handle loading and error states. An icon and a message are displayed when there is no internet connection.

- QuizProvider

  Manages the state of quizzes and favorites. It fetches quizzes using the QuizRepository and provides methods to toggle favorite status.

- QuizRepository

  Handles data fetching from the API service. It uses ApiService to get the quizzes and abstracts the data layer from the rest of the application.

- ApiService:

  Responsible for making API calls. It fetches data from the provided API endpoint.

- Handling Network Issues:

  The application checks for internet connectivity before attempting to fetch quizzes. If there is no internet connection, an icon and a message are displayed to the user.
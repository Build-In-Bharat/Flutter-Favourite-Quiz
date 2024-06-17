# QuizApp

QuizApp is a Flutter application that fetches quiz contents from an API and allows users to mark quizzes as favorites. The app uses the Provider package for state management and employs the Repository pattern. It includes detailed error messages and retry buttons, along with internet connectivity checks.

## Features

- Fetch quizzes from a remote API.
- Mark quizzes as favorites.
- Manage state using Provider.
- Implemented the Repository pattern for data management.
- Display detailed error messages and retry options.
- Check for internet connectivity.
- API is consumed with appropriate states.

## Screenshots

![Favourite's Screen](https://drive.google.com/uc?export=view&id=1CaB7X2LMwPZ0tYBogl-ONuR6Blqu0cdu)
![Question Screen](https://drive.google.com/uc?export=view&id=19sdXPqs8xJetNAXpjMw2d19n-quA3OqB)
![Home Screen](https://drive.google.com/uc?export=view&id=10V5oVWdwsfN-8urRAZTV3XGVIkzMEcQJ)



## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/quizapp.git
    ```

2. Navigate to the project directory:

    ```bash
    cd quizapp
    ```

3. Install the dependencies:

    ```bash
    flutter pub get
    ```

### Running the App

1. Connect a device or start an emulator.
2. Run the app:

    ```bash
    flutter run
    ```

## Architecture

The app follows the Repository pattern to manage data flow and uses the Provider package for state management.

### Directory Structure

```plaintext
lib
├── constants
│   └── home_screen_demolist.dart
├── data
│   ├── models
│   │   └── quiz_model.dart
│   ├── repositories
│   │   └── quiz_repository.dart
│   └── services
│       └── connectivity_check_service.dart
├── provider
│   ├── favourites_provider.dart
│   ├── heart_animation_provider.dart
│   ├── question_page_provider.dart
│   └── quiz_provider.dart
├── routes
│   ├── generated_routes.dart
│   └── named_routes.dart
├── screens
│   ├── bottom_nav_bar.dart
│   ├── favourites_screen.dart
│   ├── home_screen.dart
│   └── questions_screen.dart
├── theme
│   ├── api.dart
│   ├── theme
│   └── routes
├── widgets
│   ├── favourite_screen_container
│   │   ├── question_container.dart
│   ├── home_screen_widgets
│   │   ├── custom_error.dart
│   │   ├── custom_no_internet_alert_dialog.dart
│   │   ├── heart_animating_util.dart
│   │   ├── home_screen_headings.dart
│   │   ├── quiz_container.dart
│   │   └── topic_container.dart
│   └── question_screen_widgets
│       ├── option_container.dart
│       └── question_view_container.dart
└── main.dart
```
## Packages Used

- `cupertino_icons: ^1.0.2`: For Cupertino styled icons.
- `flutter_screenutil: ^5.9.3`: For adapting screen and font sizes.
- `google_fonts: ^6.2.1`: For using Google Fonts in the app.
- `google_nav_bar: ^5.0.6`: For a customizable bottom navigation bar.
- `device_preview: ^1.2.0`: For previewing the app on different devices.
- `dio: ^5.4.3+1`: For making API calls.
- `pretty_dio_logger: ^1.3.1`: For logging network requests made with Dio.
- `provider: ^6.1.2`: For state management.
- `flutter_spinkit: ^5.2.1`: For a collection of loading indicators.
- `flutter_svg: ^2.0.10+1`: For rendering SVG images.
- `connectivity_plus: ^6.0.3`: For checking internet connectivity.

## API

The app fetches quiz data from a remote API. Replace the `API_BASE_URL` in `api.dart` with the actual URL of your API.

## Error Handling

The app includes detailed error messages and retry buttons. If an error occurs during an API call, an error widget is displayed with an option to retry the request.

## Internet Connectivity

The app checks for internet connectivity using the `connectivity_plus` package. If the device is not connected to the internet, a message is displayed to the user.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Provider Package](https://pub.dev/packages/provider)
- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

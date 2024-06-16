# QuizApp

Flutter based application made in accordance with assignment for Build in Bharat, 
Dependencies used: 
- http: ^1.2.1 : To handle API requests 
- google_nav_bar: ^5.0.6 : Bottom Navigation Bar
- provider: ^6.1.2 : State Management for the entire app
- shared_preferences: ^2.2.3 : To store data locally on the device

## How to run

Clone the project

```bash
  git clone the repository
```

Go to the project directory

```bash
  cd Flutter-Favourite-Quiz/quizapp
```

Get all dependencies
```
flutter pub get
```
Open Android Studio / VS code

Now run your virtual device/ connect your real device (with usb debugging on)

```
Select your device and run main.dart
```
Difficulties faced:
- Provider state management implementation
- Every time when navigating to home page api was getting hit making app slower and utilization of bandwidth
- Storing favorite quiz such that it is still in memory even after closing of app

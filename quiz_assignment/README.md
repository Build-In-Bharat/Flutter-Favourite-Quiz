# Quiz Application

This project is a Flutter application that fetches and displays quizzes from an API, allowing users to mark quizzes as favorites and view them separately. The application follows best practices in Flutter development, utilizing the Provider pattern for state management and the Repository pattern for data handling.

## Features

- Fetches quizzes from a remote API
- Displays a list of quizzes
- Allows users to mark quizzes as favorites
- Displays favorite quizzes in a separate section
- Comprehensive error handling for various HTTP status codes
- Gradient background design for visual appeal

## Architectural Decisions

### Provider Pattern
We chose the Provider pattern for state management due to its simplicity and efficiency in managing state in Flutter applications. Provider allows for clean separation of concerns, making the codebase more maintainable and scalable. By using `ChangeNotifier`, we ensure that our UI components are updated reactively when the state changes.

### Repository Pattern
The Repository pattern was implemented to handle data operations and abstract the data layer from the rest of the application. This pattern provides a clean API for data access and allows us to manage data from different sources (e.g., network, local storage) in a consistent manner. It also simplifies unit testing by enabling us to mock the data layer.

### Separation of Concerns
- **Model Layer**: Contains data models representing the structure of the quiz data.
- **Repository Layer**: Responsible for fetching data from the API and providing it to the Provider.
- **Provider Layer**: Manages the state and business logic, exposing the necessary data to the UI.
- **UI Layer**: Comprises the screens and widgets, displaying data and handling user interactions.

## Libraries Used

- **Flutter**: The core framework used to build the application.
- **Provider**: For state management, allowing us to easily manage and listen to changes in the application state.
- **http**: For making network requests to the quiz API.

## Challenges Faced

1. **Handling API Errors**:  
   Implementing comprehensive error handling for various HTTP status codes required careful consideration. We ensured that different types of errors (e.g., 404 Not Found, 500 Internal Server Error) were managed appropriately, providing meaningful feedback to the user.

2. **State Synchronization**:  
   Synchronizing the state between the list of quizzes and the list of favorite quizzes was a challenge. We ensured that the favorite quizzes list was always up-to-date by filtering the quizzes after fetching new data from the API.

3. **Gradient Design**:  
   Creating a visually appealing gradient background and ensuring consistency across different screens and widgets required several iterations. Balancing aesthetic appeal with readability and usability was crucial.

4. **Error and Connectivity Handling**:  
   Instead of using external packages for connectivity monitoring, we decided to handle all errors and connectivity issues directly within the API request function. This approach ensures that any network-related issues are caught and managed at the point of the request, providing a streamlined user experience.

## Error Handling in API Requests

We enhanced the `fetchQuizzes` function in the `QuizRepository` to handle various error conditions and status codes, including connectivity issues, by catching exceptions and providing meaningful error messages.

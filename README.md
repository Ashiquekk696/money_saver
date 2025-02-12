# Saving Tracker App

Saving Tracker is a Flutter app designed to help users track and manage their savings effectively. The app follows clean architecture principles and uses the BLoC pattern for state management. It is built with scalability and maintainability in mind.

## Project Structure

This project follows the **Clean Architecture** design pattern with **BLoC** state management. The project is organized into different layers to ensure separation of concerns.

### Folder Structure:
lib/ ├── data/ │ ├── models/ │ ├── repositories/ │ └── sources/ ├── domain/ │ ├── repositories/ ├── features/ │ └── saving/ │ ├── presentation/ │ │ ├── bloc/ │ │ ├── pages/ │ │ └── widgets/ ├── utils/ └── app.dart

### Folder Descriptions

- **data/**: This layer handles data-related operations. It contains models, repositories, and data sources for interacting with external APIs, databases, or local storage.
  - **models/**: Data models for the app.
  - **repositories/**: Repositories that manage data fetching and updating.
  - **sources/**: Data sources responsible for fetching data from remote or local sources.

- **domain/**: This layer defines the business logic of the app and contains entities, repositories, and use cases.
  - **entities/**: Core data structures that represent domain entities.
  - **repositories/**: Defines abstract repository interfaces to be implemented in the data layer.
  - **usecases/**: Contains the business logic for each feature, interacting with the repositories.

- **features/saving/**: This folder contains everything related to the "saving" feature of the app.
  - **presentation/**: Contains UI-related components like pages, widgets, and BLoC for managing the state of the UI.
    - **bloc/**: BLoC classes for managing state and events related to savings.
    - **pages/**: Screens or pages of the app for presenting data to the user.
    - **widgets/**: Reusable widgets for the saving feature's UI.

- **utils/**: This folder contains utility classes and helper functions that can be shared across the app.

## BLoC State Management

The app uses the **BLoC** (Business Logic Component) pattern to manage state. BLoC is used to separate business logic from UI code, allowing for easier testing and better maintainability.

- The **BLoC** handles events and states related to savings (e.g., adding a new saving, fetching saving data, etc.).
- The **UI** (widgets and pages) interacts with the BLoC to update the state and display changes.

## Clean Architecture

Clean Architecture ensures that your code is scalable, maintainable, and testable by separating the app into different layers.

- **Presentation Layer**: Responsible for showing the UI and interacting with the BLoC.
- **Domain Layer**: Contains business logic and use cases.
- **Data Layer**: Handles the app's data (e.g., retrieving and storing savings data).

### Benefits of Clean Architecture:

- Separation of concerns.
- Easier to test and maintain.
- Scalability to add new features.
- Flexibility to swap out data sources (e.g., replace a local database with a remote API).

## Features

- **Track Savings**: Allows users to track their savings and see progress over time.
- **Saving Goals**: Users can create saving goals and set target amounts.
- **Savings Analytics**: Visualize your savings with graphs and charts.
- **Budgeting**: Set and track budgets for different saving categories.

 
## Future Improvements

- Add authentication (Firebase/Auth).
- Implement more advanced analytics.
- Integrate with external services for managing expenses and income.
- Support for multi-currency.
 

# Movie App

## Overview

The Movie App is a Flutter application that allows users to browse and search for movies.
It uses the Bloc library for state management and follows the clean architecture principles,
dividing the app into three layers: domain, data, and presentation.


## Screenshots

<p align="center">
  <img src="https://github.com/mohamedhany7420/movie-app/blob/e4be6865f83e14bd26d8faa1420e65e367b02d15/photo_2025-01-30_09-28-06.jpg" alt="Screenshot 1" width="100"/>
  <img src="https://github.com/mohamedhany7420/movie-app/blob/e4be6865f83e14bd26d8faa1420e65e367b02d15/photo_2025-01-30_09-28-07.jpg" alt="Screenshot 2" width="100"/>
  <img src="https://github.com/mohamedhany7420/movie-app/blob/e4be6865f83e14bd26d8faa1420e65e367b02d15/photo_2025-01-30_09-28-17.jpg" alt="Screenshot 1" width="100"/>
  <img src="https://github.com/mohamedhany7420/movie-app/blob/e4be6865f83e14bd26d8faa1420e65e367b02d15/photo_2025-01-30_09-28-18.jpg" alt="Screenshot 2" width="100"/>
  <img src="https://github.com/mohamedhany7420/movie-app/blob/e4be6865f83e14bd26d8faa1420e65e367b02d15/photo_2025-01-30_09-28-39.jpg" alt="Screenshot 1" width="100"/>
  <img src="https://github.com/mohamedhany7420/movie-app/blob/e4be6865f83e14bd26d8faa1420e65e367b02d15/photo_2025-01-30_09-28-48.jpg" alt="Screenshot 2" width="100"/>
  <img src="https://github.com/mohamedhany7420/movie-app/blob/e4be6865f83e14bd26d8faa1420e65e367b02d15/photo_2025-01-30_09-28-50.jpg" alt="Screenshot 1" width="100"/>
  <img src="https://github.com/mohamedhany7420/movie-app/blob/e4be6865f83e14bd26d8faa1420e65e367b02d15/photo_2025-01-30_09-28-52.jpg" alt="Screenshot 2" width="100"/>
  <img src="https://github.com/mohamedhany7420/movie-app/blob/e4be6865f83e14bd26d8faa1420e65e367b02d15/photo_2025-01-30_09-28-57.jpg" alt="Screenshot 1" width="100"/>
  <img src="https://github.com/mohamedhany7420/movie-app/blob/e4be6865f83e14bd26d8faa1420e65e367b02d15/photo_2025-01-30_09-28-04.jpg" alt="Screenshot 2" width="100"/>

</p>

## Features

- Browse now playing movies
- Browse popular movies
- Browse top rated movies
- View movie details
- Display movie recommendations

## Architecture

The app follows the clean architecture pattern, which divides the codebase into three main layers:

1. **Domain Layer**
2. **Data Layer**
3. **Presentation Layer**

### Domain Layer

The domain layer is the core of the application. It contains the business logic and the entities. This layer is independent of any other layers, making it easy to test and maintain.

- **Entities**: Basic data structures that represent the core business logic.
- **Use Cases**: Classes that encapsulate the application's business logic. Each use case represents a specific action that can be performed in the app.

### Data Layer

The data layer is responsible for managing the data sources. It provides the data required by the domain layer and handles data retrieval from remote and local sources.

- **Repositories**: Interfaces that define the data operations. The domain layer depends on these interfaces.
- **Data Sources**: Implementations of the repositories that fetch data from remote APIs or local databases.

### Presentation Layer

The presentation layer is responsible for displaying the data to the user. It contains the UI components and the state management logic.

- **Bloc**: The Bloc (Business Logic Component) pattern is used for state management. It separates the presentation layer from the business logic.
- **Widgets**: Flutter widgets that build the UI and interact with the Bloc to display data and handle user input.

## State Management

The app uses the Bloc library for state management. Bloc helps to separate the business logic from the UI, making the code more modular and testable.

- **Bloc**: Manages the state of the application and handles events.
- **Events**: Represent actions that can be performed in the app (e.g., fetching movies, searching for movies).
- **States**: Represent the different states of the UI (e.g., loading, loaded, error).

## Packages

The app uses the following packages:

- `cupertino_icons`: Provides the Cupertino icons used in iOS-style apps.
- `equatable`: Simplifies equality comparisons in Dart objects.
- `dartz`: Functional programming in Dart, including monads, functional data structures, and more.
- `get_it`: A simple service locator for dependency injection.
- `dio`: A powerful HTTP client for Dart, which supports interceptors, global configuration, and more.
- `flutter_bloc`: A predictable state management library that helps implement the Bloc pattern.
- `go_router`: A declarative router for Flutter, supporting deep linking and navigation.
- `cached_network_image`: A Flutter library to load and cache network images.
- `carousel_slider`: A carousel slider widget for Flutter.
- `google_fonts`: Provides access to the Google Fonts library.
- `animate_do`: A package for easily adding animations to Flutter widgets.
- `shimmer`: A package for adding shimmer effects to Flutter widgets.

## SOLID Principles

The app follows the SOLID principles to ensure a clean and maintainable codebase:

- **Single Responsibility Principle (SRP)**: Each class has a single responsibility, making the code easier to understand and maintain.
- **Open/Closed Principle (OCP)**: Classes are open for extension but closed for modification, allowing new functionality to be added without changing existing code.
- **Dependency Inversion Principle (DIP)**: High-level modules should not depend on low-level modules, both should depend on abstractions.This principle is achieved using dependency injection.

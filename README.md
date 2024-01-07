# MoviesApp
 Movies app is a SwiftUI app that follows the VIP Clean Architecture pattern with dependency injection and combine . It provides examples of using presenters, interactors, models, data wrapper models, and a repository pattern with Alamofire for network requests.

 the app consists of two screens the first one include a list of now playing movies with sorting options to present the popular and top rated movies also a clear option to return to the now playing list. the second is a details view which contains the movie details .
 
---
# Architecture Overview
The app follows the VIP Clean Architecture pattern, which stands for View, Interactor, Presenter (VIP). The core principle of this architecture is separation of concerns and dependency inversion.

---
# Components:
View: SwiftUI views responsible for rendering the user interface and handling user interactions. They receive updates from the presenter and send user actions to the presenter.

- **Presenter:**
  Acts as an intermediary between the view and the interactor. It receives user actions from the view, processes them, and updates the view with the necessary data.

- **Interactor:**
 Contains the business logic of the app. It communicates with data wrapper models and repositories to fetch and process data. It interacts   with the presenter to provide the necessary data for the view.

- **Models:**
  The app's data models that represent the entities and structures used in the app.

- **Data Wrapper Models:**
  Models that encapsulate the data received from external sources, such as APIs or databases.

- **Repository:**
  Handles data retrieval and persistence. It abstracts the details of data sources and provides a clean interface for the interactor to work with. In this app, the  repository uses Alamofire for network requests.

- **Dependency Injection:**
   The app utilizes dependency injection to decouple components and manage dependencies. It uses a property wrapper @Inject annotation and a DI container with an assembler to provide dependencies to the necessary components.
  
- **Combine:**
  The app uses Combine, Apple's framework for reactive programming, to handle data transport and asynchronous operations. Combine provides a declarative way to handle asynchronous events, such as network requests and data updates.
---
# Installation
To run the app:<br />

Clone the repository.<br />
pod install.<br />
Open the project in Xcode.<br />
Build and run the app on a simulator or physical device.<br />

---
# Usage
The app showcases a sample feature that demonstrates the flow between view, presenter, interactor and repository. 

---
# Dependency Injection
The app uses dependency injection to manage dependencies between components. It utilizes a property wrapper @Inject annotation and a DI container with an assembler.

Property Wrapper @Inject: The @Inject property wrapper is used to mark dependencies that need to be injected into the components. By using @Inject, the dependencies are automatically resolved and provided to the component.

DI Container and Assembler: The DI container is responsible for managing the lifecycle of dependencies and providing them when needed. The assembler is used to configure the DI container by registering dependencies and their respective implementations.

The DI container and assembler implementation can be found in the DIContainer and Assembler files.

---
# Combine
The app uses Combine for data transport and asynchronous operations. Combine allows you to handle asynchronous events, such as network requests and data updates, in a declarative manner. It provides a wide range of operators and features for reactive programming.

You can find examples of using Combine in the app's codebase, particularly in the interaction between the interactor and the repository for fetching and processing data.

---
# Dependencies
The app uses the following dependencies:

Alamofire: A Swift-based HTTP networking library for making network requests.
These dependencies are managed using Swift Package Manager and are included in the project.

---
# Acknowledgements
Alamofire for providing a powerful networking library.<br />
SwiftUI for the declarative approach to building user interfaces.<br />
VIP Clean Architecture for the architectural pattern used in the app.<br />

# take_home

A new Flutter project.

Clone app from here :
Git repository = https://github.com/piyush85730/take_home.git
Working base branch name = main

How to run application :
1. Use this command for fetch dependencies
   flutter pub get
2. Use this command for run app
   flutter run


Project Structure :

my_flutter_project/
│
├── lib/
│   ├── core/                       Shared code (utils, services, widgets, themes, constants)
│   ├── features/                   Self-contained features (feature1, feature2, etc.)
│   ├── routes/                     Routing of Screen
│   └── injection_container/        Injection of all controller and source
│
├── assets/             Shared assets
├── test/               Tests
└── pubspec.yaml        Dependencies

Key Components
1. Core Module:
    - Utils: Utility functions.
    - Services: Shared services (API clients, database).
    - Widgets: Common UI components.
    - Themes: App-wide themes and styles.

2. Feature Modules:
    - Each feature (e.g., `feature1`, `feature2`) is self-contained with its own logic and UI components.
    - Each feature has Data, Domain, Presentation layers.

    1. Data Layer : The Data Layer is responsible for interacting with external data sources, such as databases, network services, or repositories. It handles the storage and retrieval of data.
        - Repositories or Gateways: Abstract interfaces that define how data is accessed and stored.
        - Data Models: Represent the structure of the data as it is stored in the external data sources.
        - Data Sources: Implementations of repositories that interact with databases, APIs, or other external services.

    2. Domain Layer : The Domain Layer, also known as the Business Logic or Use Case Layer, contains the core business rules and logic of the application. It represents the heart of the software system, encapsulating the essential functionality that is independent of any particular framework.
        - Entities: Represent the fundamental business objects or concepts.
        - Use Cases: Contain application-specific business rules and orchestrate the flow of data between entities. They are responsible for executing specific actions or operations.
        - Business Rules and Logic (Repository): Core functionality that is crucial to the application’s domain.

    3. Presentation Layer : The Presentation Layer is the outermost layer, responsible for presenting information to the user and capturing user interactions. It includes all the components related to the user interface (UI), such as widgets, screens, and presenters/controllers (State Management).
        - Screens: Represent the feature screens.
        - Widgets and UI Components: Represent the visual elements of the application.
        - Manager/Controllers: Contain the presentation logic that interacts with the UI components. They receive user input, communicate with the Use Cases in the Domain Layer, and update the UI accordingly.

3. Routes: In this app we use One Context Routing. One Context route management is a simple and efficient way to handle navigation in This app.
    - Named routes: One Context uses named routes, which makes it easier to navigate between screens and manage your routing logic.
    - Route arguments: One Context allows you to pass arguments to routes, making it easy to share data between screens.
    - Route transitions: One Context provides a number of built-in route transitions, so you can easily add animations and other effects to your routing.
    - Middleware: One Context allows you to use middleware to protect routes and perform other actions before or after navigation.

4. Injection Container: In this Injection, We inject all controllers, data sources, repositories in main Singleton class.

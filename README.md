# Rolex Boutique - Flutter E-commerce Template

<p align="center">
  <img src="assets/images/rolex_boutique.png" alt="Rolex Boutique App Icon" width="150"/>
</p>

<h1 align="center">Flutter E-commerce App with Clean Architecture</h1>

<p align="center">
  A feature-rich, scalable, and maintainable e-commerce application template built with Flutter. This project serves as a practical example of implementing Clean Architecture principles in a real-world application, making it an ideal starting point for your next e-commerce project.
</p>

---

## 🌟 Features

- **Clean Architecture:** A well-structured and layered architecture for maintainability and scalability.
- **State Management:** Using `provider` for efficient and straightforward state management.
- **Dependency Injection:** Leveraging `get_it` for managing dependencies and decoupling components.
- **Authentication:** Simple and secure user authentication using Firebase and Google Sign-In.
- **Product Catalog:** A beautiful and interactive product catalog to browse items.
- **Shopping Cart:** A fully functional shopping cart to add, remove, and manage items.
- **Search Functionality:** Easily search for products within the app.
- **Responsive Design:** A user interface that adapts to different screen sizes.

---

## 📸 Screenshots

| Get Started | Shop | Item Details |
| :---: | :---: | :---: |
| <img src="assets/images/screenshots/rolex_boutique_getting_started_page.png" alt="Get Started Screen" width="250"/> | <img src="assets/images/screenshots/rolex_boutique_home_page.png" alt="Shop Screen" width="250"/> | <img src="assets/images/screenshots/rolex_boutique_item_details_page.png" alt="Item Details Screen" width="250"/> |

| Cart | Invoice | Drawer Menu |
| :---: | :---: | :---: |
| <img src="assets/images/screenshots/rolex_boutique_cart_page.png" alt="Cart Screen" width="250"/> | <img src="assets/images/screenshots/rolex_boutique_recipt_modal.png" alt="Invoice Dialog" width="250"/> | <img src="assets/images/screenshots/rolex_boutique_drawer_menu.png" alt="Drawer Menu" width="250"/> |

---

## 🏗️ Architecture

This project follows the principles of **Clean Architecture** to create a separation of concerns, making the codebase easier to test, maintain, and scale. The architecture is divided into three main layers:

- **Presentation Layer:** Contains the UI and state management logic. It is responsible for displaying data to the user and handling user input.
- **Domain Layer:** The core of the application. It contains the business logic and rules, and is independent of any other layer.
- **Data Layer:** Responsible for data retrieval from various sources (e.g., remote API, local database). It implements the repositories defined in the domain layer.

```
lib/
├── app/                # App-level widgets, routes, and main app setup
├── core/               # Shared code: DI, error handling, theme, use cases
├── features/           # Application features (e.g., auth, cart, shop)
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── cart/
│   │   └── ...
│   └── shop/
│       └── ...
└── main.dart           # App entry point
```

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

### Installation

1.  **Clone the repo**
    ```sh
    git clone https://github.com/your_username/rolex_boutique.git
    ```
2.  **Navigate to the project directory**
    ```sh
    cd rolex_boutique
    ```
3.  **Install dependencies**
    ```sh
    flutter pub get
    ```
4.  **Set up Firebase**

    - Create a new project on the [Firebase Console](https://console.firebase.google.com/).
    - Add an Android app to your Firebase project with the package name `com.example.rolex_boutique`.
    - Download the `google-services.json` file and place it in the `android/app` directory.
    - Add an iOS app to your Firebase project with the bundle ID `com.example.rolexBoutique`.
    - Download the `GoogleService-Info.plist` file and place it in the `ios/Runner` directory.
    - Enable **Google Sign-In** in the Firebase console (Authentication > Sign-in method).

5.  **Run the app**
    ```sh
    flutter run
    ```

---

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

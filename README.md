# Mallaz Dashboard
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Mohamed123-r/mallaz)
![5915877177893702036](https://github.com/user-attachments/assets/dbc7c61e-692a-4d8d-b064-d6811770e5af)
for ore phote scroll down


Mallaz Dashboard is a comprehensive administrative panel built with Flutter for managing the Mallaz real estate platform. It provides administrators with a powerful and intuitive interface to oversee properties, users, appointments, and other operational aspects of the application. The dashboard is designed for desktop platforms (Windows, macOS, and Linux) and supports both light and dark modes, as well as English and Arabic languages.

## Key Features

*   **Analytics Dashboard**: Visualize key metrics such as total units, sold vs. rented properties, and user statistics.
*   **Property Management**:
    *   Review and approve/reject new property listing requests.
    *   Manage units for sale, tracking their status (e.g., Available, Under Review, Sold).
    *   Manage rental properties and their availability.
    *   Edit detailed property information.
*   **User & Admin Management**:
    *   View, search, and manage platform users, including the ability to block or unblock accounts.
    *   Add and view other administrator accounts with specific roles.
*   **Appointment Handling**: View and manage appointment requests submitted by users for property viewings.
*   **Integrated Chat**: A real-time chat feature for providing support and communicating with users.
*   **Broadcast Notifications**: Send custom announcements and notifications to all users or specific groups.
*   **Multi-language & Theming**:
    *   Full localization for English and Arabic.
    *   Seamless switching between light and dark modes.

## Tech Stack & Architecture

*   **Framework**: Flutter
*   **Architecture**: Feature-Driven directory structure with Clean Architecture principles.
*   **State Management**: BLoC / Cubit for predictable and scalable state management.
*   **Networking**: `Dio` for handling API requests with interceptors for token management.
*   **Dependency Injection**: `GetIt` for service locator pattern.
*   **Local Storage**: `SharedPreferences` for caching user sessions and preferences.
*   **Internationalization**: `intl` package for localization.
*   **Desktop Integration**: `bitsdojo_window` for custom window management.

## Project Structure

The project is organized using a feature-driven approach to ensure modularity and scalability. Core functionalities and shared components are separated from feature-specific logic.

```
lib/
├── Features/         # Main application features (e.g., login, home)
│   └── [feature_name]/
│       ├── data/         # Repositories, data sources, and models
│       └── presentation/ # UI (views) and state management (cubits)
├── core/             # Shared components, services, and utilities
│   ├── api/          # API consumer, endpoints, and interceptors
│   ├── errors/       # Exception and failure handling
│   ├── services/     # Cross-cutting services like theme and locale
│   └── widgets/      # Common reusable widgets
├── generated/        # Auto-generated files (e.g., localization from intl)
└── main.dart         # Application entry point
```

## Some photos


![5915877177893702030](https://github.com/user-attachments/assets/9f473e10-543b-4d62-bf31-20c58fbb25ac)
![5915877177893702029](https://github.com/user-attachments/assets/964c549d-9517-4e3c-bccf-848891d00e42)
![5915877177893702034](https://github.com/user-attachments/assets/e66f55f9-c08c-4764-93f2-4c59fdd220e8)
![5915877177893702033](https://github.com/user-attachments/assets/d022bad8-6425-4917-8ef4-c841b1418f9e)
![5915877177893702035](https://github.com/user-attachments/assets/56869b91-c856-478b-a91b-bb151347468a)
![5915877177893702032](https://github.com/user-attachments/assets/af98f37d-4155-4e28-84b0-058e891f6ce4)



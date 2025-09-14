# eCommerce Mobile App

A Flutter-based eCommerce mobile application built using Clean Architecture principles and Test-Driven Development (TDD) practices.

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles, which provides a way to organize code for better separation of concerns and maintainability. The architecture is divided into layers:

### Contracts and Data Sources

The app implements proper contracts and repository dependencies:

- **ProductRemoteDataSource**: Contract for remote API operations
- **ProductLocalDataSource**: Contract for local storage operations  
- **NetworkInfo**: Contract for network connectivity checks
- **ProductRepository**: Contract defining all repository methods

### Data Source Implementations

- **ProductRemoteDataSourceImpl**: Simulates remote API calls
- **ProductLocalDataSourceImpl**: Simulates local storage operations
- **NetworkInfoImpl**: Simulates network connectivity checks

### Project Structure

```
lib/
├── core/                           # Shared core components
│   ├── error/                     # Error handling logic
│   │   └── failures.dart
│   ├── entities/                  # Base entities
│   │   └── base_entity.dart
│   └── network/                   # Network contracts
│       ├── network_info.dart
│       └── network_info_impl.dart
├── features/                      # Feature-specific modules
│   └── product/                   # Product feature module
│       ├── domain/                # Business logic layer
│       │   ├── entities/          # Core business objects
│       │   │   └── product.dart
│       │   ├── repositories/      # Repository interfaces
│       │   │   └── product_repository.dart
│       │   └── usecases/         # Business use cases
│       │       ├── insert_product.dart
│       │       ├── update_product.dart
│       │       ├── delete_product.dart
│       │       ├── get_product.dart
│       │       ├── get_products.dart
│       │       └── search_products.dart
│       └── data/                  # Data layer
│           ├── models/            # Data models
│           │   └── product_model.dart
│           ├── datasources/       # Data source contracts & implementations
│           │   ├── product_remote_data_source.dart
│           │   ├── product_remote_data_source_impl.dart
│           │   ├── product_local_data_source.dart
│           │   └── product_local_data_source_impl.dart
│           ├── repositories/      # Repository implementations
│           │   └── product_repository_impl.dart
│           └── services/          # Data services
│               └── product_service.dart
├── pages/                         # UI layer (Presentation)
│   ├── Home_page.dart
│   ├── Add_product.dart
│   ├── edit_product.dart
│   ├── search.dart
│   └── view.dart
├── utils/                         # Utility classes
│   ├── product.dart              # Legacy product model
│   └── product_card.dart
└── main.dart                      # App entry point
```

## 📊 Data Flow

### 1. Domain Layer (Core Business Logic)
- **Entities**: Pure business objects (e.g., `Product`)
- **Use Cases**: Business operations (CRUD operations)
- **Repository Interfaces**: Abstract data operations

### 2. Data Layer (Data Management)
- **Models**: Data transfer objects with JSON conversion
- **Repository Implementations**: Concrete data operations
- **Services**: Orchestrate data operations

### 3. Presentation Layer (UI)
- **Pages**: User interface components
- **Widgets**: Reusable UI components

## 🔄 CRUD Operations Flow

### Create (Insert) Product
1. UI calls `ProductService.insertProduct()`
2. Service calls `InsertProduct` use case
3. Use case calls `ProductRepository.insertProduct()`
4. Repository implementation stores the data
5. Success/error response flows back to UI

### Read (Get) Product
1. UI calls `ProductService.getProduct()`
2. Service calls `GetProduct` use case
3. Use case calls `ProductRepository.getProduct()`
4. Repository returns `ProductModel`
5. Model converts to `Product` entity
6. UI displays the product

### Update Product
1. UI navigates to `EditProduct` page
2. User modifies product data
3. UI calls `ProductService.updateProduct()`
4. Service calls `UpdateProduct` use case
5. Use case calls `ProductRepository.updateProduct()`
6. Repository updates the data
7. Success/error response flows back to UI

### Delete Product
1. UI shows confirmation dialog
2. User confirms deletion
3. UI calls `ProductService.deleteProduct()`
4. Service calls `DeleteProduct` use case
5. Use case calls `ProductRepository.deleteProduct()`
6. Repository removes the data
7. UI navigates back with success message

## 🧪 Testing

The project includes comprehensive unit tests following TDD principles:

### Test Structure
```
test/
├── features/
│   └── product/
│       ├── domain/
│       │   └── usecases/
│       │       └── insert_product_test.dart
│       └── data/
│           └── models/
│               └── product_model_test.dart
```

### Running Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/features/product/data/models/product_model_test.dart

# Run tests with coverage
flutter test --coverage
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code

### Installation
1. Clone the repository
2. Navigate to the project directory
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## 📱 Features

### Product Management
- **Add Products**: Create new products with images and details
- **View Products**: Browse products with detailed information
- **Update Products**: Edit existing product information
- **Delete Products**: Remove products with confirmation
- **Search Products**: Find products by name or category

### Clean Architecture Benefits
- **Separation of Concerns**: Each layer has a specific responsibility
- **Testability**: Business logic is isolated and easily testable
- **Maintainability**: Code is organized and easy to understand
- **Scalability**: Easy to add new features and modify existing ones
- **Dependency Inversion**: High-level modules don't depend on low-level modules

## 🔧 Error Handling

The app implements comprehensive error handling:

- **ServerFailure**: API/server-related errors
- **CacheFailure**: Local storage errors
- **NetworkFailure**: Network connectivity issues
- **ValidationFailure**: Input validation errors

## 📝 Code Quality

### Best Practices
- **Clean Code**: Meaningful variable and function names
- **SOLID Principles**: Single responsibility, open/closed, etc.
- **Dependency Injection**: Loose coupling between components
- **Error Handling**: Proper exception handling throughout
- **Documentation**: Clear comments and documentation

### Naming Conventions
- **Files**: snake_case (e.g., `product_model.dart`)
- **Classes**: PascalCase (e.g., `ProductModel`)
- **Variables**: camelCase (e.g., `productName`)
- **Constants**: SCREAMING_SNAKE_CASE (e.g., `MAX_PRICE`)

## 🔄 Migration from Legacy Code

The app maintains backward compatibility with the existing `utils/product.dart` while implementing Clean Architecture:

1. **Legacy Support**: Old product model still works
2. **Gradual Migration**: New features use Clean Architecture
3. **Data Conversion**: Automatic conversion between old and new models

## 📈 Future Enhancements

- **Database Integration**: Replace in-memory storage with SQLite/Hive
- **API Integration**: Connect to backend services
- **State Management**: Implement Bloc/Provider for state management
- **Authentication**: Add user authentication and authorization
- **Payment Integration**: Integrate payment gateways
- **Push Notifications**: Add real-time notifications

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Follow Clean Architecture principles
4. Write tests for new features
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

For support and questions, please open an issue in the repository or contact the development team.

---

**Built with ❤️ using Flutter and Clean Architecture**

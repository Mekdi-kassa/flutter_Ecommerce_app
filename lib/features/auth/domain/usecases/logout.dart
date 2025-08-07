import '../repositories/auth_repository.dart';

class Logout {
  final AuthRepository repository;
  Logout(this.repository);

  Future<void> call() {
    return repository.logout();
  }
}
import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class SignUp {
  final AuthRepository repository;
  SignUp(this.repository);

  Future<User> call({required String name, required String email, required String password}) {
    return repository.signUp(name: name, email: email, password: password);
  }
}
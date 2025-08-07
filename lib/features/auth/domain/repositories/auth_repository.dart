import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> signUp({required String name, required String email, required String password});
  Future<User> login({required String email, required String password});
  Future<void> logout();
  Future<User?> getCurrentUser();
  Future<bool> isLoggedIn();
}
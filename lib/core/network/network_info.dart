import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  /// Checks if the device is connected to the internet
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}

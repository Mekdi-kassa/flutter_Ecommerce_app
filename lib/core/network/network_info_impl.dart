import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  // In a real app, this would use connectivity_plus package
  // For now, we'll simulate network connectivity
  
  bool _isConnected = true; // Simulate connected by default

  @override
  Future<bool> get isConnected async {
    // Simulate network check delay
    await Future.delayed(Duration(milliseconds: 50));
    return _isConnected;
  }

  // Method to simulate network state changes (for testing)
  void setConnected(bool connected) {
    _isConnected = connected;
  }

  // Method to simulate network failure
  void simulateNetworkFailure() {
    _isConnected = false;
  }

  // Method to simulate network recovery
  void simulateNetworkRecovery() {
    _isConnected = true;
  }
} 
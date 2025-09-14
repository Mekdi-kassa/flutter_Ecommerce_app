// Base entity class for all entities in the application
abstract class BaseEntity {
  final String id;
  
  const BaseEntity({required this.id});
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BaseEntity && other.id == id;
  }
  
  @override
  int get hashCode => id.hashCode;
} 
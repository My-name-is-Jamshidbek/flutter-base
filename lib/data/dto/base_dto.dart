/// Base class for Data Transfer Objects.
///
/// DTOs are used to transfer data between layers (API -> Repository -> Domain).
/// Extend this class and implement fromJson/toJson for each DTO.
abstract class BaseDto {
  const BaseDto();

  /// Convert DTO to JSON map.
  Map<String, dynamic> toJson();
}

/// Example DTO implementation.
/// 
/// ```dart
/// class UserDto extends BaseDto {
///   final int id;
///   final String name;
///   final String email;
/// 
///   const UserDto({
///     required this.id,
///     required this.name,
///     required this.email,
///   });
/// 
///   factory UserDto.fromJson(Map<String, dynamic> json) {
///     return UserDto(
///       id: json['id'] as int,
///       name: json['name'] as String,
///       email: json['email'] as String,
///     );
///   }
/// 
///   @override
///   Map<String, dynamic> toJson() => {
///     'id': id,
///     'name': name,
///     'email': email,
///   };
/// }
/// ```

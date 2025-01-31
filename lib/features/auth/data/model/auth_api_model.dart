import 'package:equatable/equatable.dart';
import 'package:food_hub/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: 'userId')
  final String? userId;
  final String name;
  final String email;
  final String password;
  final String phone;

  const AuthApiModel({
    this.userId,
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  factory AuthApiModel.fromEntity(AuthEntity entity) => AuthApiModel(
        userId: entity.userId,
        email: entity.email,
        name: entity.name,
        phone: entity.phone,
        password: entity.password,
      );
  AuthEntity toEntity() => AuthEntity(
        userId: userId,
        email: email,
        name: name,
        phone: phone,
        password: password,
      );

  @override
  List<Object?> get props => [userId, name, password, email, phone];
}

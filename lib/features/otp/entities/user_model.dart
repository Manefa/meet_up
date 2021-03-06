import 'package:equatable/equatable.dart';
import 'package:meet_up/features/otp/models/user_entity.dart';


class UserApp extends Equatable {
  final String userId;
  final String userName;
  final String phoneNum;

  UserApp({this.userId, this.userName, this.phoneNum});

  @override
  // instead of doing super for equatable, we are doing this.
  List<Object> get props => [this.userId, this.userName, this.phoneNum];

  /// toEntity - This method converts the User POJO to an entity object
  /// The entity class has further methods to convert the POJO to datastore related objects
  UserEntity toEntity() {
    return UserEntity(userId: this.userId, userName: this.userName, phoneNum: this.phoneNum);
  }

  /// fromEntity - This method creates the POJO back from the entity object
  static UserApp fromEntity(UserEntity entity) {
    return UserApp(userId: entity.userId, userName: entity.userName, phoneNum: entity.phoneNum);
  }
}
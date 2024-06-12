import '../entities/entities.dart';

class MyUser{
  String userId;
  String email;
  String name;
  bool isAdmin;
  bool hasActiveCart;

  MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.isAdmin,
    required this.hasActiveCart});

  static final empty = MyUser(
      userId: '',
      email: '',
      name: '',
      isAdmin: false,
      hasActiveCart: false
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
        userId: userId,
        email: email,
        name: name,
        isAdmin: isAdmin,
        hasActiveCart: hasActiveCart
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userId: entity.userId,
        email: entity.email,
        name: entity.name,
        isAdmin: entity.isAdmin,
        hasActiveCart: entity.hasActiveCart
    );
  }

  @override
  String toString(){
    return 'MyUser: $userId, $name, $email,$isAdmin, $hasActiveCart';
  }
}
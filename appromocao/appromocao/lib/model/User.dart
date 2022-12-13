enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  User({this.type, this.senha, this.id, this.name, this.email}
      // {
      // required this.id,
      // required this.name,
      // required this.email,}

      );
  String? id;
  String? name;
  String? email;
  String? senha;
  UserType? type;

  @override
  String toString() {
    return 'User{id:$id  name: $name, email: $email, password: $senha, type: $type, }';
  }
}

// enum UserType { PARTICULAR, PROFISSIONAL }

// class User {
//   User({this.name, this.email, this.senha, this.type = UserType.PARTICULAR});
//   late String? name;
//   late String? email;
//   late String? senha;
//   late UserType type;
//   // ignore: unnecessary_new

// }

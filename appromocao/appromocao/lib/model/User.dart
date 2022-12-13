enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  User({
    required this.name,
    required this.email,
    required this.senha,
    this.type = UserType.PARTICULAR,
    //this.createdAt,
  });
  String name;
  String email;
  String senha;
  UserType type;
  //DateTime createdAt;

  @override
  String toString() {
    return 'User{id:  name: $name, email: $email, password: $senha, type: $type, }';
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

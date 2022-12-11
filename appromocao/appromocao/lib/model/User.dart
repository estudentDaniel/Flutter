enum UserType { PARTICULAR, PROFISSIONAL }

class User {
  User({this.name, this.email, this.senha, this.type = UserType.PARTICULAR});
  late String? name;
  late String? email;
  late String? senha;
  late UserType type;
  // ignore: unnecessary_new

}

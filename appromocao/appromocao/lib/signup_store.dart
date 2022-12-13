// ignore_for_file: library_private_types_in_public_api

import 'package:appromocao/bancoContoller.dart';
import 'package:appromocao/model/User.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  @observable
  String name = 'daniel';

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 2;
  String get nameError {
    if (name == null || nameValid)
      return 'null';
    else if (name.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }

  @observable
  String email = 'daniel';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null;
  String get emailError {
    if (email == null || emailValid)
      return 'null';
    else if (email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-mail inválido';
  }

  @observable
  String senha = 'daniel';

  @action
  void setPass1(String value) => senha = value;

  @computed
  bool get pass1Valid => senha != null && senha.length >= 2;
  String get pass1Error {
    if (senha == null || pass1Valid)
      return 'null';
    else if (senha.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha muito curta';
  }

  @observable
  String senha2 = 'daniel';

  @action
  void setPass2(String value) => senha2 = value;

  @computed
  bool get pass2Valid => senha2 != null && senha2 == senha2;
  String get pass2Error {
    if (senha2 == null || pass2Valid)
      return 'null';
    else
      return 'Senhas não coincidem';
  }

  @computed
  bool get isFormValid => nameValid && emailValid && pass1Valid && pass2Valid;

  @computed
  get signUpPressed => (isFormValid && !loading) ? _signUp : 'esta aqui';

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  Future<void> _signUp() async {
    loading = true;

    final user = User(name: name, email: email, senha: senha);

    final resultUser = await bancoContoller().signUp(user);
    //GetIt.I<UserManagerStore>().setUser(resultUser);

    loading = false;
  }
}

// ignore_for_file: library_private_types_in_public_api

// import 'package:appromocao/bancoContoller.dart';
// import 'package:appromocao/model/User.dart';
// import 'package:mobx/mobx.dart';

// part 'signup_store.g.dart';

// class SignupStore = _SignupStore with _$SignupStore;

// abstract class _SignupStore with Store {
//   @observable
//   String name = '';

//   @action
//   void setName(String value) => name = value;

//   @computed
//   String get nameError {
//     if (name == null) {
//       return 'Nome invalido';
//     } else {
//       return 'Nome valido';
//     }
//   }

//   @observable
//   String email = '';

//   @action
//   void setemail(String value) => email = value;

//   @computed
//   String get emailError {
//     if (email == null) {
//       return 'email invalido';
//     } else {
//       return 'Nome valido';
//     }
//   }

//   @observable
//   String senha = '';

//   @action
//   void setSenha(String value) => senha = value;

//   @computed
//   //bool isSenha(String value) => senha = value;

//   String get senhaError {
//     if (senha == null) {
//       return 'Campo de invalido';
//     } else {
//       return 'senha valido';
//     }
//   }

//   @observable
//   late String senha2;

//   @action
//   void setSenha2(String value) => senha2 = value;

//   @computed
//   bool isSenha2(String value) => senha2 != value;

//   String get senhaError2 {
//     if (senha == null) {
//       return 'Campo de invalido';
//     } else {
//       return 'senha valido';
//     }
//   }

//   @computed
//   bool get isFormularioValdo => true;

//   @computed
//   void Function()? get signupPressed =>
//       isFormularioValdo ? _signup : null; //lhar depois

//   @observable
//   bool loading = false;

//   @action
//   Future<void> _signup() async {
//     loading = true;
//     final user = new User(name: name, email: email, senha: senha);
//     await bancoContoller().signUp(user);
//   }
// }

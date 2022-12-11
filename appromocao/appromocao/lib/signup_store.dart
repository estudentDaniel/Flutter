// ignore_for_file: library_private_types_in_public_api

import 'package:appromocao/bancoContoller.dart';
import 'package:appromocao/model/User.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @computed
  String get nameError {
    if (name == null) {
      return 'Nome invalido';
    } else if (name.isEmpty) {
      return "campor obrigatorio";
    } else {
      return 'Nome valido';
    }
  }

  @observable
  String email = '';

  @action
  void setemail(String value) => email = value;

  @computed
  String get emailError {
    if (email == null) {
      return 'Nome invalido';
    } else if (email.isEmpty) {
      return "campor obrigatorio";
    } else {
      return 'Nome valido';
    }
  }

  @observable
  late String senha;

  @action
  void setSenha(String value) => senha = value;

  @computed
  bool isSenha(String value) => senha != value;

  String get senhaError {
    if (isSenha == null) {
      return 'Campo de invalido';
    } else {
      return 'senha valido';
    }
  }

  @observable
  late String senha2;

  @action
  void setSenha2(String value) => senha2 = value;

  @computed
  bool isSenha2(String value) => senha2 != value;

  String get senhaError2 {
    if (isSenha == null) {
      return 'Campo de invalido';
    } else {
      return 'senha valido';
    }
  }

  @computed
  bool get isFormularioValdo => name != null;

  @computed
  void Function()? get signupPressed =>
      isFormularioValdo ? _signup : null; //lhar depois

  @observable
  bool loading = false;

  @action
  Future<void> _signup() async {
    loading = true;
    final user = new User(name: name, email: email, senha: senha);
    await bancoContoller().signUp(user);
    await Future.delayed(const Duration(seconds: 3));
  }
}

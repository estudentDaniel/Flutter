import 'package:appromocao/chave.dart';
import 'package:appromocao/model/User.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class bancoContoller {
  Future<void> signUp(User user) async {
    final parseUser = ParseUser(
      user.email,
      user.senha,
      user.email,
    );
    parseUser.set<String?>(keyName, user.name);
    parseUser.set(KeyUserType, user.type.index);

    // await parseUser.signUp();
    await parseUser.save();
  }
}

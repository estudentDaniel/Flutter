import 'package:appromocao/chave.dart';
import 'package:appromocao/model/User.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class bancoContoller {
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.senha, user.email);

    // parseUser.set<String?>(keyName, user.name!);

    parseUser.set(KeyUserType, user.type!.index);

    User mapParseUser(ParseUser parseUser) {
      return User(
          id: parseUser.objectId,
          name: parseUser.get(keyName),
          email: parseUser.get(keyEmail),
          type: UserType.values[parseUser.get(KeyUserType)]);
    }

    final response = await parseUser.signUp();
    if (response.success) {
      return mapParseUser(response.result);
    } else {
      return Future.error(ParseError(code: 404));
    }
  }
}
//import 'package:appromocao/chave.dart';
// import 'package:appromocao/model/User.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

// class bancoContoller {
//   Future<void> signUp(User user) async {

//     final parseUser = ParseUser(
//       user.email,
//       user.senha,
//       user.email,
//     );
//     parseUser.set<String?>(keyName, user.name);
//     parseUser.set(KeyUserType, user.type.index);

    
//     await parseUser.signUp();
//   }
// }

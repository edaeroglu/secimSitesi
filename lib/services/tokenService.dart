import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class TokenService {
  String singJWT({required String mail}) {
    final jwt = JWT(
      {
        'mail': mail,
      },
    );

    // Sign it (default with HS256 algorithm)
    var token = jwt.sign(SecretKey('cokGizliAnahtarFlutter'));
    return token;
  }
}

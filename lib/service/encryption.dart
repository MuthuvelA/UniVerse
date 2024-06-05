import 'package:encrypt/encrypt.dart';
import 'package:universe/component/model/credentials.dart';

String encryptData(String data) {
  final keyString = userCredentials.get_key();
  // print('Key from dotenv: $keyString');

  final key = Key.fromUtf8(keyString!);
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(key));

  final encrypted = encrypter.encrypt(data, iv: iv);

  print(encrypted.base64);
  return encrypted.base64;
}


String decryptData(String data) {
  final keyString = userCredentials.get_key();
  // print('Key from dotenv: $keyString');

  final key = Key.fromUtf8(keyString!);
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(key));

  final encrypted = Encrypted.fromBase64(data);
  final decrypted = encrypter.decrypt(encrypted, iv: iv);

  return decrypted;
}


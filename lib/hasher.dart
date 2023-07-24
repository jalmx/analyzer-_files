import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart' as crypto;

enum Hashes {
  sha256,
  md5,
}

String getMD5(String s) {
  return crypto.md5.convert(utf8.encode(s)).toString();
}

/// return the hash SHA256 from file
Future<String> getHashOfFile256(String path) => File(path)
    .openRead()
    .transform(crypto.sha256)
    .first
    .then(((value) => value.toString()));

/// return the hash md5 from file
Future<String> getHashOfFileMD5(String path) => File(path)
    .openRead()
    .transform(crypto.md5)
    .first
    .then(((value) => value.toString()));

import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart' as crypto;

enum Hashes {
  sha256,
  md5,
}

/// Documentation for getMD5
/// > * _`@param: [String]`_ - s: Is a string to generate a has 
/// `MD5`
/// 
/// > _`@returns: [String]`_: Return the hash `md5` from string
String getMD5(String s) {
  return crypto.md5.convert(utf8.encode(s)).toString();
}

/// Documentation for [getHashOfFile256]
/// > * _`@param: [String]`_ - path: This is the path from
///  file, with hash `SHA256`
///
/// > _`@returns: [String]`_ return the hash `SHA256` from file
///
Future<String> getHashOfFile256(String path) => File(path)
    .openRead()
    .transform(crypto.sha256)
    .first
    .then(((value) => value.toString()));

/// Documentation for [getHashOfFileMD5]
/// > * _`@param: [String]`_ - path: 
///  This is the path from
///  file, with hash `MD5`
/// return the hash `md5` from file
/// 
/// > _`@returns: [String]`_ return the hash `MD5` from file
///
Future<String> getHashOfFileMD5(String path) => File(path)
    .openRead()
    .transform(crypto.md5)
    .first
    .then(((value) => value.toString()));

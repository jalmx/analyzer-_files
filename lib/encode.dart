import 'dart:io';
import 'package:crypto/crypto.dart' as crypto;

// return the hash SHA256 from file 
Future<String> getHashOfFile256(String path) =>
    File(path).openRead().transform(crypto.sha256).first.then(((value) => value.toString()));

// return the hash md5 from file 
Future<String> getHashOfFileMD5(String path) =>
    File(path).openRead().transform(crypto.md5).first.then(((value) => value.toString()));


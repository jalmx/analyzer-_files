import 'dart:io';

import 'package:analyzer_file/hasher.dart';

void main(List<String> args) {
  var file1 = File("path");
}

class Comparator {
  Comparator._();

  static Future<bool> isEqual(
      {required pathFileOne,
      required String pathFileTwo,
      Hashes hash = Hashes.sha256}) async {
    // if (Directory(pathFileOne) is Directory ||
    //     Directory(pathFileTwo) is Directory) {
    //   throw Exception("Error: just comparate files");
    // }
    Future<String> Function(String) function =
        hash == Hashes.sha256 ? getHashOfFile256 : getHashOfFileMD5;

    String one = await function(pathFileOne);
    String two = await function(pathFileTwo);

    // print("Hashes: $one <-> $two");
    bool result = one == two;
    return result;
  }
}

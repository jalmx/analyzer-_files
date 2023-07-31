import 'package:analyzer_file/hasher.dart';

/// Documentation for class [Comparator]
/// 
/// The constructor is private, you don't need to create a instance
/// 
/// Just to invocation method [isEqual]
/// to compare two `hash` if are equal 
/// 
class Comparator {
  Comparator._();

  static Future<bool> isEqual(
      {required pathFileOne,
      required String pathFileTwo,
      Hashes hash = Hashes.sha256}) async {

    Future<String> Function(String) function =
        hash == Hashes.sha256 ? getHashOfFile256 : getHashOfFileMD5;

    String one = await function(pathFileOne);
    String two = await function(pathFileTwo);

    bool result = one == two;
    return result;
  }
}

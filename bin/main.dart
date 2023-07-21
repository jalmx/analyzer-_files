import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:analyzer_file/cli.dart';
import 'package:analyzer_file/encode.dart';
import 'package:args/args.dart';

void main(List<String> arguments) async {
  final parse = ArgParser();
  parse.addCommand("hola");

  try {
    final pathDir = arguments.isEmpty
        ? path.absolute(Directory.current.path)
        : arguments[0];
    print(await getHashOfFile256(pathDir));
    exit(0);
  } catch (e) {
    print("Invalidate input");
    print(CLI.messageUse());
    print(e);
    exit(1);
  }
}

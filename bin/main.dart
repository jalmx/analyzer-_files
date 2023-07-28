import 'dart:io';

import 'package:analyzer_file/cli.dart';
import 'package:analyzer_file/search.dart';
import 'package:analyzer_file/comparator.dart';
import 'package:analyzer_file/hasher.dart';

void main(List<String> arguments) async {
  try {
    CLI cli = CLI(argumentsRaw: arguments);

    if (cli.getParameter()["help"]) {
      print(cli.usage());
      exit(0);
    }

    var data = cli.getParameter();
    print("Parameters: $data");
    
    var search = SearchFile();

    var files = await search.getFiles(
        path: data[CLI.path],
        recursive: data[CLI.recursive],
        filesToExclude: data[CLI.exclude]);

    for (final fileMain in files) {
      for (final fileSecond in files) {
        if (!(fileMain.path == fileSecond.path)) {
          List<String> elements = [fileMain.path, fileSecond.path];
          elements.sort();

          bool result = await Comparator.isEqual(
              pathFileOne: elements[0], pathFileTwo: elements[1]);
          print(getMD5("${elements[0]}${elements[1]}"));

          if (result) {
            stdout.write(getMD5("${elements[0]}${elements[1]} -"));
            print(" el archivo ${elements[0]} <-> ${elements[1]}");
          }
        }
      }
    }
    print("");
    print("Done :D");

    
    exit(0);
  } catch (e) {
    exit(1);
  }
}

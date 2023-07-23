import 'dart:io';

import 'package:analyzer_file/cli.dart';
import 'package:analyzer_file/search.dart';

void main(List<String> arguments) async {
  try {
    CLI cli = CLI(argumentsRaw: arguments);

    var data = cli.getParameter();
    print(data);

    print("-----------------------");
    var search = SearchFile();

    var allFiles = await search.getAllElementsMap(
        path: data[CLI.path],
        recursive: data[CLI.recursive],
        filesToExclude: data[CLI.exclude]);

    print("Los archivos en main: ${allFiles}");
 
    if (cli.getParameter()["help"]) {
      print(cli.usage());
    }
    exit(0);
  } catch (e) {
    exit(1);
  }
}

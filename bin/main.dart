import 'dart:io';

import 'package:analyzer_file/cli.dart';

void main(List<String> arguments) async {
  try {
    CLI cli = CLI(argumentsRaw: arguments);
    //print(cli.getParameter());

    if (cli.getParameter()["help"]) {
      print(cli.usage());
    }
    exit(0);
  } catch (e) {
    
    exit(1);
  }
}

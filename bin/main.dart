import 'dart:io';

import 'package:analyzer_file/cli.dart';
import 'package:analyzer_file/encode.dart';
import 'package:args/args.dart';

void main(List<String> arguments) async{
  final parse = ArgParser();
  parse.addCommand("hola");

  if(arguments.isNotEmpty){
    
    print(await getHashOfFileMD5(arguments[0]));
    exit(0);
  }

  print("NO PATH");
  print(CLI.messageUse());
  exit(1);
}
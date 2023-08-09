// ignore_for_file: library_prefixes

import 'dart:io';

import 'package:analyzer_file/cli.dart';
import 'package:analyzer_file/info.dart';
import 'package:analyzer_file/element.dart';
import 'package:analyzer_file/save_file.dart';
import 'package:analyzer_file/search.dart';
import 'package:analyzer_file/comparator.dart';
import 'package:analyzer_file/hasher.dart';
import 'package:analyzer_file/version.dart';
import 'package:path/path.dart' as Path;

void main(List<String> arguments) async {
  try {
    CLI cli = CLI(argumentsRaw: arguments);

    if (cli.getParameter()["help"]) {
      print(cli.usage());
      printInformation();
      exit(0);
    }

    var data = cli.getParameter();

    var search = SearchFile();

    var files = await search.getFiles(
        path: data[CLI.path],
        recursive: data[CLI.recursive],
        filesToExclude: data[CLI.exclude]);
    double count = 1.0;
    Map<String, Element> rows = {};
    print("start");
    for (final fileMain in files) {
      for (final fileSecond in files) {
        if (!(fileMain.path == fileSecond.path)) {
          List<String> elements = [fileMain.path, fileSecond.path];
          elements.sort();

          bool equal = await Comparator.isEqual(
              pathFileOne: elements[0], pathFileTwo: elements[1]);

          final idHash = getMD5("${elements[0]}${elements[1]}");

          if (equal && data[CLI.output] == CLI.OUTPUT_STDOUT) {
            stdout.write(getMD5("hash: ${elements[0]}${elements[1]} -"));
            print(" are the same files: ${elements[0]} <-> ${elements[1]}");
          }
          count++;
          if (!(data[CLI.output] == CLI.OUTPUT_STDOUT)) {
            stdout.write("\rElements analyzed: ${(count++ ~/ 2 == 0 ? 1 : count++ ~/ 2)}");
            rows[idHash] = Element(
                idHash: idHash,
                firstElementPath: elements[0],
                firstElementName: elements[0].split(Path.separator).last,
                secondElementPath: elements[1],
                secondElementName: elements[1].split(Path.separator).last,
                equal: equal);
          }
        }
      }
    }

    if (data[CLI.output] == CLI.OUTPUT_CSV) {
      final String pathSaved = await saveCSV(null, rowsMap: rows);
      print("\nCSV saved on ${Path.absolute(pathSaved)}");
      print("Rows total: ${rows.length}");
    } else if (data[CLI.output] == CLI.OUTPUT_JSON) {
      final String pathSaved = await saveJSON(null, rowsMap: rows);
      print("\nJSON file saved on: ${Path.absolute(pathSaved)}");
      print("JSON's: ${rows.length}");
    } else if (data[CLI.output] == CLI.OUTPUT_DB) {
      print("yet without implement :(");
    } else {
      print("\rElements analyzed: ${(count++ ~/ 2 == 0 ? 1 : count++ ~/ 2)}");
    }
    print("Done");
    exit(0);
  } catch (e) {
    print("Error");
    print("Use analyzer --help to know more");
    exit(1);
  }
}

void printInformation() {
  print("");
  print(VERSION);
  print(REPOSITORY);
  print(INFO);
}

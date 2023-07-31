import 'package:analyzer_file/csv.dart';
import 'package:analyzer_file/to_json.dart';

import 'element.dart';

import 'dart:convert';

/// Documentation for [saveCSV]
/// > * _`@param: [String]`_ - paramName name file to save
///
/// > _`@returns: [T]`_
Future<String> saveCSV(String? nameFile,
    {required Map<String, Element> rowsMap}) async {
  final myCSV = CSV();

  if (nameFile != null) {
    myCSV.pathToSave = nameFile;
  }
  List<Element> rows = [];

  for (final key in rowsMap.keys) {
    rows.add(rowsMap[key]!);
  }
  await myCSV.saveContent(rows);

  return myCSV.pathToSave;
}

Future<String> saveJSON(String? nameFile,
    {required Map<String, Element> rowsMap}) async {
  final myJson = JsonFile();

  if (nameFile != null) {
    myJson.pathToSave = nameFile;
  }

  final elements = <String>[];
  for (final key in rowsMap.keys) {
    elements.add(JsonEncoder.withIndent("\t").convert(rowsMap[key]?.toJSON()));
  }

  await myJson.saveContent(elements.toString());

  return myJson.pathToSave;
}

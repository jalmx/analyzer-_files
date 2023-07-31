import 'package:analyzer_file/csv.dart';

import 'element.dart';

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

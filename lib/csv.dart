import 'dart:io';
import 'dart:math';

import 'package:analyzer_file/row_csv.dart';

// ignore_for_file: non_constant_identifier_names

/// For test
void main(List<String> args) {
  final CSV my_csv = CSV();

  List<RowCSV> rows = [];

  for (int x = 0; x < 200; x++) {
    rows.add(RowCSV(
        id: "${Random().nextInt(500)}",
        idHash: "${Random().nextInt(1000)}ABC",
        firstElementPath: "path uno${Random().nextInt(500)}",
        firstElementName: "elemennto ${Random().nextInt(500)}",
        secondElementPath: "path dos ${Random().nextInt(500)}",
        secondElementName: "elemento ${Random().nextInt(500)}"));
  }
  
  my_csv.saveTitle();
  my_csv.saveContent(rows);
}

class CSV {
  String _pathCsv = "data.csv";
  List<String> titles = [];

  CSV._();

  static final CSV _instance = CSV._();

  factory CSV() => _instance;

  set pathToSave(String name) {
    _pathCsv = "$name.csv";
  }

  String get pathToSave => _pathCsv;

  Future<bool> _save(String content, {bool overwrite = false}) async {
    final csv = File(pathToSave);

    await csv.writeAsString(content,
        mode: overwrite ? FileMode.write : FileMode.writeOnlyAppend);
    return true;
  }

/// Documentation for _listToString
/// parse the list to String, clear brackets []
///
  String _listToString(RowCSV row) {
    String content = row.toList.toString().replaceRange(0, 1, "");
    return content.replaceRange(content.length - 1, null, "");
  }

/// Documentation for saveContent
/// > * _`@param: [List<RowCSV>]`_ - rows:
///
/// > _`@returns: [bool]`_
  Future<bool> saveContent(List<RowCSV> rows) async {
    String content = "";
    for (final row in rows) {
      content += "${_listToString(row)}\n";
    }
    await _save(content);
    return true;
  }

  Future<bool> saveTitle({RowCSV? row}) async {
    row ??= RowCSV(
        id: RowCSV.ID,
        idHash: RowCSV.ID_HASH,
        firstElementPath: RowCSV.FIRST_PATH,
        firstElementName: RowCSV.FIRST_NAME,
        secondElementPath: RowCSV.SECOND_PATH,
        secondElementName: RowCSV.SECOND_NAME);

    try {
      String content = _listToString(row);
      await _save("$content\n");
      return true;
    } catch (_) {
      return false;
    }
  }
}

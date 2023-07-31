import 'dart:io';
import 'dart:math';

import 'package:analyzer_file/element.dart';

// ignore_for_file: non_constant_identifier_names

/// For test
void main(List<String> args) {
  final CSV my_csv = CSV();

  List<Element> rows = [];

  for (int x = 0; x < 200; x++) {
    rows.add(Element(
        id:"${Random().nextInt(500)}",
        idHash: "${Random().nextInt(1000)}ABC",
        firstElementPath: "path uno${Random().nextInt(500)}",
        firstElementName: "elemento ${Random().nextInt(500)}",
        secondElementPath: "path dos ${Random().nextInt(500)}",
        secondElementName: "elemento ${Random().nextInt(500)}"));
  }

  
  my_csv.saveContent(rows);
}

/// Documentation for class [CSV]
/// 
/// Class to manage file csv to save the content
/// Example: 
/// 
/// ```dart
/// final CSV my_csv = CSV();
///
///  List<RowCSV> rows = [RowCSV.getTitleRow];
///
///  for (int x = 0; x < 200; x++) {
///    rows.add(RowCSV(
///        "${Random().nextInt(500)}",
///        idHash: "${Random().nextInt(1000)}ABC",
///        firstElementPath: "path uno${Random().nextInt(500)}",
///        firstElementName: "elemento ${Random().nextInt(500)}",
///        secondElementPath: "path dos ${Random().nextInt(500)}",
///        secondElementName: "elemento ${Random().nextInt(500)}"));
///  }
///
///  
///  my_csv.saveContent(rows);
/// ```
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

  Future<bool> _save(String content) async {
    final File file = File(pathToSave);

    await file.writeAsString(content);
    return true;
  }

  /// Documentation for [_rowCsvToString]
  /// 
  /// parse the list to format CSV file, clear brackets \[ \]
  ///
  String _rowCsvToString(Element row) {
    String content = row.toList.toString().replaceRange(0, 1, "");
    return content.replaceRange(content.length - 1, null, "");
  }

  /// Documentation for [_rowCsvToString]
  /// 
  /// parse the list to format CSV file, clear brackets \[ \]
  ///
  String _listToString(List<String> row) {
    String content = row.toString().replaceRange(0, 1, "");
    return content.replaceRange(content.length - 1, null, "");
  }

  /// Documentation for saveContent
  /// > * _`@param: [List<RowCSV>]`_ - rows: Save all list of [RosCSV]
  ///
  /// > _`@returns: [bool]`_ Return `true` if saved otherwise is false
  Future<bool> saveContent(List<Element> rows) async {
    String content = "${_listToString(Element.getTitleRow)}\n";
    for (final row in rows) {
      content += "${_rowCsvToString(row)}\n";
    }
    await _save(content);
    return true;
  }

}

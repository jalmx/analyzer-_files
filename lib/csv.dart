import 'dart:io';
import 'dart:math';

// ignore_for_file: non_constant_identifier_names

void main(List<String> args) {
  final CSV my_csv = CSV();

  List<RowCSV> rows = [];

  for (int x = 0; x < 200; x++) {
    rows.add(RowCSV(
        id: "${Random().nextInt(500)}",
        idHash: "${Random().nextInt(1000)}ABC",
        firstElementPath: "path uno${Random().nextInt(500)}",
        firstElementName: "elemnent ${Random().nextInt(500)}",
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
        mode: overwrite ? FileMode.writeOnlyAppend : FileMode.write);
    return true;
  }

  String _listToString(RowCSV row) {
    String content = row.toList.toString().replaceRange(0, 1, "");
    return content.replaceRange(content.length - 1, null, "");
  }

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

    String content = _listToString(row);
    await _save(content, overwrite: true);
    return true;
  }
}

/// class for the row of csv file
class RowCSV {
  static final String ID = "id";
  static final String ID_HASH = "id_hash";
  static final String FIRST_PATH = "first_path";
  static final String FIRST_NAME = "first_name";
  static final String SECOND_PATH = "second_path";
  static final String SECOND_NAME = "second_name";

  final String id;
  final String idHash;
  final String firstElementPath;
  final String firstElementName;
  final String secondElementPath;
  final String secondElementName;

  RowCSV({
    required this.id,
    required this.idHash,
    required this.firstElementPath,
    required this.firstElementName,
    required this.secondElementPath,
    required this.secondElementName,
  });

  List<String> get toList => [
        id,
        idHash,
        firstElementPath,
        firstElementName,
        secondElementPath,
        secondElementName
      ];

  Map<String, String> toMap() {
    return {
      ID: id,
      ID_HASH: idHash,
      FIRST_PATH: firstElementPath,
      FIRST_NAME: firstElementName,
      SECOND_PATH: secondElementPath,
      SECOND_NAME: secondElementName
    };
  }

  @override
  String toString() =>
      "$id, $idHash, $firstElementPath, $firstElementName, $secondElementPath, $secondElementName";
}

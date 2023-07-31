// ignore_for_file: non_constant_identifier_names

/// Documentation for lass RowCSV
///
/// Example
///
/// ```dart
/// rows.add(RowCSV(
///    id: "${Random().nextInt(500)}",
///    idHash: "${Random().nextInt(1000)}ABC",
///    firstElementPath: "path uno${Random().nextInt(500)}",
///    firstElementName: "elemento ${Random().nextInt(500)}",
///    secondElementPath: "path dos ${Random().nextInt(500)}",
///    secondElementName: "elemento ${Random().nextInt(500)}"));
/// ```

class Element {
  static final String ID = "id";
  static final String ID_HASH = "id_hash";
  static final String FIRST_PATH = "first_path";
  static final String FIRST_NAME = "first_name";
  static final String SECOND_PATH = "second_path";
  static final String SECOND_NAME = "second_name";
  static final String EQUAL = "are_equal";

  String id;
  final String idHash;
  final String firstElementPath;
  final String firstElementName;
  final String secondElementPath;
  final String secondElementName;
  bool equal;

  Element(
      {required this.idHash,
      required this.firstElementPath,
      required this.firstElementName,
      required this.secondElementPath,
      required this.secondElementName,
      this.equal = false,
      this.id = "-1"});

  /// Documentation for [toList]
  ///
  /// > _`@returns: [List<String>]`_ parse this class to List
  ///
  List<dynamic> get toList => [
        id,
        idHash,
        firstElementPath,
        firstElementName,
        secondElementPath,
        secondElementName,
        equal
      ];

  /// Documentation for [toMap]
  ///
  /// > _`@returns: [Map<String, String>]`_ parse this class to Map
  ///
  Map<String, dynamic> toMap() {
    return {
      ID: id,
      ID_HASH: idHash,
      FIRST_PATH: firstElementPath,
      FIRST_NAME: firstElementName,
      SECOND_PATH: secondElementPath,
      SECOND_NAME: secondElementName,
      EQUAL: equal
    };
  }

  Map<String, dynamic> toJSON() => toMap();

  /// Documentation for getTitleRow
  ///
  /// > _`@returns: [List<String>]`_ Generate the header for csv
  static List<String> get getTitleRow =>
      [ID, ID_HASH, FIRST_PATH, FIRST_NAME, SECOND_PATH, SECOND_NAME, EQUAL];

  @override
  String toString() =>
      "$id, $idHash, $firstElementPath, $firstElementName, $secondElementPath, $secondElementName, $equal";
}

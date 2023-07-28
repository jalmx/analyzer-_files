/// Documentation for lass RowCSV
///
/// Example
/// 
/// ```dart
/// rows.add(RowCSV(
///    id: "${Random().nextInt(500)}",
///    idHash: "${Random().nextInt(1000)}ABC",
///    firstElementPath: "path uno${Random().nextInt(500)}",
///    firstElementName: "elemennto ${Random().nextInt(500)}",
///    secondElementPath: "path dos ${Random().nextInt(500)}",
///    secondElementName: "elemento ${Random().nextInt(500)}"));
/// ```
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

  /// Documentation for [toList]
  /// 
  /// > _`@returns: [List<String>]`_ parse this class to List
  /// 
  List<String> get toList => [
        id,
        idHash,
        firstElementPath,
        firstElementName,
        secondElementPath,
        secondElementName
      ];

  /// Documentation for [toMap]
  /// 
  /// > _`@returns: [Map<String, String>]`_ parse this class to Map
  /// 
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

  /// Documentation for getTitleRow
  ///
  /// > _`@returns: [RowCSV]`_ Generate the header for csv
  static RowCSV get getTitleRow => RowCSV(
      id: ID,
      idHash: ID_HASH,
      firstElementPath: FIRST_PATH,
      firstElementName: FIRST_NAME,
      secondElementPath: SECOND_PATH,
      secondElementName: SECOND_NAME);

  @override
  String toString() =>
      "$id, $idHash, $firstElementPath, $firstElementName, $secondElementPath, $secondElementName";
}

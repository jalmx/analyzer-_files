
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

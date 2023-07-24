// ignore_for_file: non_constant_identifier_names

/// class for the row of csv file
class CSV {
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

  CSV(this.id, this.idHash, this.firstElementPath, this.firstElementName,
      this.secondElementPath, this.secondElementName);

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
}

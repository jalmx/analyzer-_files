import 'package:analyzer_file/cli.dart';

void main(List<String> arguments) async {
  //var results = parse.parse(arguments);

  // print(results["path"]);
  // print(results["output"]);
  // print(results["hash"]);
  // print(results["recursive"]);

  //print(results.rest.firstOrNull);

  final cli = CLI(argumentsRaw: arguments);

  print(cli.getParameter());
}

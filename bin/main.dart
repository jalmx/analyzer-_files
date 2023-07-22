import 'package:analyzer_file/cli.dart';

void main(List<String> arguments) async {
  CLI cli = CLI(argumentsRaw: arguments);

  try {
    cli = CLI(argumentsRaw: arguments);
    print(cli.getParameter());
  } catch (e) {
    cli.usage();
  }
}

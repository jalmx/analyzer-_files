import 'dart:io';

import 'package:path/path.dart' as Path;
import 'package:args/args.dart';

class CLI {
  late final List<String> _argumentsRaw;
  late final ArgParser _parse;
  late final ArgResults _results;

  static const String path = "path";
  static const String recursive = "recursive";
  static const String hash = "hash";
  static const String exclude = "exclude";
  static const String output = "output";

  CLI({required List<String> argumentsRaw}) {
    _argumentsRaw = argumentsRaw;
    _build();
    _results = _parse.parse(_argumentsRaw);
  }

  void _build() {
    _parse = ArgParser()
    ..addFlag("help", negatable: false, help: "Provide help")
      ..addOption(path,
          defaultsTo: ".",
          abbr: "p",
          help: "path to search",
          valueHelp: "/home/")
      ..addFlag(recursive,
          abbr: "r",
          defaultsTo: false,
          negatable: false,
          help: "Search into directory")
      ..addOption(hash, abbr: "h", defaultsTo: "sha256", allowed: [
        "md5",
        "sha256",
        "-all"
      ], allowedHelp: {
        "md5": "Hash MD5",
        "sha256": "Hash SHA256",
        "all": "Apply all hashes"
      })
      ..addMultiOption(exclude,
          abbr: "x",
          help: "List of folders or files to exclude in search",
          valueHelp: "node_module,.gitignore")
      ..addOption(output,
          defaultsTo: "stdout",
          abbr: "o",
          help: "Type of file to save the information",
          valueHelp: "csv",
          allowed: [
            "json",
            "csv",
            "sqlite"
          ],
          allowedHelp: {
            "json": "Save file array json",
            "csv": "Save file csv",
            "sqlite": "Save in db SQLite",
            "stdout": "Throw to terminal"
          });
  }

  String _getPath(String? mPath) {
    if (_results.rest.isNotEmpty) {
      if (mPath == ".") {
        return Directory.current.absolute.path;
      } else {
        return mPath!;
      }
    }
    return Directory.current.absolute.path;
  }

  Map<String, dynamic> getParameter() {
    return <String, dynamic>{
      path: _getPath(_results.rest.firstOrNull),
      recursive: _results[recursive],
      hash: _results[hash],
      exclude: _results[exclude] ?? _results[exclude],
      output: _results[output],
      "help": _results["help"] as bool
    };
  }

  String usage() => _parse.usage;
}

// ignore_for_file: constant_identifier_names

import 'dart:io';

/// Test this class
void main(List<String> arguments) async {
  final String pathDir = arguments.isEmpty
      ? Directory.current.path
      : Directory(arguments.first).path;

  //print(await SearchFile().getFiles(pathDir));
  print(await SearchFile().getAllElementsMap(path: pathDir, recursive: true));
}

class SearchFile {
  SearchFile();

  static const FILE = "files";
  static const DIRECTORIES = "directories";

  Future<List<File>> getFiles(String? path) async {
    final List<File> files = <File>[];

    path ??= Directory.current.path;

    final Directory dir = Directory(path);

    final listFiles = dir.list(recursive: false, followLinks: false).toList();

    for (final file in await listFiles) {
      if (file is File) {
        files.add(file);
      }
    }

    return files;
  }

  Future<List<Directory>> getDirectories({String? path, bool recursive=false}) async {
    final List<Directory> directories = <Directory>[];

    path ??= Directory.current.path;

    final Directory dir = Directory(path);

    final listFiles = dir.list(recursive: recursive, followLinks: false).toList();

    for (final directory in await listFiles) {
      if (directory is Directory) {
        directories.add(directory);
      }
    }

    return directories;
  }

  Future<List<FileSystemEntity>> getAllElements({String? path, recursive=false}) async {
    final List<FileSystemEntity> elements = <FileSystemEntity>[];

    path ??= Directory.current.path;

    final Directory dir = Directory(path);

    final listFiles = dir.list(recursive: recursive, followLinks: false).toList();

    for (final directory in await listFiles) {
      elements.add(directory);
    }

    return elements;
  }

  Future<Map<String, List<FileSystemEntity>>> getAllElementsMap(
      {String? path,recursive=false}) async {
    final Map<String, List<FileSystemEntity>> elements = {
      SearchFile.FILE: <File>[],
      SearchFile.DIRECTORIES: <Directory>[]
    };

    path ??= Directory.current.path;

    final Directory dir = Directory(path);

    final listFiles = dir.list(recursive: recursive, followLinks: false).toList();

    for (final element in await listFiles) {
      if (element is File) {
        elements[FILE]?.add(element);
      } else if (element is Directory) {
        elements[DIRECTORIES]?.add(element);
      }
    }

    return elements;
  }
}

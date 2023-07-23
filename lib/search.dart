// ignore_for_file: constant_identifier_names, library_prefixes

import 'dart:io';

import 'package:path/path.dart' as Path;

/// Test this class
void main(List<String> arguments) async {
  final String pathDir = Directory.current.path;

  List<String> listaExclude = [".gitignore", ".git", "bin"];

  print(await SearchFile()
      .getDirectories(path: pathDir, recursive: true, filesToExclude: listaExclude));
}

/// Documentation for SearchFile
/// This class get the files and directories from path
class SearchFile {
  SearchFile();

  static const FILE = "files";
  static const DIRECTORIES = "directories";

  String _getName(String path) => path.split(Path.separator).last.trim();

  bool _isToExclude(
      {required String pathFile, required List<String> toExclude}) {
    for (final name in toExclude) {
      // print("el nombre to exclude: $name");
      // print("black list $toExclude");
      // print("path $pathFile");
      // print("El nombre del archivo actual: ${_getName(pathFile)}");
      // print("para excluir :${pathFile.contains(name)}");
      // print("-----------------------------------");
      if (pathFile.contains(name)) return true;
      
    }
    return false;
  }

  Future<List<File>> getFiles(
      {String? path,
      bool recursive = false,
      List<String>? filesToExclude}) async {
    final List<File> files = [];

    filesToExclude ??= [];
    path ??= Directory.current.path;

    final Directory dir = Directory(path);

    final listFiles =
        await dir.list(recursive: recursive, followLinks: false).toList();

    //this is not fine, but work well xD
    for (final file in listFiles) {
      if (file is File) {
        if (filesToExclude.isNotEmpty &&
            !_isToExclude(pathFile: file.path, toExclude: filesToExclude)) {
          files.add(file);
        } else if (filesToExclude.isEmpty) {
          files.add(file);
        }
      }
    }

    return files;
  }

  Future<List<Directory>> getDirectories(
      {String? path,
      bool recursive = false,
      List<String>? filesToExclude}) async {
    final List<Directory> directories = <Directory>[];

    filesToExclude ??= [];
    path ??= Directory.current.path;

    final Directory dir = Directory(path);

    final listFiles =
        dir.list(recursive: recursive, followLinks: false).toList();

    for (final directory in await listFiles) {
      if (directory is Directory) {
        if (filesToExclude.isNotEmpty &&
            !_isToExclude(
                pathFile: directory.path, toExclude: filesToExclude)) {
          directories.add(directory);
        } else if (filesToExclude.isEmpty) {
          directories.add(directory);
        }
      }
    }

    return directories;
  }

  Future<List<FileSystemEntity>> getAllElements(
      {String? path, recursive = false, List<String>? filesToExclude}) async {
    final List<FileSystemEntity> elements = <FileSystemEntity>[];
    filesToExclude ??= [];
    path ??= Directory.current.path;

    final Directory dir = Directory(path);

    final listFiles =
        dir.list(recursive: recursive, followLinks: false).toList();

    for (final directory in await listFiles) {
      if (filesToExclude.isNotEmpty &&
          !_isToExclude(pathFile: directory.path, toExclude: filesToExclude)) {
        elements.add(directory);
      } else if (filesToExclude.isEmpty) {
        elements.add(directory);
      }
    }

    return elements;
  }

  Future<Map<String, List<FileSystemEntity>>> getAllElementsMap(
      {String? path, recursive = false, List<String>? filesToExclude}) async {
    final Map<String, List<FileSystemEntity>> elements = {
      SearchFile.FILE: <File>[],
      SearchFile.DIRECTORIES: <Directory>[]
    };

    path ??= Directory.current.path;
    filesToExclude ??= [];
    final Directory dir = Directory(path);

    final listFiles =
        dir.list(recursive: recursive, followLinks: false).toList();

    for (final element in await listFiles) {
      if (element is File) {
        //elements[FILE]?.add(element);
        if (filesToExclude.isNotEmpty &&
            !_isToExclude(pathFile: element.path, toExclude: filesToExclude)) {
          elements[FILE]?.add(element);
        } else if (filesToExclude.isEmpty) {
          elements[FILE]?.add(element);
        }
      } else if (element is Directory) {
        //elements[DIRECTORIES]?.add(element);
        if (filesToExclude.isNotEmpty &&
            !_isToExclude(pathFile: element.path, toExclude: filesToExclude)) {
          elements[DIRECTORIES]?.add(element);
        } else if (filesToExclude.isEmpty) {
          elements[DIRECTORIES]?.add(element);
        }
      }
    }

    return elements;
  }
}

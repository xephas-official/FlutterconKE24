// ignore_for_file: avoid_crinter

import 'dart:io';

import 'global/printer/crinter.dart';

/// lib folder
const String libFolder = 'lib';

/// name of your features folder
const String featuresFolder = '$libFolder/screens';

// reserved folders, these are served folders that come
// with the brick and should not be changed
const List<String> reservedFolders = ['app', 'global'];

// * Setup File Paths
// these are paths to the files used to set up this project
// these are used for self destruction
const List<String> setupFiles = [
  // setup file (this one)
  'lib/setup.dart',
  // commandline printer file
  'lib/global/printer/crinter.dart',
  // json file in the root directory
  '{{json_file_name}}',
];

/// Run all commands to add dependencies to your app and get it set up
Future<void> main() async {
  crinter(' -- Setting up! --\n');
  crinter('----------------------');

  // default folders
  final List<String> defaultFolders = [{{#folders}}'{{..snakeCase()}}',{{/folders}}];

  // clean up the default folders to remove reserved folders
  final List<String> cleanDefaultFolders = defaultFolders
      .where((folder) => !reservedFolders.contains(folder))
      .toList();


  // list of folders to create
  final List<String> listFolders = [{{#features}}'{{..snakeCase()}}',{{/features}}];

  // Generate all file paths
  final List<String> allFilePaths = [];

  // Add default folders
  for (final folder in cleanDefaultFolders) {
    allFilePaths.addAll(generateDefaultFilePaths(folder));
  }

  // Add custom folders
  for (final folder in listFolders) {
    allFilePaths.addAll(generateFilePaths(folder));
  }

  // First create all necessary directories
  final Set<String> directories = extractDirectories(allFilePaths);

  //* 1. Create all necessary directories
  //  to avoid creating duplicate directories
  await addFolders(directories.toList());

  //* 2. Create all necessary files in the created directories
  // Then create the files
  await addFiles(allFilePaths);

  // * 3 Add dependencies to pubspec.yaml
  await addDependencies();

  // * 4. Format all generated files
  await formatFiles();
  await fixIssues();

  // * LASTLY self destruct
  await removeSetupFiles().then((result) async {
    print('\n✓ All Set Up. Happy Coding!\n');
  });
}

/// Extract all unique directory paths from file paths
Set<String> extractDirectories(List<String> filePaths) {
  final Set<String> directories = {};

  for (final path in filePaths) {
    final lastSlashIndex = path.lastIndexOf('/');
    if (lastSlashIndex != -1) {
      directories.add(path.substring(0, lastSlashIndex));
    }
  }

  return directories;
}

/// Function to generate file paths for a folder
List<String> generateFilePaths(String folder) {
  return [
    '$featuresFolder/$folder/exporter.dart',
    '$featuresFolder/$folder/$folder.dart',
    '$featuresFolder/$folder/data/models/model.dart',
    '$featuresFolder/$folder/data/services/service.dart',
    '$featuresFolder/$folder/data/providers.dart',
    '$featuresFolder/$folder/components/component.dart',
  ];
}

/// Function to generate file paths for a default folder
List<String> generateDefaultFilePaths(String folder) {
  return [
    '$libFolder/$folder/$folder.dart',
    '$libFolder/$folder/exporter.dart',
  ];
}

/// add folders
/// this takes a list of folders to create
/// and creates them in the project
Future<void> addFolders(List<String> folders) async {
  crinter('- Adding Folders!');
  for (final folder in folders) {
    final dir = Directory(folder);
    if (dir.existsSync()) {
      crinter('✓ $folder already exists');
    } else {
      try {
        await dir.create(recursive: true).then(
              (value) => crinter('✓ $folder created successfully!'),
            );
      } catch (e) {
        crinter('Error creating $folder: $e');
      }
    }
  }
  crinter('\n');
}

/// add files
/// this takes a list of files to create
/// and creates them in the project
Future<void> addFiles(List<String> files) async {
  crinter('- Adding Files!');
  for (final file in files) {
    final newFile = File(file);
    if (newFile.existsSync()) {
      crinter('✓ $file already exists');
    } else {
      try {
        // Ensure the parent directory exists
        final parent = newFile.parent;
        if (!parent.existsSync()) {
          await parent.create(recursive: true);
        }
        await newFile.create().then(
              (value) => crinter('✓ $file created successfully!'),
            );
      } catch (e) {
        crinter('Error creating $file: $e');
      }
    }
  }
  crinter('\n');
}

// * DEPENDENCIES

/// Add dependencies to your app
Future<void> addDependencies() async {
  crinter('- Adding Dependencies!');

  // get dependencies
  final List<String> dependencies = [{{#dependencies}}'{{..snakeCase()}}',{{/dependencies}}];

  // get dev dependencies
  final List<String> devDependencies = [{{#dev_dependencies}}'dev:{{..snakeCase()}}',{{/dev_dependencies}}];

  await Process.run(
    'dart',
    [
      'pub',
      'add',
      ...dependencies,
      ...devDependencies,
    ],
  ).then((result) async {
    if (result.exitCode == 0) {
      crinter('✓ Dependencies added successfully!\n\n', isSuccess: true);
    } else {
      crinter('x Failed to add dependencies.', isError: true);
      crinter(result.stderr, isError: true);
    }
  });
}

// * MINOR FIXES & FORMATTING

/// Format generated files with dart format
Future<void> formatFiles() async {
  //* Format generated files with dart format .
  // Run `dart format` after generation.
  crinter('- Formatting all generated files');

  // command to format all generated files
  await Process.run('dart', ['format', '.']).then(
    (_) => crinter('✓ Formatting completed successfully!\n\n', isSuccess: true),
  );
}

/// Fix any issues with the generated files
Future<void> fixIssues() async {
  //* Fix any issues with the generated files
  // Run `dart format` after generation.
  crinter('- Fixing any issues with the generated files');

  // command to format all generated files
  await Process.run('dart', ['fix', '--apply'])
      .then((_) => crinter('✓ Fix successful!\n\n', isSuccess: true));
}

// * SELF DESTRUCTION

/// remove all set up files
Future<void> removeSetupFiles() async {
  crinter(' -- Removing Set Up Files! --\n');
  crinter('----------------------');

  for (final file in setupFiles) {
    await deleteFile(file);
  }

  print('----------------------');
  print(' -- Set Up Files Removed! --\n');
}

/// delete setup file
Future<void> deleteFile(String filePath) async {
  crinter('- Deleting Set Up File at $filePath!');
 
  final file = File(filePath);

  // delete this file after running the script
  try {
    await file.delete().then(
          (value) =>
              crinter('✓ File deleted successfully!\n\n', isSuccess: true),
        );
  } catch (e) {
    crinter('Error deleting file: $e', isError: true);
  }
}
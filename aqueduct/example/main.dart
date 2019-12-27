import 'dart:io';

import 'package:aqueduct/aqueduct.dart';

import 'channel.dart';

Logger logger = Logger("main");

Future main() async {
  final app = Application<SmartcoinChannel>()
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8085;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}

//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:isolate';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<String?> isolatedRun({
  required Future<String?> Function(String? input) task,
  String? input,
}) async {
  final receivePort = ReceivePort();
  final message = {
    'sendPort': receivePort.sendPort,
    'input': input,
  };
  void entryPoint(Map<String, dynamic> message) async {
    final sendPort = message['sendPort'] as SendPort;
    final input = message['input'] as String?;
    try {
      final output = await task(input);
      sendPort.send({'status': 'done', 'output': output});
    } catch (error) {
      sendPort.send({'status': 'error', 'output': error.toString()});
    }
  }

  final isolate = await Isolate.spawn(entryPoint, message);
  final result = await receivePort.first;
  isolate.kill();
  switch (result['status']) {
    case 'done':
      return result['output'];
    case 'error':
      throw result['output'];
    default:
      throw UnimplementedError();
  }
}

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

import 'package:file_picker/file_picker.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyPathInputField extends StatelessWidget {
  //
  //
  //

  final void Function(String path)? onChanged;
  final void Function(String path)? onPicked;
  final TextEditingController? controller;
  final MyPathInputFieldMode mode;

  //
  //
  //

  const MyPathInputField({
    super.key,
    this.onChanged,
    this.onPicked,
    this.controller,
    this.mode = MyPathInputFieldMode.FOLDER,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
              left: 20.0,
              right: 60.0,
            ),
          ),
          controller: this.controller,
          onChanged: this.onChanged,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              switch (this.mode) {
                case MyPathInputFieldMode.FILE:
                  _pickFile(
                    (path) {
                      this.controller?.text = path;
                      this.onChanged?.call(path);
                      this.onPicked?.call(path);
                    },
                  );
                  break;
                case MyPathInputFieldMode.FOLDER:
                  _pickFolder(
                    (path) {
                      this.controller?.text = path;
                      this.onChanged?.call(path);
                      this.onPicked?.call(path);
                    },
                  );
                  break;
              }
            },
            icon: const Icon(FluentIcons.folder_open_16_filled),
          ),
        ),
      ],
    );
  }

  //
  //
  //

  static Future<void> _pickFile(
    void Function(String path) onPicked,
  ) async {
    final result = await FilePicker.platform.pickFiles();
    final path = result?.files.single.path;
    if (path != null) {
      onPicked.call(path);
    }
  }

  //
  //
  //

  static Future<void> _pickFolder(
    void Function(String path) onPicked,
  ) async {
    final path = await FilePicker.platform.getDirectoryPath();
    if (path != null) {
      onPicked.call(path);
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum MyPathInputFieldMode {
  FILE,
  FOLDER,
}

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

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class GenerateModelPage2 extends ScreenPage {
  //
  //
  //

  const GenerateModelPage2({
    super.key,
    required super.screenState,
  }) : super(title: 'Step 2 - Fields');

  //
  //
  //

  @override
  State<GenerateModelPage2> createState() => _View();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _View extends TGenerateModelScreenPageView<GenerateModelPage2> {
  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return PodBuilder(
      pod: app.activeSession.pGenerateModelSettings,
      builder: (context, child, generatedModelSettings) {
        final tempFieldEntries = generatedModelSettings.fieldEntries ?? [];
        return WColumn(
          children: [
            const SizedBox(height: 20.0),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Fields',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      'What fields would you like to add to your model?',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: this.c.addFieldEntry,
                  icon: const Icon(FluentIcons.add_24_filled),
                  label: const Text('Add Field'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Divider(),
            const SizedBox(height: 8.0),
            Column(
              key: ValueKey(tempFieldEntries.length),
              children: List.generate(
                tempFieldEntries.length,
                (index) {
                  final tempFieldEntry = tempFieldEntries[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    color: tempFieldEntries.map((e) => e.fieldName).where((e) {
                              var a =
                                  tempFieldEntry.fieldName?.toSnakeCase() ?? '';
                              var b = e?.toSnakeCase() ?? '';
                              return a == b;
                            }).length >
                            1
                        ? const LerpBlender().blend(
                            Theme.of(context).cardColor,
                            Colors.red,
                            0.2,
                          )
                        : Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: WColumn(
                        divider: const SizedBox(height: 8.0),
                        children: [
                          MyDropdownTextField.compact(
                            label: 'Field Name',
                            initialValue: tempFieldEntry.fieldName,
                            initialInputMethod:
                                tempFieldEntry.isCustomFieldName!
                                    ? MyDropdownTextFieldMethod.TEXT
                                    : MyDropdownTextFieldMethod.DROPDOWN,
                            dropdownOptions: this.c.fieldNames,
                            onInputMethodChanged: (_) =>
                                this.c.onToggleFieldNameInput(index),
                            onValueChanged: (v) =>
                                this.c.onChangedFieldName(index, v),
                          ),
                          MyDropdownTextField.compact(
                            label: 'Field Type',
                            initialValue: tempFieldEntry.fieldType,
                            initialInputMethod:
                                tempFieldEntry.isCustomFieldType!
                                    ? MyDropdownTextFieldMethod.TEXT
                                    : MyDropdownTextFieldMethod.DROPDOWN,
                            dropdownOptions: this.c.fieldTypes,
                            onInputMethodChanged: (_) =>
                                this.c.onToggleFieldTypeInput(index),
                            onValueChanged: (v) =>
                                this.c.onChangedFieldType(index, v),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => this.c.onChangedNullable(
                                      index,
                                      !(tempFieldEntry.isNullable ?? true),
                                    ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: tempFieldEntry.isNullable,
                                      onChanged: (v) =>
                                          this.c.onChangedNullable(index, v),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      'Nullable?',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(FluentIcons.delete_24_filled),
                                onPressed: () {
                                  this.c.deleteFieldEntry(index);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

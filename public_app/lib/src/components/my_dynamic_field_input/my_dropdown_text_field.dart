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

@GenerateMakeups()
class MyDropdownTextField<T> extends StatefulWidget {
  //
  //
  //

  @Property()
  final String? label;

  final MyDropDownTextFieldPadding padding;
  final MyDropdownTextFieldMethod initialInputMethod;
  final void Function(MyDropdownTextFieldMethod inputMethod)?
      onInputMethodChanged;
  final bool canChangeInputMethod;
  final T? initialValue;
  final void Function(T newValue)? onValueChanged;
  final List<T> dropdownOptions;
  final String Function(T currentValue)? valueToString;
  final T? Function(String currentString)? stringToValue;
  final TextEditingController? controller;
  final TextStyle? style;
  final TextStyle? labelStyle;

  //
  //
  //

  const MyDropdownTextField({
    super.key,
    this.label,
    this.padding = const MyDropDownTextFieldPadding(),
    this.initialInputMethod = MyDropdownTextFieldMethod.DROPDOWN,
    this.onInputMethodChanged,
    this.canChangeInputMethod = true,
    this.initialValue,
    this.onValueChanged,
    this.dropdownOptions = const [],
    this.valueToString,
    this.stringToValue,
    this.controller,
    this.style,
    this.labelStyle,
  });

  //
  //
  //

  const MyDropdownTextField.compact({
    super.key,
    this.label,
    this.padding = const MyDropDownTextFieldPadding.compact(),
    this.initialInputMethod = MyDropdownTextFieldMethod.DROPDOWN,
    this.onInputMethodChanged,
    this.canChangeInputMethod = true,
    this.initialValue,
    this.onValueChanged,
    this.dropdownOptions = const [],
    this.valueToString,
    this.stringToValue,
    this.controller,
    this.style,
    this.labelStyle,
  });

  //
  //
  //

  const MyDropdownTextField.text({
    super.key,
    this.label,
    this.padding = const MyDropDownTextFieldPadding(),
    this.initialInputMethod = MyDropdownTextFieldMethod.TEXT,
    this.onInputMethodChanged,
    this.canChangeInputMethod = false,
    this.initialValue,
    this.onValueChanged,
    this.dropdownOptions = const [],
    this.valueToString,
    this.stringToValue,
    this.controller,
    this.style,
    this.labelStyle,
  });

  //
  //
  //

  const MyDropdownTextField.dropdown({
    super.key,
    this.label,
    this.padding = const MyDropDownTextFieldPadding(),
    this.initialInputMethod = MyDropdownTextFieldMethod.DROPDOWN,
    this.onInputMethodChanged,
    this.canChangeInputMethod = false,
    this.initialValue,
    this.onValueChanged,
    this.dropdownOptions = const [],
    this.valueToString,
    this.stringToValue,
    this.controller,
    this.style,
    this.labelStyle,
  });

  //
  //
  //

  @override
  State<MyDropdownTextField<T>> createState() => _MyDropdownTextFieldState<T>();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _MyDropdownTextFieldState<T> extends State<MyDropdownTextField<T>> {
  //
  //
  //

  late var _inputMethod = this.widget.initialInputMethod;
  late T _value = this.widget.initialValue ?? this.widget.dropdownOptions.first;
  late final _label =
      '${this.widget.label?.nullIfEmpty ?? ''}${this.widget.label?.nullIfEmpty != null ? ':' : ''}';
  late final _valueToString =
      this.widget.valueToString ?? (T? e) => e?.toString() ?? '';
  late final _valueFromString = this.widget.stringToValue ??
      (String? a) => this
          .widget
          .dropdownOptions
          .firstWhereOrNull((b) => b.toString() == a);
  late final _style =
      this.widget.style ?? Theme.of(context).textTheme.bodyLarge;
  late final _labelStyle = this.widget.labelStyle ??
      this._style?.copyWith(fontWeight: FontWeight.w600);

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: this._inputMethod == MyDropdownTextFieldMethod.TEXT
              ? TextFormField(
                  autofocus: true,
                  style: this._style,
                  decoration: this._inputDecoration(context),
                  initialValue: this._valueToString(this._value),
                  onChanged: this._onChanged,
                  controller: this.widget.controller,
                )
              : InputDecorator(
                  decoration: this._inputDecoration(context),
                  child: DropdownButton<T>(
                    key: UniqueKey(),
                    style: this._style,
                    isDense: true,
                    isExpanded: true,
                    underline: const SizedBox(),
                    icon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.5 * this.widget.padding.value.right,
                      ),
                      child: const Icon(FluentIcons.arrow_down_16_filled),
                    ),
                    iconSize: 16.0,
                    value: this.widget.dropdownOptions.contains(this._value)
                        ? this._value
                        : this.widget.dropdownOptions.first,
                    onChanged: this._onChanged,
                    items: this
                        .widget
                        .dropdownOptions
                        .map<DropdownMenuItem<T>>((e) {
                      final stringValue = this._valueToString(e);
                      return DropdownMenuItem<T>(
                        value: e,
                        child: Text(
                          stringValue,
                          style: this._style,
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ),
        if (this.widget.canChangeInputMethod)
          IconButton(
            icon: const Icon(
              FluentIcons.arrow_bidirectional_left_right_24_filled,
            ),
            onPressed: this._onToggleInputMethod,
          ),
      ],
    );
  }

  //
  //
  //

  void _onChanged(dynamic value) {
    this.setState(() {
      this._value = value is T
          ? value
          : this._valueFromString(value.toString()) ??
              this.widget.dropdownOptions.first;
    });
    this.widget.onValueChanged?.call(this._value);
  }

  //
  //
  //

  void _onToggleInputMethod() {
    this.setState(() {
      this._inputMethod =
          this._inputMethod == MyDropdownTextFieldMethod.DROPDOWN
              ? MyDropdownTextFieldMethod.TEXT
              : MyDropdownTextFieldMethod.DROPDOWN;
    });
    this.widget.onInputMethodChanged?.call(this._inputMethod);
    this._onChanged(
      this.widget.dropdownOptions.contains(this._value)
          ? this._value
          : this.widget.dropdownOptions.first,
    );
  }

  //
  //
  //

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      isCollapsed: true,
      contentPadding: EdgeInsets.only(
        left: this.widget.padding.value.left,
        right: this.widget.padding.value.right,
      ),
      prefix: Padding(
        padding: EdgeInsets.only(
          right:
              this._label.isEmpty ? 0.0 : 0.5 * this.widget.padding.value.left,
          top: this.widget.padding.value.top,
          bottom: this.widget.padding.value.bottom,
        ),
        child: Text(
          this._label,
          style: this._labelStyle,
        ),
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum MyDropdownTextFieldMethod { DROPDOWN, TEXT }

class MyDropDownTextFieldPadding {
  final EdgeInsets value;
  const MyDropDownTextFieldPadding.custom(this.value);

  const MyDropDownTextFieldPadding()
      : this.custom(
          const EdgeInsets.only(
            left: 12.5,
            right: 12.5,
            top: 20.5,
            bottom: 20.5,
          ),
        );

  const MyDropDownTextFieldPadding.compact()
      : this.custom(const EdgeInsets.all(12.0));
}

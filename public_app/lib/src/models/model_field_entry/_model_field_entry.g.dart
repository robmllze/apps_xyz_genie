//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY XYZ_GEN - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: empty_constructor_bodies
// ignore_for_file: invalid_null_aware_operator
// ignore_for_file: overridden_fields
// ignore_for_file: unnecessary_non_null_assertion
// ignore_for_file: unnecessary_null_comparison
// ignore_for_file: unnecessary_this

part of 'model_field_entry.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ModelFieldEntry extends Model {
  //
  //
  //

  static const CLASS = 'ModelFieldEntry';
  static const MODEL_ID = 'model_field_entry';

  static const K_FIELD_NAME = 'field_name';
  static const K_FIELD_TYPE = 'field_type';
  static const K_IS_CUSTOM_FIELD_NAME = 'is_custom_field_name';
  static const K_IS_CUSTOM_FIELD_TYPE = 'is_custom_field_type';
  static const K_IS_NULLABLE = 'is_nullable';

  String? fieldName;
  String? fieldType;
  bool? isCustomFieldName;
  bool? isCustomFieldType;
  bool? isNullable;

  //
  //
  //

  ModelFieldEntry({
    this.fieldName,
    this.fieldType,
    this.isCustomFieldName,
    this.isCustomFieldType,
    this.isNullable,
  }) {}

  //
  //
  //

  ModelFieldEntry.unsafe({
    this.fieldName,
    this.fieldType,
    this.isCustomFieldName,
    this.isCustomFieldType,
    this.isNullable,
  }) {}

  //
  //
  //

  factory ModelFieldEntry.from(
    Model? other,
  ) {
    return ModelFieldEntry.unsafe()..updateWith(other);
  }

  //
  //
  //

  factory ModelFieldEntry.of(
    ModelFieldEntry? other,
  ) {
    return ModelFieldEntry.unsafe()..updateWith(other);
  }

  //
  //
  //

  factory ModelFieldEntry.fromJsonString(
    String? source,
  ) {
    try {
      if (source != null && source.isNotEmpty) {
        final decoded = jsonDecode(source);
        return ModelFieldEntry.fromJson(decoded);
      } else {
        return ModelFieldEntry.unsafe();
      }
    } catch (e) {
      assert(false, e);
      rethrow;
    }
  }

  //
  //
  //

  factory ModelFieldEntry.fromJson(
    Map<String, dynamic>? otherData,
  ) {
    try {
      return ModelFieldEntry.unsafe(
        fieldName: otherData?[K_FIELD_NAME]
            ?.toString()
            .trim()
            .nullIfEmpty
            ?.toCamelCase(),
        fieldType: otherData?[K_FIELD_TYPE]?.toString().trim().nullIfEmpty,
        isCustomFieldName: letBool(otherData?[K_IS_CUSTOM_FIELD_NAME]),
        isCustomFieldType: letBool(otherData?[K_IS_CUSTOM_FIELD_TYPE]),
        isNullable: letBool(otherData?[K_IS_NULLABLE]),
      );
    } catch (e) {
      assert(false, e);
      rethrow;
    }
  }

  //
  //
  //

  @override
  Map<String, dynamic> toJson({
    dynamic defaultValue,
    bool includeNulls = false,
  }) {
    try {
      final withNulls = <String, dynamic>{
        K_FIELD_NAME: fieldName?.toString().trim().nullIfEmpty?.toCamelCase(),
        K_FIELD_TYPE: fieldType?.toString().trim().nullIfEmpty,
        K_IS_CUSTOM_FIELD_NAME: isCustomFieldName,
        K_IS_CUSTOM_FIELD_TYPE: isCustomFieldType,
        K_IS_NULLABLE: isNullable,
      }.mapWithDefault(defaultValue);
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, e);
      rethrow;
    }
  }

  //
  //
  //

  @override
  T empty<T extends Model>() {
    return ModelFieldEntry.unsafe() as T;
  }

  //
  //
  //

  @override
  T copy<T extends Model>() {
    return (ModelFieldEntry.unsafe()..updateWith(this)) as T;
  }

  //
  //
  //

  @override
  void updateWithJson(
    Map<String, dynamic>? otherData,
  ) {
    if (otherData != null && otherData.isNotEmpty) {
      final other = ModelFieldEntry.fromJson(otherData);
      other.fieldName != null ? this.fieldName = other.fieldName : null;
      other.fieldType != null ? this.fieldType = other.fieldType : null;
      other.isCustomFieldName != null
          ? this.isCustomFieldName = other.isCustomFieldName
          : null;
      other.isCustomFieldType != null
          ? this.isCustomFieldType = other.isCustomFieldType
          : null;
      other.isNullable != null ? this.isNullable = other.isNullable : null;
    }
  }
}

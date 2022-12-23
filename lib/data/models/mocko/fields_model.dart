class FieldsModel {
  String code;
  String caption;
  String fullCaption;
  int sort;
  String group;
  String initialValue;
  String regExp;
  bool required;
  String type;
  List values;

  FieldsModel(
      {required this.code,
      required this.caption,
      required this.fullCaption,
      required this.sort,
      required this.group,
      required this.initialValue,
      required this.regExp,
      required this.required,
      required this.type,
      required this.values});

  factory FieldsModel.fromJson(Map<String, dynamic> jsonData) {
    return FieldsModel(
      code: jsonData['code'] as String? ?? '',
      caption: jsonData['caption'] as String? ?? '',
      fullCaption: jsonData['fullCaption'] as String? ?? '',
      sort: jsonData['sort'] as int? ?? 0,
      group: jsonData['group'] as String? ?? '',
      initialValue: jsonData['initial_value'] as String? ?? '',
      regExp: jsonData['regExp'] as String? ?? '',
      required: jsonData['required'] as bool? ?? false,
      type: jsonData['type'] as String? ?? '',
      values: jsonData['values'] as List? ?? [],
    );
  }
}

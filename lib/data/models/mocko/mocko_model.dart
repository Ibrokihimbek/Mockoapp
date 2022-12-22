import 'package:mockoapp/data/models/mocko/fields_model.dart';

class MockoModel {
  List<FieldsModel> fields;

  MockoModel({required this.fields});

  factory MockoModel.fromJson(Map<String, dynamic> jsonData) {
    return MockoModel(
      fields: (jsonData['fields'] as List?)
              ?.map((e) => FieldsModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

// import 'dart:convert';

// MockoModel MockoModelFromJson(String str) => MockoModel.fromJson(json.decode(str));

// String MockoModelToJson(MockoModel data) => json.encode(data.toJson());

// class MockoModel {
//   MockoModel({
//     this.fields,
//   });

//   List<Field>? fields;

//   factory MockoModel.fromJson(Map<String, dynamic> json) => MockoModel(
//     fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
//   );

//   Map<String, dynamic> toJson() => {
//     "fields": List<dynamic>.from(fields!.map((x) => x.toJson())),
//   };
// }

// class Field {
//   Field({
//     this.code,
//     this.caption,
//     this.fullCaption,
//     this.sort,
//     this.group,
//     this.initialValue,
//     this.regExp,
//     this.required,
//     this.type,
//     this.values,
//   });

//   String? code;
//   String? caption;
//   String? fullCaption;
//   int? sort;
//   Group? group;
//   InitialValue? initialValue;
//   String? regExp;
//   bool? required;
//   Type? type;
//   List<String>? values;

//   factory Field.fromJson(Map<String, dynamic> json) => Field(
//     code: json["code"],
//     caption: json["caption"],
//     fullCaption: json["fullCaption"],
//     sort: json["sort"],
//     group: groupValues.map[json["group"]],
//     initialValue: initialValueValues.map[json["initial_value"]],
//     regExp: json["regExp"],
//     required: json["required"],
//     type: typeValues.map[json["type"]],
//     values: json["values"] == null ? null : List<String>.from(json["values"].map((x) => x)),
//   );

//   Map<String, dynamic> toJson() => {
//     "code": code,
//     "caption": caption,
//     "fullCaption": fullCaption,
//     "sort": sort,
//     "group": groupValues.reverse[group],
//     "initial_value": initialValueValues.reverse[initialValue],
//     "regExp": regExp,
//     "required": required,
//     "type": typeValues.reverse[type],
//     "values": values == null ? null : List<dynamic>.from(values!.map((x) => x)),
//   };
// }

// enum Group { COMMON, SENDER, RECEIVER }

// final groupValues = EnumValues({
//   "COMMON": Group.COMMON,
//   "RECEIVER": Group.RECEIVER,
//   "SENDER": Group.SENDER
// });

// enum InitialValue { USD, EMPTY }

// final initialValueValues = EnumValues({
//   "": InitialValue.EMPTY,
//   "USD": InitialValue.USD
// });

// enum Type { SELECT, CHECKBOX, TEXT }

// final typeValues = EnumValues({
//   "checkbox": Type.CHECKBOX,
//   "select": Type.SELECT,
//   "text": Type.TEXT
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap!;
//   }
// }
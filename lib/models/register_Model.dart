/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the register_Model type in your schema. */
@immutable
class register_Model extends Model {
  static const classType = const _register_ModelModelType();
  final String id;
  final String? _email;
  final String? _phone;
  final String? _password;
  final String? _name;
  final double? _height;
  final double? _weight;
  final int? _age;
  final String? _country;
  final String? _state;
  final String? _city;
  final String? _gender;
  final List<graph_value_Model>? _graph_value;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  register_ModelModelIdentifier get modelIdentifier {
      return register_ModelModelIdentifier(
        id: id
      );
  }
  
  String? get email {
    return _email;
  }
  
  String? get phone {
    return _phone;
  }
  
  String? get password {
    return _password;
  }
  
  String? get name {
    return _name;
  }
  
  double? get height {
    return _height;
  }
  
  double? get weight {
    return _weight;
  }
  
  int? get age {
    return _age;
  }
  
  String? get country {
    return _country;
  }
  
  String? get state {
    return _state;
  }
  
  String? get city {
    return _city;
  }
  
  String? get gender {
    return _gender;
  }
  
  List<graph_value_Model>? get graph_value {
    return _graph_value;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const register_Model._internal({required this.id, email, phone, password, name, height, weight, age, country, state, city, gender, graph_value, createdAt, updatedAt}): _email = email, _phone = phone, _password = password, _name = name, _height = height, _weight = weight, _age = age, _country = country, _state = state, _city = city, _gender = gender, _graph_value = graph_value, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory register_Model({String? id, String? email, String? phone, String? password, String? name, double? height, double? weight, int? age, String? country, String? state, String? city, String? gender, List<graph_value_Model>? graph_value}) {
    return register_Model._internal(
      id: id == null ? UUID.getUUID() : id,
      email: email,
      phone: phone,
      password: password,
      name: name,
      height: height,
      weight: weight,
      age: age,
      country: country,
      state: state,
      city: city,
      gender: gender,
      graph_value: graph_value != null ? List<graph_value_Model>.unmodifiable(graph_value) : graph_value);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is register_Model &&
      id == other.id &&
      _email == other._email &&
      _phone == other._phone &&
      _password == other._password &&
      _name == other._name &&
      _height == other._height &&
      _weight == other._weight &&
      _age == other._age &&
      _country == other._country &&
      _state == other._state &&
      _city == other._city &&
      _gender == other._gender &&
      DeepCollectionEquality().equals(_graph_value, other._graph_value);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("register_Model {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("password=" + "$_password" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("height=" + (_height != null ? _height!.toString() : "null") + ", ");
    buffer.write("weight=" + (_weight != null ? _weight!.toString() : "null") + ", ");
    buffer.write("age=" + (_age != null ? _age!.toString() : "null") + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("state=" + "$_state" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  register_Model copyWith({String? email, String? phone, String? password, String? name, double? height, double? weight, int? age, String? country, String? state, String? city, String? gender, List<graph_value_Model>? graph_value}) {
    return register_Model._internal(
      id: id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      gender: gender ?? this.gender,
      graph_value: graph_value ?? this.graph_value);
  }
  
  register_Model.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _email = json['email'],
      _phone = json['phone'],
      _password = json['password'],
      _name = json['name'],
      _height = (json['height'] as num?)?.toDouble(),
      _weight = (json['weight'] as num?)?.toDouble(),
      _age = (json['age'] as num?)?.toInt(),
      _country = json['country'],
      _state = json['state'],
      _city = json['city'],
      _gender = json['gender'],
      _graph_value = json['graph_value'] is List
        ? (json['graph_value'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => graph_value_Model.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'email': _email, 'phone': _phone, 'password': _password, 'name': _name, 'height': _height, 'weight': _weight, 'age': _age, 'country': _country, 'state': _state, 'city': _city, 'gender': _gender, 'graph_value': _graph_value?.map((graph_value_Model? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'email': _email, 'phone': _phone, 'password': _password, 'name': _name, 'height': _height, 'weight': _weight, 'age': _age, 'country': _country, 'state': _state, 'city': _city, 'gender': _gender, 'graph_value': _graph_value, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<register_ModelModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<register_ModelModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField PASSWORD = QueryField(fieldName: "password");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField HEIGHT = QueryField(fieldName: "height");
  static final QueryField WEIGHT = QueryField(fieldName: "weight");
  static final QueryField AGE = QueryField(fieldName: "age");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField STATE = QueryField(fieldName: "state");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField GENDER = QueryField(fieldName: "gender");
  static final QueryField GRAPH_VALUE = QueryField(
    fieldName: "graph_value",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'graph_value_Model'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "register_Model";
    modelSchemaDefinition.pluralName = "register_Models";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.PHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.PASSWORD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.HEIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.WEIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.AGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.COUNTRY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.STATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.CITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: register_Model.GENDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: register_Model.GRAPH_VALUE,
      isRequired: false,
      ofModelName: 'graph_value_Model',
      associatedKey: graph_value_Model.REGISTER_MODELGRAPH_VALUEID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _register_ModelModelType extends ModelType<register_Model> {
  const _register_ModelModelType();
  
  @override
  register_Model fromJson(Map<String, dynamic> jsonData) {
    return register_Model.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'register_Model';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [register_Model] in your schema.
 */
@immutable
class register_ModelModelIdentifier implements ModelIdentifier<register_Model> {
  final String id;

  /** Create an instance of register_ModelModelIdentifier using [id] the primary key. */
  const register_ModelModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'register_ModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is register_ModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
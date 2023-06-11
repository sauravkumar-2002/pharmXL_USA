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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the graph_value_Model type in your schema. */
@immutable
class graph_value_Model extends Model {
  static const classType = const _graph_value_ModelModelType();
  final String id;
  final double? _xValue;
  final double? _yValue;
  final String? _diettaken;
  final String? _date;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _register_ModelGraph_valueId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  graph_value_ModelModelIdentifier get modelIdentifier {
      return graph_value_ModelModelIdentifier(
        id: id
      );
  }
  
  double? get xValue {
    return _xValue;
  }
  
  double? get yValue {
    return _yValue;
  }
  
  String? get diettaken {
    return _diettaken;
  }
  
  String? get date {
    return _date;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get register_ModelGraph_valueId {
    return _register_ModelGraph_valueId;
  }
  
  const graph_value_Model._internal({required this.id, xValue, yValue, diettaken, date, createdAt, updatedAt, register_ModelGraph_valueId}): _xValue = xValue, _yValue = yValue, _diettaken = diettaken, _date = date, _createdAt = createdAt, _updatedAt = updatedAt, _register_ModelGraph_valueId = register_ModelGraph_valueId;
  
  factory graph_value_Model({String? id, double? xValue, double? yValue, String? diettaken, String? date, String? register_ModelGraph_valueId}) {
    return graph_value_Model._internal(
      id: id == null ? UUID.getUUID() : id,
      xValue: xValue,
      yValue: yValue,
      diettaken: diettaken,
      date: date,
      register_ModelGraph_valueId: register_ModelGraph_valueId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is graph_value_Model &&
      id == other.id &&
      _xValue == other._xValue &&
      _yValue == other._yValue &&
      _diettaken == other._diettaken &&
      _date == other._date &&
      _register_ModelGraph_valueId == other._register_ModelGraph_valueId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("graph_value_Model {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("xValue=" + (_xValue != null ? _xValue!.toString() : "null") + ", ");
    buffer.write("yValue=" + (_yValue != null ? _yValue!.toString() : "null") + ", ");
    buffer.write("diettaken=" + "$_diettaken" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("register_ModelGraph_valueId=" + "$_register_ModelGraph_valueId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  graph_value_Model copyWith({double? xValue, double? yValue, String? diettaken, String? date, String? register_ModelGraph_valueId}) {
    return graph_value_Model._internal(
      id: id,
      xValue: xValue ?? this.xValue,
      yValue: yValue ?? this.yValue,
      diettaken: diettaken ?? this.diettaken,
      date: date ?? this.date,
      register_ModelGraph_valueId: register_ModelGraph_valueId ?? this.register_ModelGraph_valueId);
  }
  
  graph_value_Model.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _xValue = (json['xValue'] as num?)?.toDouble(),
      _yValue = (json['yValue'] as num?)?.toDouble(),
      _diettaken = json['diettaken'],
      _date = json['date'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _register_ModelGraph_valueId = json['register_ModelGraph_valueId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'xValue': _xValue, 'yValue': _yValue, 'diettaken': _diettaken, 'date': _date, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'register_ModelGraph_valueId': _register_ModelGraph_valueId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'xValue': _xValue, 'yValue': _yValue, 'diettaken': _diettaken, 'date': _date, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'register_ModelGraph_valueId': _register_ModelGraph_valueId
  };

  static final QueryModelIdentifier<graph_value_ModelModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<graph_value_ModelModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField XVALUE = QueryField(fieldName: "xValue");
  static final QueryField YVALUE = QueryField(fieldName: "yValue");
  static final QueryField DIETTAKEN = QueryField(fieldName: "diettaken");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField REGISTER_MODELGRAPH_VALUEID = QueryField(fieldName: "register_ModelGraph_valueId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "graph_value_Model";
    modelSchemaDefinition.pluralName = "graph_value_Models";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: graph_value_Model.XVALUE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: graph_value_Model.YVALUE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: graph_value_Model.DIETTAKEN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: graph_value_Model.DATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: graph_value_Model.REGISTER_MODELGRAPH_VALUEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _graph_value_ModelModelType extends ModelType<graph_value_Model> {
  const _graph_value_ModelModelType();
  
  @override
  graph_value_Model fromJson(Map<String, dynamic> jsonData) {
    return graph_value_Model.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'graph_value_Model';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [graph_value_Model] in your schema.
 */
@immutable
class graph_value_ModelModelIdentifier implements ModelIdentifier<graph_value_Model> {
  final String id;

  /** Create an instance of graph_value_ModelModelIdentifier using [id] the primary key. */
  const graph_value_ModelModelIdentifier({
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
  String toString() => 'graph_value_ModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is graph_value_ModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
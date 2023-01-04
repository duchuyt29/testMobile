import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/home/condition.dart';

part 'conditions_request.g.dart';

@JsonSerializable()
class ConditionsRequest {
  final List<Condition>? conditions;

  ConditionsRequest(this.conditions);

  factory ConditionsRequest.fromJson(Map<String, dynamic> json) =>
      _$ConditionsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionsRequestToJson(this);

  factory ConditionsRequest.important() {
    return ConditionsRequest([
      const Condition(
        logicOperator: '',
        conditionType: 'GROUP',
        filterType: 'ROLE',
        children: [
          Condition(
            logicOperator: '',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'BOOLEAN',
            fieldName: 'important',
            operator: '=',
            values: [true],
          ),
        ],
      )
    ]);
  }

  factory ConditionsRequest.post(DateTime dateTime) {
    return ConditionsRequest([
      Condition(
        logicOperator: '',
        conditionType: 'GROUP',
        filterType: 'ROLE',
        children: [
          const Condition(
            logicOperator: '',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'STRING',
            fieldName: 'type',
            operator: 'IN',
            values: ['POST'],
          ),
          const Condition(
            logicOperator: 'AND',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'STRING',
            fieldName: 'status',
            operator: 'IN',
            values: [1],
          ),
          const Condition(
            logicOperator: 'AND',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'STRING',
            fieldName: 'state',
            operator: 'IN',
            values: ['APPROVED'],
          ),
          Condition(
            logicOperator: 'AND',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'DATE_TIME',
            fieldName: 'publish_date',
            operator: '<=',
            values: [
              DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime).toString()
            ],
          ),
        ],
      )
    ]);
  }

  factory ConditionsRequest.event(DateTime dateTime) {
    return ConditionsRequest([
      Condition(
        logicOperator: '',
        conditionType: 'GROUP',
        filterType: 'ROLE',
        children: [
          const Condition(
            logicOperator: '',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'STRING',
            fieldName: 'type',
            operator: 'IN',
            values: ['EVENT'],
          ),
          const Condition(
            logicOperator: 'AND',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'STRING',
            fieldName: 'status',
            operator: 'IN',
            values: [1],
          ),
          const Condition(
            logicOperator: 'AND',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'STRING',
            fieldName: 'state',
            operator: 'IN',
            values: ['APPROVED'],
          ),
          Condition(
            logicOperator: 'AND',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'DATE_TIME',
            fieldName: 'publish_date',
            operator: '<=',
            values: [
              DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime).toString()
            ],
          ),
          Condition(
            logicOperator: 'AND',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'DATE_TIME',
            fieldName: 'deadline',
            operator: '>=',
            values: [
              DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime).toString()
            ],
          ),
        ],
      ),
      const Condition(
        logicOperator: 'AND',
        conditionType: 'RULE',
        filterType: 'FIELD',
        fieldType: 'LONG',
        fieldName: 'group_id',
        operator: 'IN',
        values: [0],
      ),
    ]);
  }

  factory ConditionsRequest.poll(DateTime dateTime) {
    return ConditionsRequest([
      Condition(
        logicOperator: '',
        conditionType: 'GROUP',
        filterType: 'ROLE',
        children: [
          const Condition(
            logicOperator: '',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'STRING',
            fieldName: 'type',
            operator: 'IN',
            values: ['POLL'],
          ),
          Condition(
            logicOperator: 'AND',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'DATE_TIME',
            fieldName: 'publish_date',
            operator: '<=',
            values: [
              DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime).toString()
            ],
          ),
        ],
      )
    ]);
  }

  factory ConditionsRequest.search(DateTime dateTime, String query) {
    return ConditionsRequest([
      Condition(
        logicOperator: '',
        conditionType: 'GROUP',
        filterType: 'ROLE',
        children: [
          const Condition(
            logicOperator: '',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'STRING',
            fieldName: 'type',
            operator: 'IN',
            values: ['POST'],
          ),
          Condition(
            logicOperator: 'AND',
            conditionType: 'RULE',
            filterType: 'FIELD',
            fieldType: 'DATE_TIME',
            fieldName: 'publish_date',
            operator: '<=',
            values: [
              DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime).toString()
            ],
          ),
          query.isNotEmpty && query[0].contains('#')
              ? Condition(
                  logicOperator: 'AND',
                  conditionType: 'RULE',
                  filterType: 'FIELD',
                  fieldType: 'LIST_MULTI',
                  fieldName: 'tags',
                  operator: 'CONTAIN',
                  values: [query.replaceAll('#', '')],
                )
              : Condition(
                  logicOperator: 'AND',
                  conditionType: 'RULE',
                  filterType: 'FIELD',
                  fieldType: 'STRING',
                  fieldName: 'name',
                  operator: 'LIKE',
                  values: [query],
                ),
        ],
      )
    ]);
  }
}

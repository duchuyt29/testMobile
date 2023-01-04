import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';
import 'package:sicix/shared/constants/common.dart';

import '../models/activity/activity_condition.dart';

part 'activity_request.g.dart';

@JsonSerializable()
class ActivityRequest {
  final bool? checkActivityTask;
  final bool? checkPermission;
  final List<String>? include;
  final List<String>? props;
  final List<ActivityCondition>? conditions;

  ActivityRequest({
    this.checkActivityTask,
    this.checkPermission,
    this.include,
    this.props,
    this.conditions,
  });

  factory ActivityRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityRequestToJson(this);

  factory ActivityRequest.lead(int? leadId) {
    return ActivityRequest(
        checkActivityTask: false,
        checkPermission: false,
        conditions: [
          ActivityCondition(
            logicOperator: '',
            conditionType: 'GROUP',
            filterType: 'ROLE',
            children: [
              ActivityCondition(
                conditionType: 'RULE',
                fieldName: 'lead_id',
                fieldType: 'LONG',
                filterType: 'FIELD',
                logicOperator: 'AND',
                operator: 'IN',
                values: [leadId ?? 0],
              ),
              ActivityCondition(
                conditionType: 'RULE',
                fieldName: 'requested_by',
                fieldType: 'STRING',
                filterType: 'FIELD',
                logicOperator: 'AND',
                operator: 'IN',
                values: [AppDataGlobal.userInfo?.id ?? ''],
              ),
              ActivityCondition(
                conditionType: 'RULE',
                fieldName: 'object_type_id',
                fieldType: 'STRING',
                filterType: 'FIELD',
                logicOperator: 'AND',
                operator: 'IN',
                values: [TaskObjectType.LEAD_OBJECT.id],
              ),
            ],
          ),
        ],
        include: [
          'next-states',
          'involves'
        ],
        props: [
          'id',
          'name',
          'contactId',
          'deadline',
          'closed_on',
          'responsibleId',
          'create_by',
          'create_date',
          'start_date',
          'state',
          'priorityId',
          'activityTypeId',
          'description',
          'objectTypeId',
          'accountId',
          'leadId',
          'opportunityId',
          'quoteId',
          'contractId',
          'orderId'
        ]);
  }
}

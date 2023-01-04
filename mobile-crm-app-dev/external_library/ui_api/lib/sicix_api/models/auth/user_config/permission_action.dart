import 'package:json_annotation/json_annotation.dart';

import 'screen_rule.dart';

part 'permission_action.g.dart';

@JsonSerializable()
class PermissionAction {
  ScreenRule? view;
  @JsonKey(name: 'view_task')
  ScreenRule? viewTask;
  ScreenRule? update;
  @JsonKey(name: 'update_task')
  ScreenRule? updateTask;
  ScreenRule? create;
  @JsonKey(name: 'create_task')
  ScreenRule? createTask;
  ScreenRule? delete;
  @JsonKey(name: 'delete_task')
  ScreenRule? deleteTask;
  @JsonKey(name: 'change_state_task')
  ScreenRule? changeStateTask;

  PermissionAction(
      {this.view,
      this.viewTask,
      this.update,
      this.updateTask,
      this.create,
      this.createTask,
      this.delete,
      this.deleteTask,
      this.changeStateTask});

  factory PermissionAction.fromJson(Map<String, dynamic> json) {
    return _$PermissionActionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PermissionActionToJson(this);
}

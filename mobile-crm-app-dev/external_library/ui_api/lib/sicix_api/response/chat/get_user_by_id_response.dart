import 'package:json_annotation/json_annotation.dart';

import '../../models/auth/user_chat_model.dart';
import '../base_response.dart';

part 'get_user_by_id_response.g.dart';

@JsonSerializable()
class GetUserByIdResponse extends BaseResponse {
  @JsonKey(defaultValue: [])
  List<UserChatModel> data;

  GetUserByIdResponse(this.data) : super(false);

  factory GetUserByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserByIdResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetUserByIdResponseToJson(this);
}

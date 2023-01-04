import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'upload_file_request.g.dart';

@JsonSerializable()
class UploadFileRequest {
  String? application;
  String? refType;
  String? refId;

  UploadFileRequest({this.application, this.refType, this.refId});

  factory UploadFileRequest.chat() {
    return UploadFileRequest(
      application: 'comm-service',
      refType: 'chat',
      refId: const Uuid().v4().replaceAll('-', ''),
    );
  }

  factory UploadFileRequest.groupAvatar(int conversationId) {
    return UploadFileRequest(
      application: 'comm-service',
      refType: 'conversation',
      refId: conversationId.toString(),
    );
  }

  factory UploadFileRequest.comment() {
    return UploadFileRequest(
      application: 'comm-service',
      refType: 'comments',
      refId: const Uuid().v4(),
    );
  }

  factory UploadFileRequest.fromJson(Map<String, dynamic> json) {
    return _$UploadFileRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UploadFileRequestToJson(this);
}

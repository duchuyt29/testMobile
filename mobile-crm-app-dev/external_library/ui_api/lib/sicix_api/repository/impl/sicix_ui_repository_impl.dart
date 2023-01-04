import 'dart:io';

import '../../datasource/sicix_ui_api.dart';
import '../../models/home/reaction_count.dart';
import '../../request/avatar_request.dart';
import '../../request/change_company_request.dart';
import '../../request/comment_request.dart';
import '../../request/conditions_request.dart';
import '../../request/conversation_theme_request.dart';
import '../../request/create_conversation_request.dart';
import '../../request/device_token_request.dart';
import '../../request/forward_request.dart';
import '../../request/get_chat_request.dart';
import '../../request/login_request.dart';
import '../../request/message_request.dart';
import '../../request/name_request.dart';
import '../../request/pin_request.dart';
import '../../request/reaction_request.dart';
import '../../request/refresh_token_request.dart';
import '../../request/search_chat_request.dart';
import '../../request/update_password_request.dart';
import '../../request/update_profile_request.dart';
import '../../request/upload_file_request.dart';
import '../../request/user_by_id_request.dart';
import '../../request/vote_request.dart';
import '../../response/auth/change_password_response.dart';
import '../../response/auth/employee_info_hcm_response.dart';
import '../../response/auth/token_response.dart';
import '../../response/auth/user_config_response.dart';
import '../../response/auth/user_infos_response.dart';
import '../../response/auth/user_mapping_response.dart';
import '../../response/avatar/avatar_response.dart';
import '../../response/base_response.dart';
import '../../response/chat/conversation_add_member_response.dart';
import '../../response/chat/conversation_response.dart';
import '../../response/chat/create_conversation_response.dart';
import '../../response/chat/get_message_response.dart';
import '../../response/chat/get_user_by_id_response.dart';
import '../../response/chat/message_attach_file_response.dart';
import '../../response/chat/message_pin_response.dart';
import '../../response/chat/reaction_response.dart';
import '../../response/chat/search_message_response.dart';
import '../../response/chat/total_unread_response.dart';
import '../../response/chat/user_conversation_response.dart';
import '../../response/home/attachment_post_response.dart';
import '../../response/home/birth_month_response.dart';
import '../../response/home/comment_response.dart';
import '../../response/home/comments_response.dart';
import '../../response/home/home_post_detail_response.dart';
import '../../response/home/home_post_response.dart';
import '../../response/home/post_viewer_response.dart';
import '../../response/notification/notification_response.dart';
import '../../response/profile/profile_response.dart';
import '../../response/upload_file/media_file_info_response.dart';
import '../../response/upload_file/upload_file_response.dart';
import '../../response/workgroup/workgroup_response.dart';
import '../sicix_ui_repository.dart';

class SicixUIRepositoryImpl extends SicixUIRepository {
  final SicixUIAPI _api;

  SicixUIRepositoryImpl(this._api);

  @override
  Future<TokenResponse> login(LoginRequest request) {
    return _api.login(request);
  }

  @override
  Future<BaseResponse> changeCompany(ChangeCompanyRequest request) {
    return _api.changeCompany(request);
  }

  @override
  Future<TokenResponse> refreshToken(RefreshTokenRequest request) {
    return _api.refreshToken(request);
  }

  @override
  Future<UserConfigResponse> userConfig() {
    return _api.userConfig();
  }

  @override
  Future<BaseResponse> logout(RefreshTokenRequest request) {
    return _api.logout(request);
  }

  @override
  Future<BaseResponse> deleteToken(DeviceTokenRequest request, int all) {
    return _api.deleteToken(request, all);
  }

  @override
  Future<BaseResponse> updateToken(DeviceTokenRequest request) {
    return _api.updateToken(request);
  }

  @override
  Future<ConversationAddMemberResponse> addUserInGroup(
      int conversationId, CreateConversationRequest request) {
    return _api.addUserInGroup(conversationId, request);
  }

  @override
  Future<BaseResponse> changeConversationAvatar(
      int conversationId, AvatarRequest request) {
    return _api.changeConversationAvatar(conversationId, request);
  }

  @override
  Future<BaseResponse> changeConversationName(
      int conversationId, NameRequest request) {
    return _api.changeConversationName(conversationId, request);
  }

  @override
  Future<BaseResponse> changeConversationTheme(
      int conversationId, ConversationThemeRequest request) {
    return _api.changeConversationTheme(conversationId, request);
  }

  @override
  Future<MessagePinResponse> conversationPin(
      int conversationId, String type, int page, int size) {
    return _api.conversationPin(conversationId, type, page, size);
  }

  @override
  Future<ConversationResponse> getConversations(int page, int size, String sort,
      {int? conversationId}) {
    return _api.getConversations(page, size, sort, conversationId);
  }

  @override
  Future<CreateConversationResponse> createConversation(
      CreateConversationRequest request) {
    return _api.createConversation(request);
  }

  @override
  Future<BaseResponse> deleteMessage(String messageId) {
    return _api.deleteMessage(messageId);
  }

  @override
  Future<BaseResponse> deleteUserInGroup(int conversationId, String involves) {
    return _api.deleteUserInGroup(conversationId, involves);
  }

  @override
  Future<BaseResponse> editMessage(String messageId, MessageRequest request) {
    return _api.editMessage(messageId, request);
  }

  @override
  Future<MessageAttachFileResponse> getAttachFile(
      int conversationId, String type, int page, int size) {
    return _api.getAttachFile(conversationId, type, page, size);
  }

  @override
  Future<GetMessageResponse> getMessage(int conversationId,
      {GetChatRequest? request}) {
    return _api.getMessage(conversationId, request: request);
  }

  @override
  Future<BaseResponse> lastMessageSeen(int conversationId, String latestDate) {
    return _api.lastMessageSeen(conversationId, latestDate);
  }

  @override
  Future<BaseResponse> leaveConversation(int conversationId) {
    return _api.leaveConversation(conversationId);
  }

  @override
  Future<BaseResponse> loadMoreConversation(
      int conversationId, String latestDate, String load) {
    return _api.loadMoreConversation(conversationId, latestDate, load);
  }

  @override
  Future<BaseResponse> pin(int conversationId, PinRequest request) {
    return _api.pin(conversationId, request);
  }

  @override
  Future<BaseResponse> deletePin(int pinId) {
    return _api.deletePin(pinId);
  }

  @override
  Future<UserInfosResponse> searchUserInfos(
      String search, String exclude, String sort, int page, int size,
      {int? companyId, int? groupIds}) {
    return _api.searchUserInfos(
        companyId, search, exclude, groupIds, sort, page, size);
  }

  @override
  Future<ConversationResponse> searchConversation(
      String search, int page, int size, String sort,
      {int? conversationId}) {
    return _api.searchConversation(search, page, size, sort, conversationId);
  }

  @override
  Future<SearchMessageResponse> searchMessage(
      int conversationId, String latestDate, SearchChatRequest request,
      {String? load, int? page, int? size}) {
    return _api.searchMessage(conversationId, latestDate, request,
        load: load, page: page, size: size);
  }

  @override
  Future<UserConversationResponse> searchUserInConversation(
      int conversationId, String search, int page, int size) {
    return _api.searchUserInConversation(conversationId, search, page, size);
  }

  @override
  Future<GetUserByIdResponse> getUserByIds(UserByIdRequest request) {
    return _api.getUserByIds(request);
  }

  @override
  Future<BaseResponse> selectMessage(int conversationId, String latestDate) {
    return _api.selectMessage(conversationId, latestDate);
  }

  @override
  Future<TotalUnreadResponse> unread() {
    return _api.unread();
  }

  @override
  Future<BaseResponse> updateAllNotification(int notice) {
    return _api.updateAllNotification(notice);
  }

  @override
  Future<BaseResponse> updateNotification(int conversationId, int notice) {
    return _api.updateNotification(conversationId, notice);
  }

  @override
  Future<BaseResponse> updateRuleUserInGroup(
      int conversationId, Map<String, String> request) {
    return _api.updateRuleUserInGroup(conversationId, request);
  }

  @override
  Future<ProfileResponse> updateProfile(
      UpdateProfileRequest request, String idUser) {
    return _api.updateProfile(idUser, request);
  }

  @override
  Future<NotificationResponse> getNotifications(
      int page, int size, String sort) {
    return _api.getNotification(page, size, sort);
  }

  @override
  Future<BaseResponse> readNotification(String notificationId) {
    return _api.readNotification(notificationId);
  }

  @override
  Future<HomePostResponse> getPosts(
      int page, int size, String sort, ConditionsRequest request) {
    return _api.getPosts(page, size, sort, request);
  }

  @override
  Future<HomePostDetailResponse> postDetail(int postId) {
    return _api.postDetail(postId);
  }

  @override
  Future<WorkgroupResponse> postWorkgroup(int workgroupId) {
    return _api.postWorkgroup(workgroupId);
  }

  @override
  Future<ProfileResponse> getProfile(String idUser) {
    return _api.getProfile(idUser);
  }

  @override
  Future<UserMappingResponse> getProfileMappingFromHCM(String userId) {
    return _api.getProfileMappingFromHCM(userId);
  }

  @override
  Future<EmployeeInfoHCMResponse> getEmployeeProfileFromHCM(int employeeId) {
    return _api.getEmployeeProfileFromHCM(employeeId);
  }

  @override
  Future<BaseResponse> removeAccount(String userId) {
    return _api.removeAccount(userId);
  }

  @override
  Future<ChangePasswordResponse> updatePassword(UpdatePasswordRequest request) {
    return _api.updatePassword(request);
  }

  @override
  Future<UploadFileResponse> uploadFile(
      List<File> files, UploadFileRequest request) {
    return _api.uploadFile(files, request);
  }

  @override
  Future<MediaFileInfoResponse> mediaFileInfo(String fileId) {
    return _api.mediaFileInfo(fileId);
  }

  @override
  Future<BaseResponse> deleteReactionPost(int postId) {
    return _api.deleteReactionPost(postId);
  }

  @override
  Future<BaseResponse> followPost(int postId) {
    return _api.followPost(postId);
  }

  @override
  Future<BirthMonthResponse> getBirthInMonth() {
    return _api.getBirthInMonth();
  }

  @override
  Future<CommentsResponse> getComment(String application, String refType,
      int refId, String parentId, int page, int size) {
    return _api.getComment(application, refType, refId, parentId, page, size);
  }

  @override
  Future<ReactionCount> getUserReactionComment(
      String postId, String type, int page, int size) {
    return _api.getUserReactionComment(postId, type, page, size);
  }

  @override
  Future<ReactionCount> getUserReactionPost(
      int postId, String type, int page, int size) {
    return _api.getUserReactionPost(postId, type, page, size);
  }

  @override
  Future<PostViewerResponse> getUserSeen(int postId, int page, int size,
      {bool more = true, int total = 0}) {
    return _api.getUserSeen(postId, more, total, page, size);
  }

  @override
  Future<BaseResponse> reactionComment(String commentId, String type) {
    return _api.reactionComment(commentId, type);
  }

  @override
  Future<BaseResponse> reactionPost(int postId, String type) {
    return _api.reactionPost(postId, type);
  }

  @override
  Future<BaseResponse> replyComment() {
    return _api.replyComment();
  }

  @override
  Future<BaseResponse> searchUser(
      int more, String total, int page, int size, bool important) {
    return _api.searchUser(more, total, page, size, important);
  }

  @override
  Future<CommentResponse> sendComment(CommentRequest request) {
    return _api.sendComment(request);
  }

  @override
  Future<BaseResponse> sendVote(VoteRequest request) {
    return _api.sendVote([request]);
  }

  @override
  Future<BaseResponse> unfollowPost(int postId) {
    return _api.unfollowPost(postId);
  }

  @override
  Future<AttachmentPostResponse> getAttachment(int postId) {
    return _api.getAttachment(postId);
  }

  @override
  Future<BaseResponse> viewed(int postId) {
    return _api.viewed(postId);
  }

  @override
  Future<AvatarResponse> changeAvatar(File file) {
    return _api.changeAvatar(file);
  }

  @override
  Future<BaseResponse> deleteReactionComment(String commentId) {
    return _api.deleteReactionComment(commentId);
  }

  @override
  Future<ReactionResponse> reactionMessage(ReactionRequest request) {
    return _api.reactionMessage(request);
  }

  @override
  Future<BaseResponse> forwardMessage(
      String messageId, ForwardRequest request) {
    return _api.forwardMessage(messageId, request);
  }
}

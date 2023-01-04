import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/home/reaction_count.dart';
import '../request/avatar_request.dart';
import '../request/change_company_request.dart';
import '../request/comment_request.dart';
import '../request/conditions_request.dart';
import '../request/conversation_theme_request.dart';
import '../request/create_conversation_request.dart';
import '../request/device_token_request.dart';
import '../request/domain_config_request.dart';
import '../request/forward_request.dart';
import '../request/get_chat_request.dart';
import '../request/login_request.dart';
import '../request/message_request.dart';
import '../request/name_request.dart';
import '../request/pin_request.dart';
import '../request/reaction_request.dart';
import '../request/refresh_token_request.dart';
import '../request/search_chat_request.dart';
import '../request/update_password_request.dart';
import '../request/update_profile_request.dart';
import '../request/upload_file_request.dart';
import '../request/user_by_id_request.dart';
import '../request/vote_request.dart';
import '../response/auth/change_password_response.dart';
import '../response/auth/employee_info_hcm_response.dart';
import '../response/auth/token_response.dart';
import '../response/auth/user_config_response.dart';
import '../response/auth/user_infos_response.dart';
import '../response/auth/user_mapping_response.dart';
import '../response/avatar/avatar_response.dart';
import '../response/base_response.dart';
import '../response/chat/conversation_add_member_response.dart';
import '../response/chat/conversation_response.dart';
import '../response/chat/create_conversation_response.dart';
import '../response/chat/get_message_response.dart';
import '../response/chat/get_user_by_id_response.dart';
import '../response/chat/message_attach_file_response.dart';
import '../response/chat/message_pin_response.dart';
import '../response/chat/reaction_response.dart';
import '../response/chat/search_message_response.dart';
import '../response/chat/total_unread_response.dart';
import '../response/chat/user_conversation_response.dart';
import '../response/domain/domain_response.dart';
import '../response/home/attachment_post_response.dart';
import '../response/home/birth_month_response.dart';
import '../response/home/comment_response.dart';
import '../response/home/comments_response.dart';
import '../response/home/home_post_detail_response.dart';
import '../response/home/home_post_response.dart';
import '../response/home/post_viewer_response.dart';
import '../response/notification/notification_response.dart';
import '../response/profile/profile_response.dart';
import '../response/upload_file/media_file_info_response.dart';
import '../response/upload_file/upload_file_response.dart';
import '../response/workgroup/workgroup_response.dart';

part 'sicix_ui_api.g.dart';

@RestApi()
abstract class SicixUIAPI {
  factory SicixUIAPI(Dio dio, {String baseUrl}) = _SicixUIAPI;

  /* 
  
  Domain 
  
  */

  @POST('')
  Future<DomainResponse> getDomainConfig(@Body() DomainConfigRequest request);

  /* 
  
  Auth 
  
  */

  @POST('/account/auth/login')
  Future<TokenResponse> login(@Body() LoginRequest request);

  @POST('/account/auth/refresh-token')
  Future<TokenResponse> refreshToken(@Body() RefreshTokenRequest request);

  @GET('/account/mobile/user/get-user-config')
  Future<UserConfigResponse> userConfig();

  @PUT('/account/user/apply-config')
  Future<BaseResponse> changeCompany(@Body() ChangeCompanyRequest request);

  @POST('/account/auth/logout')
  Future<BaseResponse> logout(@Body() RefreshTokenRequest request);

  @PUT('/notice/register/update-device-token')
  Future<BaseResponse> updateToken(@Body() DeviceTokenRequest request);

  @DELETE('/notice/register/remove-device-token?all=0')
  Future<BaseResponse> deleteToken(
    @Body() DeviceTokenRequest request,
    @Query('all') int all,
  );

  @PUT('/account/user/disable/{id}')
  Future<BaseResponse> removeAccount(@Path('id') String userId);

  //Cập nhật thông tin người dùng
  @PUT('/account/user/{id}')
  Future<ProfileResponse> updateProfile(
    @Path('id') String userId,
    @Body() UpdateProfileRequest request,
  );

  //Cập nhật mật khẩu người dùng
  @PUT('/account/user/updatePassword')
  Future<ChangePasswordResponse> updatePassword(
      @Body() UpdatePasswordRequest updatePasswordRequest);

  @MultiPart()
  @PUT('/account/user/avatar')
  Future<AvatarResponse> changeAvatar(
    @Part(name: 'files') File file,
  );

  // Lấy thông tin chi tiết người dùng
  @GET('/account/user/{id}')
  Future<ProfileResponse> getProfile(@Path('id') String userId);

  // GET 'http://qas-api.ngdox.vn:8282/hcm/generic/employee-profile/by-user-mapping-id?userMappingId=<id_of_user>' \
  // trả về dữ liệu trong data gồm id của employee
  @GET('/hcm/generic/employee-profile/by-user-mapping-id')
  Future<UserMappingResponse> getProfileMappingFromHCM(
    @Query('userMappingId') String userId,
  );

  // GET 'http://qas-api.ngdox.vn:8282/hcm/generic/employee-profile/<id_of_employee>?include=person'
  // Lấy thông tin employee
  @GET('/hcm/generic/employee-profile/{id}?include=person')
  Future<EmployeeInfoHCMResponse> getEmployeeProfileFromHCM(
    @Path('id') int employeeId,
  );

  /*

  Home

  */

  // Lấy danh sách bài viết
  @POST('/comm/feed/filter')
  Future<HomePostResponse> getPosts(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Body() ConditionsRequest request,
  );

  // Chi tiết bài viết
  @GET('/comm/feed/{id}')
  Future<HomePostDetailResponse> postDetail(@Path('id') int postId);

  // Workgroup bài viết
  @GET('/comm/work-group/{id}')
  Future<WorkgroupResponse> postWorkgroup(@Path('id') int workgroupId);

  // Lấy file của bài viết
  @GET('/storage/attachment/comm-service/post/{id}')
  Future<AttachmentPostResponse> getAttachment(@Path('id') int postId);

  // Đánh dấu đã đọc
  @PUT('/comm/feed/reaction/{id}?type=view')
  Future<BaseResponse> viewed(@Path('id') int postId);

  // Lấy danh sách comment
  //  refId: id của bản tin
  //  parentId: id của comment cha, -1 nếu lấy comment gốc
  @GET('/comm/comments/search')
  Future<CommentsResponse> getComment(
    @Query('application') String application,
    @Query('refType') String refType,
    @Query('refId') int refId,
    @Query('parentId') String parentId,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Lấy danh sách người đã xem
  //  total=0&more=true
  @GET('/comm/feed/viewers/{id}')
  Future<PostViewerResponse> getUserSeen(
    @Path('id') int postId,
    @Query('more') bool more,
    @Query('total') int total,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Vote bài viết
  // Cho phép vote nhiều câu hỏi, và vote nhiều đáp án của cùng 1 câu hỏi, thể hiện theo mảng"
  @POST('/comm/feed/vote')
  Future<BaseResponse> sendVote(@Body() List<VoteRequest> request);

  // Tương tác bài viết
  // type=haha|wow|sad|angry|care|love|like
  @PUT('/comm/feed/reaction/{id}')
  Future<BaseResponse> reactionPost(
    @Path('id') int postId,
    @Query('type') String type,
  );

  // Xoá tương tác bài viết		http://api.ngs.vn/comm/feed/reaction/1270908363411456
  @DELETE('/comm/feed/reaction/{id}')
  Future<BaseResponse> deleteReactionPost(@Path('id') int postId);

  // Lấy danh sách người đã tương tác bài viết
  // type=haha|wow|sad|angry|care|love|like
  @GET('/comm/feed/reaction/{id}')
  Future<ReactionCount> getUserReactionPost(
    @Path('id') int postId,
    @Query('type') String type,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Follow bài viết
  // http://api.ngs.vn/comm/feed/follow/1270908363411456
  @PUT('/comm/feed/follow/{id}')
  Future<BaseResponse> followPost(
    @Path('id') int postId,
  );

  // UnFollow bài viết
  // http://api.ngs.vn/comm/feed/unfollow/1270908363411456
  @DELETE('/comm/feed/unfollow/{id}')
  Future<BaseResponse> unfollowPost(
    @Path('id') int postId,
  );

  // Gửi comment
  @POST('/comm/comments')
  Future<CommentResponse> sendComment(@Body() CommentRequest request);

  // Attach file
  @POST('/storage/attachment/upload')
  @MultiPart()
  Future<UploadFileResponse> uploadFile(
      @Part() List<File> files, @Part() UploadFileRequest attachment);

  // Lấy thông tin file, id file gốc nếu có
  @GET('/storage/file/{id}?props=id,name,contentType,ref')
  Future<MediaFileInfoResponse> mediaFileInfo(@Path('id') String fileId);

  // Tương tác với comment
  // http://api.ngs.vn/comm/comments/reaction/d7c8bbd6-38c6-4602-9560-9530384d64cc?type=wow
  @PUT('/comm/comments/reaction/{id}')
  Future<BaseResponse> reactionComment(
    @Path('id') String commentId,
    @Query('type') String type,
  );

  @DELETE('/comm/comments/reaction/{id}')
  Future<BaseResponse> deleteReactionComment(@Path('id') String commentId);

  // Lấy danh sách người tương tác comment
  // type=haha|wow|sad|angry|care|love|like
  @GET('/comm/comments/reaction/{id}')
  Future<ReactionCount> getUserReactionComment(
    @Path('id') String postId,
    @Query('type') String type,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Phản hồi comment
  // http://api.ngs.vn/comm/comments
  @POST('/comm/comments/reaction/{id}')
  Future<BaseResponse> replyComment();

  // Danh sách người SN trong tháng
  // http://api.ngs.vn/account/user/by-birth-month?groupId=0
  @GET('/account/user/by-birth-month')
  Future<BirthMonthResponse> getBirthInMonth();

  // Tìm kiếm người trong công ty để tag khi comment
  // companyId=137&search=hi&groupIds=-1
  // sort=first_name,last_name
  @GET('/account/user/search/{companyId}')
  Future<BaseResponse> searchUser(
    @Query('companyId') int more,
    @Query('search') String total,
    @Query('groupIds') int page,
    @Query('size') int size,
    @Query('important') bool important,
  );

  /*

  Notification

  */

  // Danh sách thông báo
  // Tương tự API "Lấy danh sách bài viết" có thêm thuộc tính trong payload important=true
  @GET('/chat/notice/getAll')
  Future<NotificationResponse> getNotification(@Query('page') int page,
      @Query('size') int size, @Query('sort') String sort);

  // Đánh dấu thông báo đã đọc
  @PUT('/chat/notice/disable/{id}')
  Future<BaseResponse> readNotification(@Path('id') String notificationId);

  /*

  Chat

  */

  // Lấy tổng số tin nhắn chưa đọc
  // http://api.ngs.vn/chat/conversations/unread	GET
  @GET('/chat/conversations/unread')
  Future<TotalUnreadResponse> unread();

  // Lấy danh sách đoạn hội thoại tham gia
  // http://api.ngs.vn/chat/conversations?
  // page=0&size=20&sort=modified_date,desc&id=	GET
  @GET('/chat/conversations')
  Future<ConversationResponse> getConversations(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Query('id') int? id,
  );

  // Tìm kiếm hội thoại
  // http://api.ngs.vn/chat/conversations?
  // search=Ha&page=0&size=20&sort=modified_date,desc&id=	GET
  @GET('/chat/conversations')
  Future<ConversationResponse> searchConversation(
    @Query('search') String search,
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Query('id') int? id,
  );

  // Lấy danh sách tin nhắn được ghim trong nhóm
  // http://api.ngs.vn/chat/conversations/pin/992459390409728
  // ?type=group&page=0&size=10	GET
  @GET('/chat/conversations/pin/{id}')
  Future<MessagePinResponse> conversationPin(
    @Path('id') int conversationId,
    @Query('type') String type,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Ghim tin nhắn
  // http://api.ngs.vn/chat/conversations/pin/992459390409728	POST
  @POST('/chat/conversations/pin/{id}')
  Future<BaseResponse> pin(
    @Path('id') int conversationId,
    @Body() PinRequest request,
  );

  // Xóa ghim tin nhắn
  @DELETE('/chat/conversations/pin/{id}')
  Future<BaseResponse> deletePin(@Path('id') int pinId);

  // Lấy danh sách tin nhắn đã đọc gần nhất trong hội thoại
  // http://api.ngs.vn/chat/chat/message/992459390409728?latestDate=	GET
  @GET('/chat/chat/message/{id}')
  Future<BaseResponse> lastMessageSeen(
    @Path('id') int conversationId,
    @Query('latestDate') String latestDate,
  );

  // Lấy thêm nội dung chat lên trên (load=before), xuống dưới (load=after)
  // http://api.ngs.vn/chat/chat/message/992459390409728?
  // latestDate=2021-11-18T09:59:05%2B0700&load=before	GET
  @GET('/chat/chat/message/{id}')
  Future<GetMessageResponse> getMessage(@Path('id') int conversationId,
      {@Body() GetChatRequest? request});

  // Tìm kiếm tin nhắn
  // http://api.ngs.vn/chat/chat/message/search/963160740802560?page=&zize=20	POST
  @POST('/chat/chat/message/search/{id}')
  Future<SearchMessageResponse> searchMessage(
    @Path('id') int conversationId,
    @Query('latestDate') String latestDate,
    @Body() SearchChatRequest request, {
    @Query('load') String? load,
    @Query('page') int? page,
    @Query('size') int? size,
  });

  // Click vào tin nhắn tìm thấy
  // http://api.ngs.vn/chat/chat/message/963160740802560?latestDate=2021-11-18T11:42:18%2B0700	GET
  @GET('/chat/chat/message/{id}')
  Future<BaseResponse> selectMessage(
    @Path('id') int conversationId,
    @Query('latestDate') String latestDate,
  );

  // Tìm kiếm cá nhân liên lạc
  // http://api.ngs.vn/account/user/search?
  // companyId=42&search=ha&groupIds=-1&page=0&size=20&sort=first_name,last_name
  // GET
  @GET('/account/user/search')
  Future<UserInfosResponse> searchUserInfos(
    @Query('companyId') int? companyId,
    @Query('search') String? search,
    @Query('exclude') String? exclude,
    @Query('groupIds') int? groupIds,
    @Query('sort') String sort,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Tạo mới nhóm hội thoại
  // http://api.ngs.vn/chat/conversations	POST
  // Tạo mới hội thoại cá nhân
  // http://api.ngs.vn/chat/conversations	POST
  @POST('/chat/conversations')
  Future<CreateConversationResponse> createConversation(
      @Body() CreateConversationRequest request);

  // Tìm kiếm người để tag trong hội thoại
  // http://api.ngs.vn/chat/conversations/participant/1703925338183680?search=p&page=0&size=20	GET
  @GET('/chat/conversations/participant/{id}')
  Future<UserConversationResponse> searchUserInConversation(
    @Path('id') int conversationId,
    @Query('search') String search,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Lấy thông tin user chat (có cả avatar)
  // http://api.ngs.vn/account/user/byIds	POST
  @POST('/account/user/byIds')
  Future<GetUserByIdResponse> getUserByIds(@Body() UserByIdRequest request);

  // Sửa nội dung tin nhắn
  // http://api.ngs.vn/chat/chat/message/23cde51a79ba4942b6dab4bf4c37e801	PUT
  @PUT('/chat/chat/message/{id}')
  Future<BaseResponse> editMessage(
    @Path('id') String messageId,
    @Body() MessageRequest request,
  );

  // Xoá tin nhắn
  // http://api.ngs.vn/chat/chat/message/4d50afacc8b74de496879d38452e156f	DELETE
  @DELETE('/chat/chat/message/{id}')
  Future<BaseResponse> deleteMessage(@Path('id') String messageId);

  // Đổi tên đoạn hội thoại
  // http://api.ngs.vn/chat/conversations/1703925338183680	PUT
  @PUT('/chat/conversations/{id}')
  Future<BaseResponse> changeConversationName(
    @Path('id') int conversationId,
    @Body() NameRequest request,
  );

  // Đổi ảnh đại diện hội thoại
  // http://api.ngs.vn/chat/conversations/1703925338183680	PUT
  @PUT('/chat/conversations/{id}')
  Future<BaseResponse> changeConversationAvatar(
    @Path('id') int conversationId,
    @Body() AvatarRequest request,
  );

  // Đổi màu chủ đề chat
  // http://api.ngs.vn/chat/conversations/1703925338183680	PUT
  @PUT('/chat/conversations/{id}')
  Future<BaseResponse> changeConversationTheme(
    @Path('id') int conversationId,
    @Body() ConversationThemeRequest request,
  );

  // Gán, bỏ gán nhân sự thành quản trị viên nhóm
  // http://api.ngs.vn/chat/conversations/involve/grant/1703925338183680	PUT
  @PUT('/chat/conversations/involve/grant/{id}')
  Future<BaseResponse> updateRuleUserInGroup(
    @Path('id') int conversationId,
    @Body() Map<String, String> request,
  );

  // Xoá nhân sự khỏi nhóm hội thoại
  // http://api.ngs.vn/chat/conversations/1703925338183680?
  // involves=7a8828cb-7254-4249-8fa4-3832fb49dd80	DELETE
  @DELETE('/chat/conversations/{id}')
  Future<BaseResponse> deleteUserInGroup(
    @Path('id') int conversationId,
    @Query('involves') String involves,
  );

  // Thêm nhân sự vào hội thoại
  // http://api.ngs.vn/chat/conversations/1703925338183680	PUT
  @PUT('/chat/conversations/{id}')
  Future<ConversationAddMemberResponse> addUserInGroup(
    @Path('id') int conversationId,
    @Body() CreateConversationRequest request,
  );

  // Tắt thông báo từ hội thoại đang chat
  // http://api.ngs.vn/chat/conversations/notice/1703925338183680?notice=0	PUT
  // Bật thông báo từ hội thoại đang chat
  // http://api.ngs.vn/chat/conversations/notice/1703925338183680?notice=1	PUT
  @PUT('/chat/conversations/notice/{id}')
  Future<BaseResponse> updateNotification(
    @Path('id') int conversationId,
    @Query('notice') int notice,
  );

  // Tắt tất cả thông báo từ hội thoại đang chat
  // http://api.ngs.vn/chat/conversations/notice/all?notice=0	PUT
  // Bật tất cả thông báo từ hội thoại đang chat
  // http://api.ngs.vn/chat/conversations/notice/all?notice=1	PUT
  @PUT('/chat/conversations/notice/all')
  Future<BaseResponse> updateAllNotification(@Query('notice') int notice);

  // Danh sách file MEDIA chia sẻ
  // http://api.ngs.vn/chat/chat/message/attachment/1703925338183680?type=MEDIA&page=0&size=10	GET
  // Danh sách file chia sẻ
  // http://api.ngs.vn/chat/chat/message/attachment/1703925338183680?type=FILE&page=0&size=10	GET
  @GET('/chat/chat/message/attachment/{id}')
  Future<MessageAttachFileResponse> getAttachFile(
    @Path('id') int conversationId,
    @Query('type') String type,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Rời nhóm hội thoại
  // http://api.ngs.vn/chat/conversations/leave/1703925338183680	PUT
  @PUT('/chat/conversations/leave/{id}')
  Future<BaseResponse> leaveConversation(
    @Path('id') int conversationId,
  );

  // Scroll hội thoại chat
  // http://api.ngs.vn/chat/chat/message/search/1703925338183680?
  // latestDate=2022-03-29T05:16:22%2B0700&load=before	GET
  @GET('/chat/chat/message/search/{id}')
  Future<BaseResponse> loadMoreConversation(
    @Path('id') int conversationId,
    @Query('latestDate') String latestDate,
    @Query('load') String load,
  );

  // Reaction một message chat
  @POST('/chat/chat/message/reaction')
  Future<ReactionResponse> reactionMessage(@Body() ReactionRequest request);

  // Reaction một message chat
  @POST('/chat/chat/message/forward/{id}')
  Future<BaseResponse> forwardMessage(
    @Path('id') String messageId,
    @Body() ForwardRequest request,
  );
}

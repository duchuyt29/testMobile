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

  //C???p nh???t th??ng tin ng?????i d??ng
  @PUT('/account/user/{id}')
  Future<ProfileResponse> updateProfile(
    @Path('id') String userId,
    @Body() UpdateProfileRequest request,
  );

  //C???p nh???t m???t kh???u ng?????i d??ng
  @PUT('/account/user/updatePassword')
  Future<ChangePasswordResponse> updatePassword(
      @Body() UpdatePasswordRequest updatePasswordRequest);

  @MultiPart()
  @PUT('/account/user/avatar')
  Future<AvatarResponse> changeAvatar(
    @Part(name: 'files') File file,
  );

  // L???y th??ng tin chi ti???t ng?????i d??ng
  @GET('/account/user/{id}')
  Future<ProfileResponse> getProfile(@Path('id') String userId);

  // GET 'http://qas-api.ngdox.vn:8282/hcm/generic/employee-profile/by-user-mapping-id?userMappingId=<id_of_user>' \
  // tr??? v??? d??? li???u trong data g???m id c???a employee
  @GET('/hcm/generic/employee-profile/by-user-mapping-id')
  Future<UserMappingResponse> getProfileMappingFromHCM(
    @Query('userMappingId') String userId,
  );

  // GET 'http://qas-api.ngdox.vn:8282/hcm/generic/employee-profile/<id_of_employee>?include=person'
  // L???y th??ng tin employee
  @GET('/hcm/generic/employee-profile/{id}?include=person')
  Future<EmployeeInfoHCMResponse> getEmployeeProfileFromHCM(
    @Path('id') int employeeId,
  );

  /*

  Home

  */

  // L???y danh s??ch b??i vi???t
  @POST('/comm/feed/filter')
  Future<HomePostResponse> getPosts(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Body() ConditionsRequest request,
  );

  // Chi ti???t b??i vi???t
  @GET('/comm/feed/{id}')
  Future<HomePostDetailResponse> postDetail(@Path('id') int postId);

  // Workgroup b??i vi???t
  @GET('/comm/work-group/{id}')
  Future<WorkgroupResponse> postWorkgroup(@Path('id') int workgroupId);

  // L???y file c???a b??i vi???t
  @GET('/storage/attachment/comm-service/post/{id}')
  Future<AttachmentPostResponse> getAttachment(@Path('id') int postId);

  // ????nh d???u ???? ?????c
  @PUT('/comm/feed/reaction/{id}?type=view')
  Future<BaseResponse> viewed(@Path('id') int postId);

  // L???y danh s??ch comment
  //  refId: id c???a b???n tin
  //  parentId: id c???a comment cha, -1 n???u l???y comment g???c
  @GET('/comm/comments/search')
  Future<CommentsResponse> getComment(
    @Query('application') String application,
    @Query('refType') String refType,
    @Query('refId') int refId,
    @Query('parentId') String parentId,
    @Query('page') int page,
    @Query('size') int size,
  );

  // L???y danh s??ch ng?????i ???? xem
  //  total=0&more=true
  @GET('/comm/feed/viewers/{id}')
  Future<PostViewerResponse> getUserSeen(
    @Path('id') int postId,
    @Query('more') bool more,
    @Query('total') int total,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Vote b??i vi???t
  // Cho ph??p vote nhi???u c??u h???i, v?? vote nhi???u ????p ??n c???a c??ng 1 c??u h???i, th??? hi???n theo m???ng"
  @POST('/comm/feed/vote')
  Future<BaseResponse> sendVote(@Body() List<VoteRequest> request);

  // T????ng t??c b??i vi???t
  // type=haha|wow|sad|angry|care|love|like
  @PUT('/comm/feed/reaction/{id}')
  Future<BaseResponse> reactionPost(
    @Path('id') int postId,
    @Query('type') String type,
  );

  // Xo?? t????ng t??c b??i vi???t		http://api.ngs.vn/comm/feed/reaction/1270908363411456
  @DELETE('/comm/feed/reaction/{id}')
  Future<BaseResponse> deleteReactionPost(@Path('id') int postId);

  // L???y danh s??ch ng?????i ???? t????ng t??c b??i vi???t
  // type=haha|wow|sad|angry|care|love|like
  @GET('/comm/feed/reaction/{id}')
  Future<ReactionCount> getUserReactionPost(
    @Path('id') int postId,
    @Query('type') String type,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Follow b??i vi???t
  // http://api.ngs.vn/comm/feed/follow/1270908363411456
  @PUT('/comm/feed/follow/{id}')
  Future<BaseResponse> followPost(
    @Path('id') int postId,
  );

  // UnFollow b??i vi???t
  // http://api.ngs.vn/comm/feed/unfollow/1270908363411456
  @DELETE('/comm/feed/unfollow/{id}')
  Future<BaseResponse> unfollowPost(
    @Path('id') int postId,
  );

  // G???i comment
  @POST('/comm/comments')
  Future<CommentResponse> sendComment(@Body() CommentRequest request);

  // Attach file
  @POST('/storage/attachment/upload')
  @MultiPart()
  Future<UploadFileResponse> uploadFile(
      @Part() List<File> files, @Part() UploadFileRequest attachment);

  // L???y th??ng tin file, id file g???c n???u c??
  @GET('/storage/file/{id}?props=id,name,contentType,ref')
  Future<MediaFileInfoResponse> mediaFileInfo(@Path('id') String fileId);

  // T????ng t??c v???i comment
  // http://api.ngs.vn/comm/comments/reaction/d7c8bbd6-38c6-4602-9560-9530384d64cc?type=wow
  @PUT('/comm/comments/reaction/{id}')
  Future<BaseResponse> reactionComment(
    @Path('id') String commentId,
    @Query('type') String type,
  );

  @DELETE('/comm/comments/reaction/{id}')
  Future<BaseResponse> deleteReactionComment(@Path('id') String commentId);

  // L???y danh s??ch ng?????i t????ng t??c comment
  // type=haha|wow|sad|angry|care|love|like
  @GET('/comm/comments/reaction/{id}')
  Future<ReactionCount> getUserReactionComment(
    @Path('id') String postId,
    @Query('type') String type,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Ph???n h???i comment
  // http://api.ngs.vn/comm/comments
  @POST('/comm/comments/reaction/{id}')
  Future<BaseResponse> replyComment();

  // Danh s??ch ng?????i SN trong th??ng
  // http://api.ngs.vn/account/user/by-birth-month?groupId=0
  @GET('/account/user/by-birth-month')
  Future<BirthMonthResponse> getBirthInMonth();

  // T??m ki???m ng?????i trong c??ng ty ????? tag khi comment
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

  // Danh s??ch th??ng b??o
  // T????ng t??? API "L???y danh s??ch b??i vi???t" c?? th??m thu???c t??nh trong payload important=true
  @GET('/chat/notice/getAll')
  Future<NotificationResponse> getNotification(@Query('page') int page,
      @Query('size') int size, @Query('sort') String sort);

  // ????nh d???u th??ng b??o ???? ?????c
  @PUT('/chat/notice/disable/{id}')
  Future<BaseResponse> readNotification(@Path('id') String notificationId);

  /*

  Chat

  */

  // L???y t???ng s??? tin nh???n ch??a ?????c
  // http://api.ngs.vn/chat/conversations/unread	GET
  @GET('/chat/conversations/unread')
  Future<TotalUnreadResponse> unread();

  // L???y danh s??ch ??o???n h???i tho???i tham gia
  // http://api.ngs.vn/chat/conversations?
  // page=0&size=20&sort=modified_date,desc&id=	GET
  @GET('/chat/conversations')
  Future<ConversationResponse> getConversations(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Query('id') int? id,
  );

  // T??m ki???m h???i tho???i
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

  // L???y danh s??ch tin nh???n ???????c ghim trong nh??m
  // http://api.ngs.vn/chat/conversations/pin/992459390409728
  // ?type=group&page=0&size=10	GET
  @GET('/chat/conversations/pin/{id}')
  Future<MessagePinResponse> conversationPin(
    @Path('id') int conversationId,
    @Query('type') String type,
    @Query('page') int page,
    @Query('size') int size,
  );

  // Ghim tin nh???n
  // http://api.ngs.vn/chat/conversations/pin/992459390409728	POST
  @POST('/chat/conversations/pin/{id}')
  Future<BaseResponse> pin(
    @Path('id') int conversationId,
    @Body() PinRequest request,
  );

  // X??a ghim tin nh???n
  @DELETE('/chat/conversations/pin/{id}')
  Future<BaseResponse> deletePin(@Path('id') int pinId);

  // L???y danh s??ch tin nh???n ???? ?????c g???n nh???t trong h???i tho???i
  // http://api.ngs.vn/chat/chat/message/992459390409728?latestDate=	GET
  @GET('/chat/chat/message/{id}')
  Future<BaseResponse> lastMessageSeen(
    @Path('id') int conversationId,
    @Query('latestDate') String latestDate,
  );

  // L???y th??m n???i dung chat l??n tr??n (load=before), xu???ng d?????i (load=after)
  // http://api.ngs.vn/chat/chat/message/992459390409728?
  // latestDate=2021-11-18T09:59:05%2B0700&load=before	GET
  @GET('/chat/chat/message/{id}')
  Future<GetMessageResponse> getMessage(@Path('id') int conversationId,
      {@Body() GetChatRequest? request});

  // T??m ki???m tin nh???n
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

  // Click v??o tin nh???n t??m th???y
  // http://api.ngs.vn/chat/chat/message/963160740802560?latestDate=2021-11-18T11:42:18%2B0700	GET
  @GET('/chat/chat/message/{id}')
  Future<BaseResponse> selectMessage(
    @Path('id') int conversationId,
    @Query('latestDate') String latestDate,
  );

  // T??m ki???m c?? nh??n li??n l???c
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

  // T???o m???i nh??m h???i tho???i
  // http://api.ngs.vn/chat/conversations	POST
  // T???o m???i h???i tho???i c?? nh??n
  // http://api.ngs.vn/chat/conversations	POST
  @POST('/chat/conversations')
  Future<CreateConversationResponse> createConversation(
      @Body() CreateConversationRequest request);

  // T??m ki???m ng?????i ????? tag trong h???i tho???i
  // http://api.ngs.vn/chat/conversations/participant/1703925338183680?search=p&page=0&size=20	GET
  @GET('/chat/conversations/participant/{id}')
  Future<UserConversationResponse> searchUserInConversation(
    @Path('id') int conversationId,
    @Query('search') String search,
    @Query('page') int page,
    @Query('size') int size,
  );

  // L???y th??ng tin user chat (c?? c??? avatar)
  // http://api.ngs.vn/account/user/byIds	POST
  @POST('/account/user/byIds')
  Future<GetUserByIdResponse> getUserByIds(@Body() UserByIdRequest request);

  // S???a n???i dung tin nh???n
  // http://api.ngs.vn/chat/chat/message/23cde51a79ba4942b6dab4bf4c37e801	PUT
  @PUT('/chat/chat/message/{id}')
  Future<BaseResponse> editMessage(
    @Path('id') String messageId,
    @Body() MessageRequest request,
  );

  // Xo?? tin nh???n
  // http://api.ngs.vn/chat/chat/message/4d50afacc8b74de496879d38452e156f	DELETE
  @DELETE('/chat/chat/message/{id}')
  Future<BaseResponse> deleteMessage(@Path('id') String messageId);

  // ?????i t??n ??o???n h???i tho???i
  // http://api.ngs.vn/chat/conversations/1703925338183680	PUT
  @PUT('/chat/conversations/{id}')
  Future<BaseResponse> changeConversationName(
    @Path('id') int conversationId,
    @Body() NameRequest request,
  );

  // ?????i ???nh ?????i di???n h???i tho???i
  // http://api.ngs.vn/chat/conversations/1703925338183680	PUT
  @PUT('/chat/conversations/{id}')
  Future<BaseResponse> changeConversationAvatar(
    @Path('id') int conversationId,
    @Body() AvatarRequest request,
  );

  // ?????i m??u ch??? ????? chat
  // http://api.ngs.vn/chat/conversations/1703925338183680	PUT
  @PUT('/chat/conversations/{id}')
  Future<BaseResponse> changeConversationTheme(
    @Path('id') int conversationId,
    @Body() ConversationThemeRequest request,
  );

  // G??n, b??? g??n nh??n s??? th??nh qu???n tr??? vi??n nh??m
  // http://api.ngs.vn/chat/conversations/involve/grant/1703925338183680	PUT
  @PUT('/chat/conversations/involve/grant/{id}')
  Future<BaseResponse> updateRuleUserInGroup(
    @Path('id') int conversationId,
    @Body() Map<String, String> request,
  );

  // Xo?? nh??n s??? kh???i nh??m h???i tho???i
  // http://api.ngs.vn/chat/conversations/1703925338183680?
  // involves=7a8828cb-7254-4249-8fa4-3832fb49dd80	DELETE
  @DELETE('/chat/conversations/{id}')
  Future<BaseResponse> deleteUserInGroup(
    @Path('id') int conversationId,
    @Query('involves') String involves,
  );

  // Th??m nh??n s??? v??o h???i tho???i
  // http://api.ngs.vn/chat/conversations/1703925338183680	PUT
  @PUT('/chat/conversations/{id}')
  Future<ConversationAddMemberResponse> addUserInGroup(
    @Path('id') int conversationId,
    @Body() CreateConversationRequest request,
  );

  // T???t th??ng b??o t??? h???i tho???i ??ang chat
  // http://api.ngs.vn/chat/conversations/notice/1703925338183680?notice=0	PUT
  // B???t th??ng b??o t??? h???i tho???i ??ang chat
  // http://api.ngs.vn/chat/conversations/notice/1703925338183680?notice=1	PUT
  @PUT('/chat/conversations/notice/{id}')
  Future<BaseResponse> updateNotification(
    @Path('id') int conversationId,
    @Query('notice') int notice,
  );

  // T???t t???t c??? th??ng b??o t??? h???i tho???i ??ang chat
  // http://api.ngs.vn/chat/conversations/notice/all?notice=0	PUT
  // B???t t???t c??? th??ng b??o t??? h???i tho???i ??ang chat
  // http://api.ngs.vn/chat/conversations/notice/all?notice=1	PUT
  @PUT('/chat/conversations/notice/all')
  Future<BaseResponse> updateAllNotification(@Query('notice') int notice);

  // Danh s??ch file MEDIA chia s???
  // http://api.ngs.vn/chat/chat/message/attachment/1703925338183680?type=MEDIA&page=0&size=10	GET
  // Danh s??ch file chia s???
  // http://api.ngs.vn/chat/chat/message/attachment/1703925338183680?type=FILE&page=0&size=10	GET
  @GET('/chat/chat/message/attachment/{id}')
  Future<MessageAttachFileResponse> getAttachFile(
    @Path('id') int conversationId,
    @Query('type') String type,
    @Query('page') int page,
    @Query('size') int size,
  );

  // R???i nh??m h???i tho???i
  // http://api.ngs.vn/chat/conversations/leave/1703925338183680	PUT
  @PUT('/chat/conversations/leave/{id}')
  Future<BaseResponse> leaveConversation(
    @Path('id') int conversationId,
  );

  // Scroll h???i tho???i chat
  // http://api.ngs.vn/chat/chat/message/search/1703925338183680?
  // latestDate=2022-03-29T05:16:22%2B0700&load=before	GET
  @GET('/chat/chat/message/search/{id}')
  Future<BaseResponse> loadMoreConversation(
    @Path('id') int conversationId,
    @Query('latestDate') String latestDate,
    @Query('load') String load,
  );

  // Reaction m???t message chat
  @POST('/chat/chat/message/reaction')
  Future<ReactionResponse> reactionMessage(@Body() ReactionRequest request);

  // Reaction m???t message chat
  @POST('/chat/chat/message/forward/{id}')
  Future<BaseResponse> forwardMessage(
    @Path('id') String messageId,
    @Body() ForwardRequest request,
  );
}

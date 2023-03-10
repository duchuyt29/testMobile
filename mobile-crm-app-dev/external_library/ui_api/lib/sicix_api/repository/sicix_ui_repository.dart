import 'dart:io';

import '../models/home/reaction_count.dart';
import '../request/avatar_request.dart';
import '../request/change_company_request.dart';
import '../request/comment_request.dart';
import '../request/conditions_request.dart';
import '../request/conversation_theme_request.dart';
import '../request/create_conversation_request.dart';
import '../request/device_token_request.dart';
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

abstract class SicixUIRepository {
  /* 
  
  Auth 
  
  */

  Future<TokenResponse> login(LoginRequest request);

  Future<TokenResponse> refreshToken(RefreshTokenRequest request);

  Future<UserConfigResponse> userConfig();

  Future<BaseResponse> changeCompany(ChangeCompanyRequest request);

  Future<BaseResponse> logout(RefreshTokenRequest request);

  Future<BaseResponse> updateToken(DeviceTokenRequest request);

  Future<BaseResponse> deleteToken(DeviceTokenRequest request, int all);

  //C???p nh???t m???t kh???u ng?????i d??ng
  Future<ChangePasswordResponse> updatePassword(UpdatePasswordRequest request);

  // C???p nh???t th??ng tin ng?????i d??ng
  Future<ProfileResponse> updateProfile(
      UpdateProfileRequest request, String idUser);

  // L???y th??ng tin chi ti???t ng?????i d??ng
  Future<ProfileResponse> getProfile(String userId);

  // tr??? v??? d??? li???u trong data g???m id c???a employee
  Future<UserMappingResponse> getProfileMappingFromHCM(String userId);

  // L???y th??ng tin nh??n vi??n
  Future<EmployeeInfoHCMResponse> getEmployeeProfileFromHCM(int employeeId);

  // X??a ng?????i d??ng
  Future<BaseResponse> removeAccount(String userId);

  /*

  Chat

  */

  // L???y t???ng s??? tin nh???n ch??a ?????c
  Future<TotalUnreadResponse> unread();

  // L???y danh s??ch ??o???n h???i tho???i tham gia
  Future<ConversationResponse> getConversations(int page, int size, String sort,
      {int? conversationId});

  // L???y danh s??ch tin nh???n ???????c ghim trong nh??m
  Future<MessagePinResponse> conversationPin(
      int conversationId, String type, int page, int size);

  // Ghim tin nh???n
  Future<BaseResponse> pin(int conversationId, PinRequest request);

  // X??a ghim tin nh???n
  Future<BaseResponse> deletePin(int pinId);

  // L???y danh s??ch tin nh???n ???? ?????c g???n nh???t trong h???i tho???i
  Future<BaseResponse> lastMessageSeen(int conversationId, String latestDate);

  // L???y th??m n???i dung chat l??n tr??n
  Future<GetMessageResponse> getMessage(int conversationId,
      {GetChatRequest? request});

  // T??m ki???m tin nh???n
  Future<SearchMessageResponse> searchMessage(
      int conversationId, String latestDate, SearchChatRequest request,
      {String? load, int? page, int? size});

  // Click v??o tin nh???n t??m th???y
  Future<BaseResponse> selectMessage(int conversationId, String latestDate);

  // T??m ki???m h???i tho???i
  Future<ConversationResponse> searchConversation(
      String search, int page, int size, String sort,
      {int? conversationId});

  // T??m ki???m c?? nh??n li??n l???c
  Future<UserInfosResponse> searchUserInfos(
      String search, String exclude, String sort, int page, int size,
      {int? companyId, int? groupIds});

  // T???o m???i nh??m h???i tho???i
  // T???o m???i h???i tho???i c?? nh??n
  Future<CreateConversationResponse> createConversation(
      CreateConversationRequest request);

  // T??m ki???m ng?????i ????? tag trong h???i tho???i
  Future<UserConversationResponse> searchUserInConversation(
      int conversationId, String search, int page, int size);

  // L???y th??ng tin user chat (c?? c??? avatar)
  Future<GetUserByIdResponse> getUserByIds(UserByIdRequest request);

  // S???a n???i dung tin nh???n
  Future<BaseResponse> editMessage(String messageId, MessageRequest request);

  // Xo?? tin nh???n
  Future<BaseResponse> deleteMessage(String messageId);

  // ?????i t??n ??o???n h???i tho???i
  Future<BaseResponse> changeConversationName(
      int conversationId, NameRequest request);

  // ?????i ???nh ?????i di???n h???i tho???i
  // http://api.ngs.vn/nspace/chat/conversations/1703925338183680	PUT
  Future<BaseResponse> changeConversationAvatar(
      int conversationId, AvatarRequest request);

  // ?????i m??u ch??? ????? chat
  Future<BaseResponse> changeConversationTheme(
      int conversationId, ConversationThemeRequest request);

  // G??n, b??? g??n nh??n s??? th??nh qu???n tr??? vi??n nh??m
  Future<BaseResponse> updateRuleUserInGroup(
      int conversationId, Map<String, String> request);

  // Xo?? nh??n s??? kh???i nh??m h???i tho???i
  Future<BaseResponse> deleteUserInGroup(int conversationId, String involves);

  // Th??m nh??n s??? v??o h???i tho???i
  Future<ConversationAddMemberResponse> addUserInGroup(
      int conversationId, CreateConversationRequest request);

  // T???t th??ng b??o t??? h???i tho???i ??ang chat
  // B???t th??ng b??o t??? h???i tho???i ??ang chat
  Future<BaseResponse> updateNotification(int conversationId, int notice);

  // T???t b???t th??ng b??o all
  Future<BaseResponse> updateAllNotification(int notice);

  // Danh s??ch file MEDIA chia s???
  // Danh s??ch file chia s???
  Future<MessageAttachFileResponse> getAttachFile(
      int conversationId, String type, int page, int size);

  // R???i nh??m h???i tho???i
  Future<BaseResponse> leaveConversation(int conversationId);

  // Scroll h???i tho???i chat
  Future<BaseResponse> loadMoreConversation(
      int conversationId, String latestDate, String load);

  // Reaction m???t message chat
  Future<ReactionResponse> reactionMessage(ReactionRequest request);

  // Forward m???t message chat
  Future<BaseResponse> forwardMessage(String messageId, ForwardRequest request);

  /*

  Notification

  */

  Future<NotificationResponse> getNotifications(
      int page, int size, String sort);

  Future<BaseResponse> readNotification(String notificationId);

  /*

  Home

  */

  // L???y danh s??ch b??i Post trang ch???
  Future<HomePostResponse> getPosts(
      int page, int size, String sort, ConditionsRequest request);

  // Chi ti???t b??i vi???t
  Future<HomePostDetailResponse> postDetail(int postId);

  // Workgroup b??i vi???t
  Future<WorkgroupResponse> postWorkgroup(int workgroupId);

  // L???y file c???a b??i vi???t
  Future<AttachmentPostResponse> getAttachment(int postId);

  // ????nh d???u ???? ?????c
  Future<BaseResponse> viewed(int postId);

  // L???y danh s??ch comment
  //  refId: id c???a b???n tin
  //  parentId: id c???a comment cha, -1 n???u l???y comment g???c
  Future<CommentsResponse> getComment(
    String application,
    String refType,
    int refId,
    String parentId,
    int page,
    int size,
  );

  // L???y danh s??ch ng?????i ???? xem
  //  total=0&more=true
  Future<PostViewerResponse> getUserSeen(int postId, int page, int size,
      {bool more = true, int total});

  // Vote b??i vi???t
  // Cho ph??p vote nhi???u c??u h???i, v?? vote nhi???u ????p ??n c???a c??ng 1 c??u h???i, th??? hi???n theo m???ng"
  Future<BaseResponse> sendVote(VoteRequest request);

  // T????ng t??c b??i vi???t
  // type=haha|wow|sad|angry|care|love|like
  Future<BaseResponse> reactionPost(
    int postId,
    String type,
  );

  // Xo?? t????ng t??c b??i vi???t		http://api.ngs.vn/nspace/comm/feed/reaction/1270908363411456
  Future<BaseResponse> deleteReactionPost(int postId);

  // L???y danh s??ch ng?????i ???? t????ng t??c b??i vi???t
  // type=haha|wow|sad|angry|care|love|like
  Future<ReactionCount> getUserReactionPost(
    int postId,
    String type,
    int page,
    int size,
  );

  // Follow b??i vi???t
  // http://api.ngs.vn/nspace/comm/feed/follow/1270908363411456
  Future<BaseResponse> followPost(
    int postId,
  );

  // UnFollow b??i vi???t
  // http://api.ngs.vn/nspace/comm/feed/unfollow/1270908363411456
  Future<BaseResponse> unfollowPost(
    int postId,
  );

  // G???i comment
  Future<CommentResponse> sendComment(CommentRequest request);

  // Attach file
  Future<UploadFileResponse> uploadFile(
      List<File> files, UploadFileRequest request);

  // L???y th??ng tin file, id file g???c n???u c??
  Future<MediaFileInfoResponse> mediaFileInfo(String fileId);

  // T????ng t??c v???i comment
  // http://api.ngs.vn/nspace/comm/comments/reaction/d7c8bbd6-38c6-4602-9560-9530384d64cc?type=wow
  Future<BaseResponse> reactionComment(
    String commentId,
    String type,
  );

  Future<BaseResponse> deleteReactionComment(String commentId);

  // L???y danh s??ch ng?????i t????ng t??c comment
  // type=haha|wow|sad|angry|care|love|like
  Future<ReactionCount> getUserReactionComment(
    String postId,
    String type,
    int page,
    int size,
  );

  // Ph???n h???i comment
  // http://api.ngs.vn/nspace/comm/comments
  Future<BaseResponse> replyComment();

  // Danh s??ch ng?????i SN trong th??ng
  // http://api.ngs.vn/nspace/account/user/by-birth-month?groupId=0
  Future<BirthMonthResponse> getBirthInMonth();

  // T??m ki???m ng?????i trong c??ng ty ????? tag khi comment
  // companyId=137&search=hi&groupIds=-1
  // sort=first_name,last_name
  Future<BaseResponse> searchUser(
    int more,
    String total,
    int page,
    int size,
    bool important,
  );

  //Thay ?????i ???nh ?????i di???n
  Future<AvatarResponse> changeAvatar(
    File file,
  );
}

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

  //Cập nhật mật khẩu người dùng
  Future<ChangePasswordResponse> updatePassword(UpdatePasswordRequest request);

  // Cập nhật thông tin người dùng
  Future<ProfileResponse> updateProfile(
      UpdateProfileRequest request, String idUser);

  // Lấy thông tin chi tiết người dùng
  Future<ProfileResponse> getProfile(String userId);

  // trả về dữ liệu trong data gồm id của employee
  Future<UserMappingResponse> getProfileMappingFromHCM(String userId);

  // Lấy thông tin nhân viên
  Future<EmployeeInfoHCMResponse> getEmployeeProfileFromHCM(int employeeId);

  // Xóa người dùng
  Future<BaseResponse> removeAccount(String userId);

  /*

  Chat

  */

  // Lấy tổng số tin nhắn chưa đọc
  Future<TotalUnreadResponse> unread();

  // Lấy danh sách đoạn hội thoại tham gia
  Future<ConversationResponse> getConversations(int page, int size, String sort,
      {int? conversationId});

  // Lấy danh sách tin nhắn được ghim trong nhóm
  Future<MessagePinResponse> conversationPin(
      int conversationId, String type, int page, int size);

  // Ghim tin nhắn
  Future<BaseResponse> pin(int conversationId, PinRequest request);

  // Xóa ghim tin nhắn
  Future<BaseResponse> deletePin(int pinId);

  // Lấy danh sách tin nhắn đã đọc gần nhất trong hội thoại
  Future<BaseResponse> lastMessageSeen(int conversationId, String latestDate);

  // Lấy thêm nội dung chat lên trên
  Future<GetMessageResponse> getMessage(int conversationId,
      {GetChatRequest? request});

  // Tìm kiếm tin nhắn
  Future<SearchMessageResponse> searchMessage(
      int conversationId, String latestDate, SearchChatRequest request,
      {String? load, int? page, int? size});

  // Click vào tin nhắn tìm thấy
  Future<BaseResponse> selectMessage(int conversationId, String latestDate);

  // Tìm kiếm hội thoại
  Future<ConversationResponse> searchConversation(
      String search, int page, int size, String sort,
      {int? conversationId});

  // Tìm kiếm cá nhân liên lạc
  Future<UserInfosResponse> searchUserInfos(
      String search, String exclude, String sort, int page, int size,
      {int? companyId, int? groupIds});

  // Tạo mới nhóm hội thoại
  // Tạo mới hội thoại cá nhân
  Future<CreateConversationResponse> createConversation(
      CreateConversationRequest request);

  // Tìm kiếm người để tag trong hội thoại
  Future<UserConversationResponse> searchUserInConversation(
      int conversationId, String search, int page, int size);

  // Lấy thông tin user chat (có cả avatar)
  Future<GetUserByIdResponse> getUserByIds(UserByIdRequest request);

  // Sửa nội dung tin nhắn
  Future<BaseResponse> editMessage(String messageId, MessageRequest request);

  // Xoá tin nhắn
  Future<BaseResponse> deleteMessage(String messageId);

  // Đổi tên đoạn hội thoại
  Future<BaseResponse> changeConversationName(
      int conversationId, NameRequest request);

  // Đổi ảnh đại diện hội thoại
  // http://api.ngs.vn/nspace/chat/conversations/1703925338183680	PUT
  Future<BaseResponse> changeConversationAvatar(
      int conversationId, AvatarRequest request);

  // Đổi màu chủ đề chat
  Future<BaseResponse> changeConversationTheme(
      int conversationId, ConversationThemeRequest request);

  // Gán, bỏ gán nhân sự thành quản trị viên nhóm
  Future<BaseResponse> updateRuleUserInGroup(
      int conversationId, Map<String, String> request);

  // Xoá nhân sự khỏi nhóm hội thoại
  Future<BaseResponse> deleteUserInGroup(int conversationId, String involves);

  // Thêm nhân sự vào hội thoại
  Future<ConversationAddMemberResponse> addUserInGroup(
      int conversationId, CreateConversationRequest request);

  // Tắt thông báo từ hội thoại đang chat
  // Bật thông báo từ hội thoại đang chat
  Future<BaseResponse> updateNotification(int conversationId, int notice);

  // Tắt bật thông báo all
  Future<BaseResponse> updateAllNotification(int notice);

  // Danh sách file MEDIA chia sẻ
  // Danh sách file chia sẻ
  Future<MessageAttachFileResponse> getAttachFile(
      int conversationId, String type, int page, int size);

  // Rời nhóm hội thoại
  Future<BaseResponse> leaveConversation(int conversationId);

  // Scroll hội thoại chat
  Future<BaseResponse> loadMoreConversation(
      int conversationId, String latestDate, String load);

  // Reaction một message chat
  Future<ReactionResponse> reactionMessage(ReactionRequest request);

  // Forward một message chat
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

  // Lấy danh sách bài Post trang chủ
  Future<HomePostResponse> getPosts(
      int page, int size, String sort, ConditionsRequest request);

  // Chi tiết bài viết
  Future<HomePostDetailResponse> postDetail(int postId);

  // Workgroup bài viết
  Future<WorkgroupResponse> postWorkgroup(int workgroupId);

  // Lấy file của bài viết
  Future<AttachmentPostResponse> getAttachment(int postId);

  // Đánh dấu đã đọc
  Future<BaseResponse> viewed(int postId);

  // Lấy danh sách comment
  //  refId: id của bản tin
  //  parentId: id của comment cha, -1 nếu lấy comment gốc
  Future<CommentsResponse> getComment(
    String application,
    String refType,
    int refId,
    String parentId,
    int page,
    int size,
  );

  // Lấy danh sách người đã xem
  //  total=0&more=true
  Future<PostViewerResponse> getUserSeen(int postId, int page, int size,
      {bool more = true, int total});

  // Vote bài viết
  // Cho phép vote nhiều câu hỏi, và vote nhiều đáp án của cùng 1 câu hỏi, thể hiện theo mảng"
  Future<BaseResponse> sendVote(VoteRequest request);

  // Tương tác bài viết
  // type=haha|wow|sad|angry|care|love|like
  Future<BaseResponse> reactionPost(
    int postId,
    String type,
  );

  // Xoá tương tác bài viết		http://api.ngs.vn/nspace/comm/feed/reaction/1270908363411456
  Future<BaseResponse> deleteReactionPost(int postId);

  // Lấy danh sách người đã tương tác bài viết
  // type=haha|wow|sad|angry|care|love|like
  Future<ReactionCount> getUserReactionPost(
    int postId,
    String type,
    int page,
    int size,
  );

  // Follow bài viết
  // http://api.ngs.vn/nspace/comm/feed/follow/1270908363411456
  Future<BaseResponse> followPost(
    int postId,
  );

  // UnFollow bài viết
  // http://api.ngs.vn/nspace/comm/feed/unfollow/1270908363411456
  Future<BaseResponse> unfollowPost(
    int postId,
  );

  // Gửi comment
  Future<CommentResponse> sendComment(CommentRequest request);

  // Attach file
  Future<UploadFileResponse> uploadFile(
      List<File> files, UploadFileRequest request);

  // Lấy thông tin file, id file gốc nếu có
  Future<MediaFileInfoResponse> mediaFileInfo(String fileId);

  // Tương tác với comment
  // http://api.ngs.vn/nspace/comm/comments/reaction/d7c8bbd6-38c6-4602-9560-9530384d64cc?type=wow
  Future<BaseResponse> reactionComment(
    String commentId,
    String type,
  );

  Future<BaseResponse> deleteReactionComment(String commentId);

  // Lấy danh sách người tương tác comment
  // type=haha|wow|sad|angry|care|love|like
  Future<ReactionCount> getUserReactionComment(
    String postId,
    String type,
    int page,
    int size,
  );

  // Phản hồi comment
  // http://api.ngs.vn/nspace/comm/comments
  Future<BaseResponse> replyComment();

  // Danh sách người SN trong tháng
  // http://api.ngs.vn/nspace/account/user/by-birth-month?groupId=0
  Future<BirthMonthResponse> getBirthInMonth();

  // Tìm kiếm người trong công ty để tag khi comment
  // companyId=137&search=hi&groupIds=-1
  // sort=first_name,last_name
  Future<BaseResponse> searchUser(
    int more,
    String total,
    int page,
    int size,
    bool important,
  );

  //Thay đổi ảnh đại diện
  Future<AvatarResponse> changeAvatar(
    File file,
  );
}

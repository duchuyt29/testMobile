import 'package:get/get.dart';

import '../../modules/sicix/account/change_avatar/binding/change_avatar_binding.dart';
import '../../modules/sicix/account/change_avatar/view/change_avatar_screen.dart';
import '../../modules/sicix/account/change_language/binding/change_language_binding.dart';
import '../../modules/sicix/account/change_language/view/change_language_screen.dart';
import '../../modules/sicix/account/change_password/binding/change_password_binding.dart';
import '../../modules/sicix/account/change_password/view/change_password_screen.dart';
import '../../modules/sicix/account/edit_profile/binding/edit_profile_binding.dart';
import '../../modules/sicix/account/edit_profile/view/edit_profile_screen.dart';
import '../../modules/sicix/account/profile_detail/bindings/profile_detail_binding.dart';
import '../../modules/sicix/account/profile_detail/views/profile_detail_screen.dart';
import '../../modules/sicix/auth/choose_company/bindings/choose_company_binding.dart';
import '../../modules/sicix/auth/choose_company/views/choose_company_screen.dart';
import '../../modules/sicix/auth/login/bindings/login_binding.dart';
import '../../modules/sicix/auth/login/views/login_screen.dart';
import '../../modules/sicix/conversation/add_member_group_conversation/bindings/add_member_group_conversation_binding.dart';
import '../../modules/sicix/conversation/add_member_group_conversation/views/add_member_group_conversation_screen.dart';
import '../../modules/sicix/conversation/chat/bindings/chat_binding.dart';
import '../../modules/sicix/conversation/chat/views/chat_screen.dart';
import '../../modules/sicix/conversation/chat_media/bindings/chat_media_binding.dart';
import '../../modules/sicix/conversation/chat_media/views/chat_media_screen.dart';
import '../../modules/sicix/conversation/chat_search/bindings/chat_search_binding.dart';
import '../../modules/sicix/conversation/chat_search/views/chat_search_screen.dart';
import '../../modules/sicix/conversation/conversation_search/bindings/conversation_search_binding.dart';
import '../../modules/sicix/conversation/conversation_search/views/conversation_search_screen.dart';
import '../../modules/sicix/conversation/create_group_conversation/bindings/create_group_conversation_binding.dart';
import '../../modules/sicix/conversation/create_group_conversation/views/create_group_conversation_view.dart';
import '../../modules/sicix/conversation/create_personal_conversation/bindings/create_personal_conversation_binding.dart';
import '../../modules/sicix/conversation/create_personal_conversation/views/create_personal_conversation_view.dart';
import '../../modules/sicix/conversation/forward_message/bindings/forward_message_binding.dart';
import '../../modules/sicix/conversation/forward_message/views/forward_message_screen.dart';
import '../../modules/sicix/conversation/member_conversation/bindings/member_conversation_binding.dart';
import '../../modules/sicix/conversation/member_conversation/views/member_conversation_screen.dart';
import '../../modules/sicix/conversation/notification_setting/bindings/notification_setting_binding.dart';
import '../../modules/sicix/conversation/notification_setting/views/notification_setting_screen.dart';
import '../../modules/sicix/conversation/option_group_conversation/bindings/option_group_conversation_binding.dart';
import '../../modules/sicix/conversation/option_group_conversation/views/option_group_conversation_screen.dart';
import '../../modules/sicix/conversation/option_personal_conversation/bindings/option_personal_conversation_binding.dart';
import '../../modules/sicix/conversation/option_personal_conversation/views/option_personal_conversation_screen.dart';
import '../../modules/sicix/conversation/pined_conversation/bindings/pined_conversation_binding.dart';
import '../../modules/sicix/conversation/pined_conversation/views/pined_conversation_screen.dart';

import '../../modules/sicix/domain/bindings/domain_binding.dart';
import '../../modules/sicix/domain/views/domain_screen.dart';
import '../../modules/sicix/home/post_detail/binding/post_detail_binding.dart';
import '../../modules/sicix/home/post_detail/view/post_detail_view.dart';
import '../../modules/sicix/home/post_search/bindings/post_search_binding.dart';
import '../../modules/sicix/home/post_search/views/post_search_screen.dart';
import '../../modules/sicix/image_picker/image_picker/bindings/image_picker_binding.dart';
import '../../modules/sicix/image_picker/image_picker/views/image_picker_screen.dart';
import '../../modules/sicix/image_picker/image_preiew/bindings/image_preiew_binding.dart';
import '../../modules/sicix/image_picker/image_preiew/views/image_preiew_view.dart';
import '../../modules/sicix/master/bindings/master_binding.dart';
import '../../modules/sicix/master/views/master_screen.dart';
import '../../modules/sicix/microservices/views/microservices_screen.dart';
import '../../modules/splash/bindings/splash_binding.dart';
import '../../modules/splash/views/splash_screen.dart';

part 'sicix_routes.dart';

final sicixPages = [
  GetPage(
    name: SicixRoutes.SPLASH,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: SicixRoutes.LOGIN,
    page: () => LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: SicixRoutes.CHOOSE_COMPANY,
    page: () => ChooseCompanyScreen(),
    binding: ChooseCompanyBinding(),
  ),
  GetPage(
    name: SicixRoutes.MASTER,
    page: () => MasterScreen(),
    binding: MasterBinding(),
  ),
  GetPage(
    name: SicixRoutes.NOTIFICATION_SETTING,
    page: () => NotificationSettingScreen(),
    binding: NotificationSettingBinding(),
  ),
  GetPage(
    name: SicixRoutes.CONVERSATION_SEARCH,
    page: () => ConversationSearchScreen(),
    binding: ConversationSearchBinding(),
  ),
  GetPage(
    name: SicixRoutes.EDIT_PROFILE,
    page: () => const EditProfileScreen(),
    binding: EditProfileBinding(),
  ),
  GetPage(
    name: SicixRoutes.CHANGE_PASSWORD,
    page: () => const ChangePasswordScreen(),
    binding: ChangePasswordBinding(),
  ),
  GetPage(
    name: SicixRoutes.CHANGE_AVATAR,
    page: () => const ChangeAvatarScreen(),
    binding: ChangeAvatarBinding(),
  ),
  GetPage(
    name: SicixRoutes.CHANGE_LANGUAGE,
    page: () => const ChangeLanguageScreen(),
    binding: ChangeLanguageBinding(),
  ),
  GetPage(
    name: SicixRoutes.CHAT,
    page: () => ChatView(),
    binding: ChatBinding(),
  ),
  GetPage(
    name: SicixRoutes.CHAT_MEDIA,
    page: () => ChatMediaScreen(),
    binding: ChatMediaBinding(),
  ),
  GetPage(
    name: SicixRoutes.POST_DETAIL,
    page: () => PostDetailView(),
    binding: PostDetailBinding(),
  ),
  GetPage(
    name: SicixRoutes.EDIT_PROFILE,
    page: () => const EditProfileScreen(),
    binding: EditProfileBinding(),
  ),
  GetPage(
    name: SicixRoutes.CHANGE_PASSWORD,
    page: () => const ChangePasswordScreen(),
    binding: ChangePasswordBinding(),
  ),
  GetPage(
    name: SicixRoutes.CHANGE_AVATAR,
    page: () => const ChangeAvatarScreen(),
    binding: ChangeAvatarBinding(),
  ),
  GetPage(
    name: SicixRoutes.CHANGE_LANGUAGE,
    page: () => const ChangeLanguageScreen(),
    binding: ChangeLanguageBinding(),
  ),
  GetPage(
    name: SicixRoutes.CREATE_PERSONAL_CONVERSATION,
    page: () => CreatePersonalConversationView(),
    binding: CreatePersonalConversationBinding(),
  ),
  GetPage(
    name: SicixRoutes.CREATE_GROUP_CONVERSATION,
    page: () => CreateGroupConversationView(),
    binding: CreateGroupConversationBinding(),
  ),
  GetPage(
    name: SicixRoutes.OPTION_PERSONAL_CONVERSATION,
    page: () => OptionPersonalConversationScreen(),
    binding: OptionPersonalConversationBinding(),
  ),
  GetPage(
    name: SicixRoutes.OPTION_GROUP_CONVERSATION,
    page: () => OptionGroupConversationScreen(),
    binding: OptionGroupConversationBinding(),
  ),
  GetPage(
    name: SicixRoutes.PINED_CONVERSATION,
    page: () => PinedConversationScreen(),
    binding: PinedConversationBinding(),
  ),
  GetPage(
    name: SicixRoutes.IMAGE_PICKER,
    page: () => ImagePickerScreen(),
    binding: ImagePickerBinding(),
  ),
  GetPage(
    name: SicixRoutes.ADD_MEMBER_GROUP_CONVERSATION,
    page: () => AddMemberGroupConversationScreen(),
    binding: AddMemberGroupConversationBinding(),
  ),
  GetPage(
    name: SicixRoutes.POST_SEARCH,
    page: () => PostSearchScreen(),
    binding: PostSearchBinding(),
  ),
  GetPage(
    name: SicixRoutes.MEMBER_CONVERSATION,
    page: () => MemberConversationScreen(),
    binding: MemberConversationBinding(),
  ),
  GetPage(
    name: SicixRoutes.FORWARD_MESSAGE,
    page: () => ForwardMessageScreen(),
    binding: ForwardMessageBinding(),
  ),
  GetPage(
    name: SicixRoutes.DOMAIN,
    page: () => DomainScreen(),
    binding: DomainBinding(),
  ),
  GetPage(
    name: SicixRoutes.PROFILE_DETAIL,
    page: () => ProfileDetailView(),
    binding: ProfileDetailBinding(),
  ),
  GetPage(
    name: SicixRoutes.CHAT_SEARCH,
    page: () => ChatSearchScreen(),
    binding: ChatSearchBinding(),
  ),
  GetPage(
    name: SicixRoutes.IMAGE_PREIEW,
    page: () => ImagePreiewView(),
    binding: ImagePreiewBinding(),
  ),
  GetPage(
    name: SicixRoutes.MICROSERVICE,
    page: () => const MicroservicePage(),
  ),
];

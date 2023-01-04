import '../../resource/assets_constant/icon_constants.dart';

class TypeModel {
  // Các loại page màn hình home
  static const int PAGE_POST = 0;
  static const int PAGE_IMPORTANT = 1;
  static const int PAGE_BIRTH_MONTH = 2;

  static const int MENU_NEWS_ALL = 0;
  static const int MENU_POSTS_ALL = 1;
  static const int MENU_EVENT_ALL = 2;
  static const int MENU_POLL_ALL = 3;

  // Các chức năng của dropdown button chức năng tin nhắn
  static const int MENU_CREATE_PERSONAL = 0;
  static const int MENU_CREATE_GROUP = 1;
  static const int MENU_NOTIFY_SETTING = 2;

  // Các loại ở màn hình tim kiếm chức năng tin nhắn
  static const int MESSENGER_SEARCH_ALL = 0;
  static const int MESSENGER_SEARCH_ACCOUNT = 1;
  static const int MESSENGER_SEARCH_GROUP = 2;

  //Các kiêu thông báo ở màn hình thông báo
  static const int TYPE_NOTIFICATION_LIKE = 0;
  static const int TYPE_NOTIFICATION_TAG = 1;
  static const int TYPE_NOTIFICATION_COMMENT = 2;
  static const int TYPE_NOTIFICATION_ADD_GROUP = 3;
  static const int TYPE_NOTIFICATION_POST = 4;
  static const int TYPE_NOTIFICATION_LIKE_COMMENT = 5;
  static const int TYPE_NOTIFICATION_REPLY = 6;

  static List<TypeModel> homePages = [
    TypeModel(PAGE_POST, 'home.menu.all'),
    TypeModel(PAGE_IMPORTANT, 'home.page.important'),
    // TypeModel(PAGE_EVENT, 'home.menu.event'),
    TypeModel(PAGE_BIRTH_MONTH, 'home.birth.month'),
  ];

  static List<TypeModel> menuHomeTypes = [
    TypeModel(MENU_NEWS_ALL, 'home.menu.all'),
    TypeModel(MENU_POSTS_ALL, 'home.menu.news'),
    TypeModel(MENU_EVENT_ALL, 'home.menu.event'),
    TypeModel(MENU_POLL_ALL, 'home.menu.pull'),
  ];

  static List<TypeModel> menuMessengerItems = [
    TypeModel(MENU_CREATE_PERSONAL, 'messenger.menu.new',
        icon: IconConstants.icMessenger),
    TypeModel(MENU_CREATE_GROUP, 'messenger.menu.new.group',
        icon: IconConstants.icNewGroup),
    TypeModel(MENU_NOTIFY_SETTING, 'messenger.menu.notification.setting',
        icon: IconConstants.icBell),
  ];

  static List<TypeModel> menuMessengerSearchTypes = [
    TypeModel(MESSENGER_SEARCH_ALL, 'messenger.search.all'),
    TypeModel(MESSENGER_SEARCH_ACCOUNT, 'messenger.search.account'),
    TypeModel(MESSENGER_SEARCH_GROUP, 'messenger.search.group'),
  ];

  int id;
  String title;
  String? icon;

  TypeModel(this.id, this.title, {this.icon});
}

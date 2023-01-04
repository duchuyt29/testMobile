import 'package:get/get.dart';

class CommonConstants {
  static const dateFormat = 'dd/MM/yyyy';
  static const dateApiFormat = 'yyyy/MM/dd';
  static const dayFormat = 'dd/MM';
  static const dateTimeFormat = 'dd/MM/yyyy HH:mm';
  static const timeFormat = 'HH:mm';

  static const int defaultSize = 20;
  static const sortId = 'id,desc';
  static const sortDesc = 'desc';
  static const sortDateDesc = 'publish_date,desc';
  static const sortCreateDateDesc = 'create_date,desc';
  static const sortName = 'first_name,last_name';

  static const index = 'index';
  static const data = 'data';

  //contact address
  static const contactBilling = 'contact_billing';
  static const contactShipping = 'contact_shipping';

  //contact party subject
  static const subjectPersonal = 'subject_personal';
  static const subjectGroup = 'subject_group';

  //account contact type
  static const int accountObjectTypeContact = 1;
  static const int accountObjectTypeAccount = 2;

  //account type
  static const int accountTypePersonal = 1;
  static const int accountTypeEnterprise = 2;

  static List<String> tasksObject = [
    TaskObjectType.ACCOUNT_OBJECT.text,
    TaskObjectType.LEAD_OBJECT.text,
    TaskObjectType.OPP_OBJECT.text,
    TaskObjectType.QUOTE_OBJECT.text,
    TaskObjectType.CONTRACT_OBJECT.text,
    TaskObjectType.ORDER_OBJECT.text,
  ];

  static List<String> activityType = [
    ActivityType.TASK_OBJECT.text,
    ActivityType.PHONE_CALL_OBJECT.text,
    ActivityType.EMAIL_OBJECT.text,
    ActivityType.APPOINTMENT_OBJECT.text,
  ];

  static List<String> filterActivityState = [
    FilterActivitySTATEType.PENDING.text,
    FilterActivitySTATEType.IN_PROGRESS.text,
    FilterActivitySTATEType.COMPLETED.text,
    FilterActivitySTATEType.DEFERRED.text,
    FilterActivitySTATEType.CANCELED.text,
    FilterActivitySTATEType.REVIEWING.text,
    FilterActivitySTATEType.REPROCESS.text,
  ];
}

const APP_NAME = 'SiciX';

const IMAGE_ASSET = 'lib/resource/images/';

// Environment
const DEV_ENVIRONMENT = 'dev_environment';
const UAT_ENVIRONMENT = 'uat_environment';
const PROD_ENVIRONMENT = 'prod_environment';

// Define Theme
const DARK_THEME = 'DARK';
const LIGHT_THEME = 'LIGHT';

// Define Language
const VIETNAMESE_LANG = 'vietnamese';
const ENGLISH_LANG = 'english';

const GraphQLAuthUrl = 'GraphQLAuthUrl';
const GraphQLServiceUrl = 'GraphQLServiceUrl';
const WebSocketGraphQLUrl = 'WebSocketGraphQLUrl';
const MediaApiEnvironment = 'MediaApiEnvironment';
const DefaultLanguageCode = 'DefaultLanguageCode';

const Domain = 'Domain';
const DomainPath = 'DomainPath';
const APIPath = 'APIPath';
const IdentityPath = 'IdentityPath';
const Realm = 'Realm';
// const ConfigPath = 'ConfigPath';
// const StoragePath = 'StoragePath';
// const MediaPath = 'MediaPath';
// const ForgotPassPath = 'ForgotPassPath';

// URL DOWNLOAD APP
const URL_ANDROID = '';
const URL_IOS = '';

enum TaskObjectType {
  CONTACT_OBJECT,
  ACCOUNT_OBJECT,
  LEAD_OBJECT,
  OPP_OBJECT,
  QUOTE_OBJECT,
  CONTRACT_OBJECT,
  ORDER_OBJECT
}

extension TaskObjectTypeId on TaskObjectType {
  int get id {
    switch (this) {
      case TaskObjectType.CONTACT_OBJECT:
        return 1;
      case TaskObjectType.ACCOUNT_OBJECT:
        return 2;
      case TaskObjectType.LEAD_OBJECT:
        return 3;
      case TaskObjectType.OPP_OBJECT:
        return 4;
      case TaskObjectType.QUOTE_OBJECT:
        return 5;
      case TaskObjectType.CONTRACT_OBJECT:
        return 6;
      case TaskObjectType.ORDER_OBJECT:
        return 7;
      default:
        return 0;
    }
  }

  String get text {
    switch (this) {
      case TaskObjectType.CONTACT_OBJECT:
        return '1';
      case TaskObjectType.ACCOUNT_OBJECT:
        return 'crm.activity.account'.tr;
      case TaskObjectType.LEAD_OBJECT:
        return 'crm.activity.lead'.tr;
      case TaskObjectType.OPP_OBJECT:
        return 'crm.activity.opp'.tr;
      case TaskObjectType.QUOTE_OBJECT:
        return 'crm.activity.qoute'.tr;
      case TaskObjectType.CONTRACT_OBJECT:
        return 'crm.activity.contract'.tr;
      case TaskObjectType.ORDER_OBJECT:
        return 'crm.activity.order'.tr;
      default:
        return '';
    }
  }
}

enum ActivityType {
  TASK_OBJECT,
  PHONE_CALL_OBJECT,
  EMAIL_OBJECT,
  APPOINTMENT_OBJECT,
}

extension ActivityTypeValue on ActivityType {
  int get value {
    switch (this) {
      case ActivityType.TASK_OBJECT:
        return 1;
      case ActivityType.PHONE_CALL_OBJECT:
        return 2;
      case ActivityType.EMAIL_OBJECT:
        return 3;
      case ActivityType.APPOINTMENT_OBJECT:
        return 4;
      default:
        return 0;
    }
  }

  String get text {
    switch (this) {
      case ActivityType.TASK_OBJECT:
        return 'Công việc';
      case ActivityType.PHONE_CALL_OBJECT:
        return 'Cuộc gọi';
      case ActivityType.EMAIL_OBJECT:
        return 'Email';
      case ActivityType.APPOINTMENT_OBJECT:
        return 'Cuộc hẹn';
      default:
        return '';
    }
  }
}

enum FilterActivityDateTimeType {
  START_DATE_FROM,
  START_DATE_TO,
  DONE_DATE_FROM,
  DONE_DATE_TO,
  DEADLINE_FROM,
  DEADLINE_TO
}

enum FilterActivitySTATEType {
  PENDING,
  IN_PROGRESS,
  COMPLETED,
  DEFERRED,
  CANCELED,
  REVIEWING,
  REPROCESS,
}

extension FilterActivitySTATETypeValue on FilterActivitySTATEType {
  String get value {
    switch (this) {
      case FilterActivitySTATEType.PENDING:
        return 'PENDING';
      case FilterActivitySTATEType.IN_PROGRESS:
        return 'IN_PROGRESS';
      case FilterActivitySTATEType.COMPLETED:
        return 'COMPLETED';
      case FilterActivitySTATEType.DEFERRED:
        return 'DEFERRED';
      case FilterActivitySTATEType.CANCELED:
        return 'CANCELED';
      case FilterActivitySTATEType.REVIEWING:
        return 'REVIEWING';
      case FilterActivitySTATEType.REPROCESS:
        return 'REPROCESS';
      default:
        return '';
    }
  }

  String get text {
    switch (this) {
      case FilterActivitySTATEType.PENDING:
        return 'Chờ thực hiện';
      case FilterActivitySTATEType.IN_PROGRESS:
        return 'Đang thực hiện';
      case FilterActivitySTATEType.COMPLETED:
        return 'Hoàn thành';
      case FilterActivitySTATEType.DEFERRED:
        return 'Bị trì hoãn';
      case FilterActivitySTATEType.CANCELED:
        return 'Hủy bỏ';
      case FilterActivitySTATEType.REVIEWING:
        return 'Đang xem xét';
      case FilterActivitySTATEType.REPROCESS:
        return 'Thực hiện lại';
      default:
        return '';
    }
  }
}

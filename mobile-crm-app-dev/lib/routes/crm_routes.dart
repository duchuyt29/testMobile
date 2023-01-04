part of 'crm_pages.dart';

abstract class CRMRoutes {
  static const CRM_MASTER = '/crm';
  static const CRM_MASTER_MENU = '/crm/master-menu';
  static const CRM_CRM = '/crm/crm';
  static const CRM_MD = '/crm-md';
  static const CRM_ACTIVITY = '/crm/crm-activity';
  static const CRM_ACTIVITY_DETAIL = '/crm/crm-activity-detail';
  static const CRM_ACTIVITY_DETAIL_DETAIL = '/crm/crm-activity-detail-detail';
  static const CRM_ALL_ACTIVITY = '/crm/crm-all-activity';
  static const CRM_ACTIVITY_FILTER = '/crm/crm-filter-activity';
  static const CRM_ACTIVITY_ADD_FORM_APPOINTMENT =
      '/crm/crm-add-form-appointment-activity';
  static const CRM_ACTIVITY_ADD_FORM_EMAIL = '/crm/crm-add-form-email-activity';
  static const CRM_ACTIVITY_ADD_FORM_CALL = '/crm/crm-add-form-call-activity';
  static const CRM_ACTIVITY_ADD_FORM_JOB = '/crm/crm-add-form-job-activity';
  static const CRM_ACTIVITY_ACCOUNT = '/crm/crm-activity-account';
  static const CRM_ACTIVITY_LEAD = '/crm/crm-activity-lead';
  static const CRM_ACTIVITY_OPP = '/crm/crm-activity-opp';
  static const CRM_ACTIVITY_QOUTE = '/crm/crm-activity-qoute';
  static const CRM_ACTIVITY_CONTRACT = '/crm/crm-activity-contract';
  static const CRM_ACTIVITY_ORDER = '/crm/crm-activity-order';
  static const CRM_ACTIVITY_CONTACT = '/crm/crm-activity-contact';
  static const SETTINGS = '/settings';
  static const CRM_CURRENCY_EXCHANGE_RATE = '/currency-exchange-rate';
  static const ALL_CURRENCY_EXCHANGE_RATE = '/all-currency-exchange-rate';
  static const ADD_CURRENCY_EXCHANGE_RATE = '/add-currency-exchange-rate';
  static const CRM_PRODUCT_MANAGEMENT = '/product-management';
  static const CRM_PRODUCT_FAMILY = '/crm-product-family';
  // PRODUCT
  static const CRM_PRODUCT = '/crm/crm-product';
  static const CRM_ALL_PRODUCT = '/crm/crm-all-product';
  static const CRM_PRODUCT_ADD = '/crm/crm-product-add';
  static const CRM_PRODUCT_EDIT = '/crm/crm-product-edit';
  static const CRM_PRODUCT_DETAIL = '/crm/crm-product-detail';
  static const CRM_PRODUCT_DETAIL_DETAIL = '/crm/crm-product-detail-detail';
  static const CRM_PRODUCT_INFORMATION_RELATED =
      '/crm/crm-product-information-retalted';
  static const CRM_PRODUCT_ADD_ON_PRICE = '/crm/crm-product-add-price-form';
  static const CRM_PRODUCT_ADD_PRICE_STANDARD =
      '/crm/crm-product-add-price-standard-form';

  //PRICE
  static const CRM_PRICE = '/crm-price';
  static const CRM_ALL_PRICE = '/crm-all-price';
  static const CRM_DETAILS_PRICE = '/crm-details-price';
  static const CRM_CREATE_NEW_PRICE = '/crm-create-new-price';
  static const CRM_CREATE_PRODUCTS_IN_PRICE = '/crm-create-products-in-price';
  static const CRM_RELATED_INFORMATION_PRICE = '/crm-related-information-price';
  static const CRM_PRODUCT_FAMILY_OVERVIEW = '/crm-product-family-overview';
  static const CRM_PRODUCT_FAMILY_ADD = '/crm-product-family-add';
  static const CRM_PRODUCT_FAMILY_DETAIL = '/crm-product-family-detail';
  static const CRM_PRODUCT_FAMILY_EDIT = '/crm-product-family-edit';

  //ACCOUNT
  static const CRM_ACCOUNT = '/crm/crm-account';
  static const CRM_ALL_ACCOUNT = '/crm/crm-all-account';
  static const CRM_ACCOUNT_ALL = '/crm/crm-all-account';
  static const CRM_ACCOUNT_DETAIL = '/crm/crm-account-detail';
  static const CRM_ACCOUNT_DETAIL_DETAIL = '/crm/crm-account-detail-detail';
  static const CRM_ACCOUNT_SEARCH = '/crm/crm-account-search';
  static const CRM_ACCOUNT_FILTER = '/crm/crm-account-filter';
  static const CRM_ACCOUNT_RELATED_INFOR = '/crm/crm-account-related-infor';
  static const CRM_ACCOUNT_RELEVANT_PERSONAL =
      '/crm/crm-account-relevent-personal';
  static const CRM_ACCOUNT_CREATE_NEW = '/crm/crm-account-create-new';
  static const CRM_ACCOUNT_ADD_PERSONALRELEVANT =
      '/crm/crm-account-create-personalrelevant';
  static const CRM_CONTACT_CREATE = '/crm/crm-contact-create';

  static const CRM_ACCOUNT_FORM_IDENTIFICATION_CREATE =
      '/crm/crm-account-form-identification-create';

  static const CRM_ACCOUNT_FORM_CREATE = '/crm/crm-account-form-create';
  //account address
  static const CRM_ACCOUNT_FORM_IDENTIFICATION_FORM =
      '/crm/crm-account-identification-form';
  static const CRM_ACCOUNT_FORM_IDENTIFICATION_VIEW =
      '/crm/crm-account-identification-view';
  static const CRM_ACCOUNT_ADDRESS_VIEW = '/crm/crm-account-address-view';
  static const CRM_ACCOUNT_ADDRESS_FORM = '/crm/crm-account-address-form';
  //account document
  static const CRM_ACCOUNT_DOCUMENT_VIEW = '/crm/crm-account-document-view';
  static const CRM_ACCOUNT_DOCUMENT_FORM = '/crm/crm-account-document-form';

  //account list
  static const CRM_ACCOUNT_LIST_ALL = '/crm/crm-account-list-all';

  //LEAD
  static const CRM_LEAD = '/crm/crm-lead';
  static const CRM_LEAD_ALL = '/crm/crm-lead-all';
  static const CRM_OVERVIEW_LEAD = '/crm/crm-overview-lead';
  static const CRM_LEAD_FILTER = '/crm/crm-lead-filter';
  static const CRM_CREATE_LEAD = '/crm/crm-create-lead';
  static const CRM_CREATE_LEAD_PRODUCT = '/crm/crm-create-lead-product';
  static const CRM_LEAD_CREATE_FORM_INFORMATION =
      '/crm/crm-lead-create-form-information';
  static const CRM_LEAD_CREATE_FORM_ADDRESS =
      '/crm/crm-lead-create-form-address';
  static const CRM_LEAD_CREATE_FORM_ADDITIONAL =
      '/crm/crm-lead-create-form-additional';
  static const CRM_LEAD_PRODUCTS = '/crm/crm-lead-product';
  static const CRM_LEAD_CREATE_FORM_PRODUCT_CARE =
      '/crm/crm-lead-create-form-product-care';
  static const CRM_LEAD_PRODUCTS_EDIT = '/crm/crm-lead-products-edit';
  static const CRM_LEAD_DOCUMENT = '/crm/crm-lead-document';
  static const CRM_LEAD_CREATE_FORM_DOCUMENT =
      '/crm/crm-lead-create-form-document';
  static const CRM_LEAD_DETAIL = '/crm/crm-lead-detail';
  static const CRM_EDIT_LEAD_STATUS = '/crm/crm-edit-lead-status';
  static const CRM_EDIT_LEAD_INFO = '/crm/crm-edit-lead-info';
  static const CRM_LEAD_DETAIL_ADDRESS_EDIT =
      '/crm/crm-lead-detail-address-edit';
  static const CRM_EDIT_LEAD_ADDITION_INFO = '/crm/crm-edit-lead-addition-info';
  static const CRM_LEAD_DETAIL_RELEVANT_PERSONAL =
      '/crm/crm-lead-detail-relevantpersonal';
  static const CRM_CREATE_LEAD_DETAIL_RELEVANT_PERSONAL =
      '/crm/crm-create-lead-detail-relevantpersonal';
  static const CRM_EDIT_LEAD_DETAIL_RELEVANT_PERSONAL =
      '/crm/crm-EDIT-lead-detail-relevantpersonal';
  static const CRM_CONVERT_LEAD = '/crm/crm-convert-lead';
  static const CRM_CONVERT_LEAD_SEARCH_ACCOUNT =
      '/crm/crm-convert-lead-search-account';
  static const CRM_CONVERT_LEAD_CREATE_ACCOUNT =
      '/crm/crm-convert-lead-create-account';
  static const CRM_CONVERT_LEAD_SEARCH_CONTACT =
      '/crm/crm-convert-lead-search-contact';
  static const CRM_CONVERT_LEAD_CREATE_CONTACT =
      '/crm/crm-convert-lead-create-contact';
  static const CRM_LEAD_SALES_OPPORTUNITY_INFO =
      '/crm/crm-lead-sales_opportunity_info';
  static const CRM_LEAD_ADDITION_INFO = '/crm/crm-lead-sales_addition_info';
  static const CRM_LEAD_SEARCH_SALE_PARTY_INVOLES =
      '/crm/crm-lead-sale-party-involes';
  static const CRM_LEAD_SALES_PARTY_INVOLES_SEARCH_USERS =
      '/crm/crm-lead-sales-party-involes-search-users';
  static const CRM_LEAD_SALES_PARTY_INVOLES_CREATE_USERS =
      '/crm/crm-lead-sales-party-involes-create-users';

  static const CRM_LEAD_ALL_PRODUCT_FILTER = '/crm/crm-lead-product-filter';

  //CONTACT
  static const CRM_CONTACT_ALL_MASTER = '/crm/crm-contact-all-master';
  static const CRM_CONTACT_ALL = '/crm/crm-contact-all';
  static const CRM_CONTACT_DETAIL = '/crm/crm-contact-detail';
  static const CRM_CONTACT_DETAIL_DETAIL = '/crm/crm-contact-detail-detail';
  static const CRM_CONTACT_PERSONALRELEVANT =
      '/crm/crm-contact-personal-relevent';
  static const CRM_CONTACT_DOCUMENT = '/crm/crm-contact-document';
  static const CRM_ACCOUNT_CONTACT = '/crm/crm-account-contact';
  static const CRM_ACCOUNT_CONTACT_CREATE_RELATION =
      '/crm/crm-account-contact-create-relation';
  static const CRM_CONTACT_FORM_INFORMATION =
      '/crm/crm-contact-form-information';
  static const CRM_CONTACT_FORM_UPDATE_INFORMATION =
      '/crm/crm-contact-form-update-information';
  static const CRM_CONTACT_FORM_ADDRESS_CONTACT =
      '/crm/crm-contact-form-address-contact';
  static const CRM_CONTACT_FILTER = '/crm/crm-contact-filter';
  static const CRM_CONTACT_CREATE_FORM_DOCUMENT =
      '/crm/crm-contact-create-form-document';
  static const CRM_CONTACT_CREATE_FORM_PERSONALRELEVANT =
      '/crm/crm-contact-create-form-personalRelevant';
  static const CRM_CONTACT_RELATED_RELATIONSHIP =
      '/crm/crm-contact-related-relationship';

  //QUOTE
  static const CRM_QUOTE = '/crm/crm-quote';
  static const CRM_QUOTE_ALL = '/crm/crm-quote-all';
  static const CRM_QUOTE_DETAIL = '/crm/crm-quote-detail';
  static const CRM_QUOTE_PRODUCT = '/crm/crm-quote-product';

  //COMMON
  static const CRM_PROVINCE = '/crm/crm-province';
  static const CRM_DISTRICT = '/crm/crm-district';
  static const CRM_WARD = '/crm/crm-ward';
  static const CRM_EMPLOYEE = '/crm/employee';
  static const CRM_AUTHORIZATION_GROUP = '/crm/authorization-group';

  // OPP
  static const CRM_SELECT_ACCOUNT = '/crm/crm-select-account';
  static const CRM_OPPORTUNITY = '/crm/crm-opportunity';
  static const CRM_OPPORTUNITY_FILTER = '/crm/crm-opportunity/filter';
  static const CRM_OPPORTUNITY_FORM = '/crm/crm-opportunity/form';
  static const CRM_OPPORTUNITY_STATUS_INFO_FORM =
      '/crm/crm-opportunity/status-info-form';
  static const CRM_OPPORTUNITY_INFO_FORM = '/crm/crm-opportunity/info-form';
  static const CRM_OPPORTUNITY_ADDITIONAL_FORM =
      '/crm/crm-opportunity/additional-form';
  static const CRM_OPPORTUNITY_DETAIL = '/crm/crm-opportunity-detail';
  static const CRM_OPPORTUNITY_DETAIL_INFO = '/crm/crm-opportunity-detail-info';
  static const CRM_OPPORTUNITY_SALE_PARTY_INVOLVED =
      '/crm/crm-opportunity-sale-party-involved';
  static const CRM_OPPORTUNITY_ADD_SALE_PARTY_INVOLVED =
      '/crm/crm-opportunity-add-sale-party-involved';
  static const CRM_OPPORTUNITY_SALE_PARTY_INVOLVED_FORM =
      '/crm/crm-opportunity-sale-party-involved/form';
  static const CRM_OPPORTUNITY_PRODUCT_FORM =
      '/crm/crm-opportunity-product-form';
  static const CRM_PRODUCT_PRICE_SELECT = '/crm/crm-product-price-select';
  static const CRM_OPPORTUNITY_PRODUCT = '/crm/crm-opportunity-product';
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'permission_action.dart';

part 'menu_actions.g.dart';

@JsonSerializable()
class MenuActions {
  @JsonKey(name: 'crm-master-data.product-management.product')
  PermissionAction? crmMasterDataProductManagementProduct;
  @JsonKey(name: 'crm-service_settings_authorization_resource')
  PermissionAction? crmServiceSettingsAuthorizationResource;
  @JsonKey(name: 'crm-service_sale-plan_super-admin_entity-config')
  PermissionAction? crmServiceSalePlanSuperAdminEntityConfig;
  @JsonKey(name: 'administrative-service_dispatch_local-storage')
  PermissionAction? administrativeServiceDispatchLocalStorage;
  @JsonKey(name: 'crm-master-data-account_related-activity')
  PermissionAction? crmMasterDataAccountRelatedActivity;
  @JsonKey(name: 'hcm-service_performance_checkpoint')
  PermissionAction? hcmServicePerformanceCheckpoint;
  @JsonKey(name: 'project-service_list_setting_system')
  PermissionAction? projectServiceListSettingSystem;
  @JsonKey(name: 'crm-service_sale-management_leadSource_legal-person_detail')
  PermissionAction? crmServiceSaleManagementLeadSourceLegalPersonDetail;
  @JsonKey(name: 'hcm-service_person_academic-level')
  PermissionAction? hcmServicePersonAcademicLevel;
  @JsonKey(name: 'crm-service-order_service-order')
  PermissionAction? crmServiceOrderServiceOrder;
  @JsonKey(name: 'crm-service_sale-management_sale-opporturnity_related-quote')
  PermissionAction? crmServiceSaleManagementSaleOpporturnityRelatedQuote;
  @JsonKey(name: 'hcm-time.hcm-service.time.shift_summary')
  PermissionAction? hcmTimeHcmServiceTimeShiftSummary;
  @JsonKey(
      name:
          'crm-service_sale-management_sale-opporturnity_item') // CRM - Opporturnity - // - CRMRoutes Trống
  PermissionAction? crmServiceSaleManagementSaleOpporturnityItem;
  @JsonKey(name: 'crm-service_sale-plan_bsc.plan-and-desire.quantity')
  PermissionAction? crmServiceSalePlanBscPlanAngDesireQuantity;
  @JsonKey(name: 'hcm-time.hcm-service_timekeeping')
  PermissionAction? hcmTimehcmTimeHcmServiceTimekeeping;
  @JsonKey(name: 'crm-service_sale-management-contract_addendum')
  PermissionAction? crmServiceSaleManagementContractAddendum;
  @JsonKey(
      name:
          'crm-service_customer-management_party-involved') // CRM - Account - Party Involved Account - Party Involved - CRMRoutes.CRM_ACCOUNT_RELEVANT_PERSONAL
  PermissionAction? crmServiceCustomerManagementPartyInvolved;
  @JsonKey(name: 'crm-service_sale-management-contract_party-involved')
  PermissionAction? crmServiceSaleManagementContractPartyInvolved;
  @JsonKey(name: 'crm-service-service_setting_priority-matrix')
  PermissionAction? crmServiceServiceSettingPriorityMatrix;
  @JsonKey(name: 'ticket-service_list')
  PermissionAction? ticketServiceList;
  @JsonKey(name: 'hcm-service_educate_course')
  PermissionAction? hcmServiceEducateCourse;
  @JsonKey(name: 'crm-service_settings_currency-exchange-rate')
  PermissionAction? crmServiceSettingsCurrencyExchangeRate;
  @JsonKey(name: 'administrative-service_dispatch_list')
  PermissionAction? administrativeServiceDispatchList;
  @JsonKey(name: 'hcm-service_person_insurance')
  PermissionAction? hcmServicePersonInsurance;
  @JsonKey(
      name:
          'crm-service_sale-management_sale-lead') // CRM - LEAD - OverView/All Lead - Information All Lead - CRMRoutes.CRM_LEAD_ALL
  PermissionAction? crmServiceSaleManagementSaleLead;
  @JsonKey(name: 'ticket-service_category_resource')
  PermissionAction? ticketServiceCategoryResource;
  @JsonKey(name: 'super-admin_notice-config')
  PermissionAction? superAdminNoticeConfig;
  @JsonKey(name: 'project-service_list_tasks_list-task')
  PermissionAction? projectServiceListTasksListTask;
  @JsonKey(name: 'workflow-service_category')
  PermissionAction? workflowServiceCategory;
  @JsonKey(name: 'personal_request')
  PermissionAction? personalRequest;
  @JsonKey(
      name:
          'crm-service_sale-management_leadSource') // CRM - LEAD - Danh mục trên Web - CRMRoutes Trống
  PermissionAction? crmServiceSaleManagementLeadSource;
  @JsonKey(
      name:
          'crm-service_customer-management_related-activity') // CRM - Account - Activity Account - Information Activity Account - Sliding/ CRMRoutes.CRM_ALL_ACTIVITY
  PermissionAction? crmServiceCustomerManagementRelatedActivity;
  @JsonKey(name: 'crm-service-service_setting_authorize_major')
  PermissionAction? crmServiceServiceSettingAuthorizeMajor;
  @JsonKey(name: 'bsc.qtht_role-permission')
  PermissionAction? bscQthtRolePermission;
  @JsonKey(name: 'crm-master-data.product-management.pricebook')
  PermissionAction? crmMasterDataProductManagementPricebook;
  @JsonKey(name: 'ticket-service_settings_working-schedule')
  PermissionAction? ticketServiceSettingsWorkingSchedule;
  @JsonKey(
      name:
          'crm-service_customer-management') // CRM - Account - All/Overview Account - Information All Account - CRMRoutes.CRM_ACCOUNT_ALL
  PermissionAction? crmServiceCustomerManagementHcmServiceTimekeepingResult;
  @JsonKey(name: 'hcm-time.hcm-service.timekeeping_result')
  PermissionAction? hcmTimeHcmServiceTimekeepingResult;
  @JsonKey(name: 'project-service_list_tasks_ot')
  PermissionAction? projectServiceListTasksOt;
  @JsonKey(name: 'crm-service-service_setting_authorize_user-admin')
  PermissionAction? crmServiceServiceSettingAuthorizeUserAdmin;
  @JsonKey(name: 'crm-service-order_service-order_material')
  PermissionAction? crmServiceOrderServiceOrderMaterial;
  @JsonKey(name: 'crm-master-data')
  PermissionAction? crmMasterData;
  @JsonKey(name: 'hcm-service_person_personal-info')
  PermissionAction? hcmServicePersonPersonalInfo;
  @JsonKey(name: 'bscticket-service')
  PermissionAction? bscticketService;
  @JsonKey(name: 'crm-service_sale-management_price-quote_party-involved')
  PermissionAction? crmServiceSaleManagementPriceQuotePartyInvolved;
  @JsonKey(
      name:
          'crm-service_customer-management_info') // CRM - Account - Detail Account - Information Detail Account - CRMRoutes.CRM_ACCOUNT_DETAIL
  PermissionAction? crmServiceCustomerManagementInfo;
  @JsonKey(name: 'bsc.qtht.user_org')
  PermissionAction? bscQthtUserOrg;
  @JsonKey(name: 'bscticket-service_settings_permission')
  PermissionAction? bscticketServiceSettingsPermission;
  @JsonKey(name: 'crm-service_sale-management_sale-opporturnity_party-involved')
  PermissionAction? crmServiceSaleManagementSaleOpporturnityPartyInvolved;
  @JsonKey(name: 'crm-master-data-contact') // CRM - Contact
  PermissionAction? crmMasterDataContact;
  @JsonKey(
      name:
          'crm-service_customer-management_related-information') // CRM - Account - Realted Information Account (Nhân sự liên quan, Mối quan hệ liên quan) - Routes trống
  PermissionAction? crmServiceCustomerManagementRelatedInformation;
  @JsonKey(name: 'hcm-service_person_training-result')
  PermissionAction? hcmServicePersonTrainingResult;
  @JsonKey(name: 'crm-master-data-account_info')
  PermissionAction? crmMasterDataAccountInfo;
  @JsonKey(name: 'admin_api')
  PermissionAction? adminApi;
  @JsonKey(name: 'crm-service-order_service-order_costs')
  PermissionAction? crmServiceOrderServiceOrderCosts;
  @JsonKey(name: 'ticket-service_category_sla')
  PermissionAction? ticketServiceCategorySla;
  @JsonKey(name: 'ticket-service_settings_custom-field')
  PermissionAction? ticketServiceSettingsCustomField;
  @JsonKey(name: 'bscticket-service_import-bscticket')
  PermissionAction? bscticketServiceImportBscticket;
  @JsonKey(name: 'project-service_setting_permission')
  PermissionAction? projectServiceSettingPermission;
  @JsonKey(name: 'hcm-service_organization')
  PermissionAction? hcmServiceOrganization;
  @JsonKey(name: 'personal_task')
  PermissionAction? personalTask;
  @JsonKey(name: 'settings_category_config-time')
  PermissionAction? settingsCategoryConfigTime;
  @JsonKey(name: 'hcm-service_recruitment_candidate')
  PermissionAction? hcmServiceRecruitmentCandidate;
  @JsonKey(name: 'hcm-time.hcm-service_sign_up_ot')
  PermissionAction? hcmTimeHcmServiceSignUpOt;
  @JsonKey(name: 'hcm-service_person_working-experience')
  PermissionAction? hcmServicePersonWorkingExperience;
  @JsonKey(name: 'hcm-service_person_employee-info')
  PermissionAction? hcmServicePersonEmployeeInfo;
  @JsonKey(name: 'crm-service_settings_products_price_price-book')
  PermissionAction? crmServiceSettingsProductsPricePriceBook;
  @JsonKey(name: 'hcm-service_timekeeping_time-management')
  PermissionAction? hcmServiceTimekeepingTimeManagement;
  @JsonKey(name: 'crm-service_settings_path')
  PermissionAction? crmServiceSettingsPath;
  @JsonKey(name: 'crm-service_customer-management_related-quote')
  PermissionAction? crmServiceCustomerManagementRelatedQuote;
  @JsonKey(name: 'crm-service_settings_employee_author')
  PermissionAction? crmServiceSettingsEmployeeAuthor;
  @JsonKey(name: 'crm-master-data-category')
  PermissionAction? crmMasterDataCategory;
  @JsonKey(name: 'hcm-time.hcm-service.time.grant_calendar')
  PermissionAction? hcmTimeHcmServiceTimeGrantCalendar;
  @JsonKey(name: 'personal_workgroup')
  PermissionAction? personalWorkgroup;
  @JsonKey(name: 'crm-configuration-notification-settings')
  PermissionAction? crmConfigurationNotificationSettings;
  @JsonKey(name: 'crm-service_sale-management.sale-invoice')
  PermissionAction? crmServiceSaleManagementSaleInvoice;
  @JsonKey(name: 'crm-service_settings')
  PermissionAction? crmServiceSettings;
  @JsonKey(name: 'crm-service_sale-management_sale-lead_related-infor')
  PermissionAction? crmServiceSaleManagementSaleLeadRelatedInfor;
  @JsonKey(name: 'super-admin_permission_action')
  PermissionAction? superAdminPermissionAction;
  @JsonKey(name: 'project-service_list_resource_roles')
  PermissionAction? projectServiceListResourceRoles;
  @JsonKey(name: 'ticket-service_dashboard')
  PermissionAction? ticketServiceDashboard;
  @JsonKey(name: 'ticket-service')
  PermissionAction? ticketService;
  @JsonKey(name: 'crm-service_settings_products_product')
  PermissionAction? crmServiceSettingsProductsProduct;
  @JsonKey(name: 'crm-service_settings_organization')
  PermissionAction? crmServiceSettingsOrganization;
  @JsonKey(name: 'crm-service_sale-management_sale-lead_related-activity')
  PermissionAction? crmServiceSaleManagementSaleLeadRelatedActivity;
  @JsonKey(name: 'project-service_list_info_dashboard')
  PermissionAction? projectServiceListInfoDashboard;
  @JsonKey(name: 'bscticket-service_settings_state')
  PermissionAction? bscticketServiceSettingsState;
  @JsonKey(name: 'project-service_list_setting_role-permission')
  PermissionAction? projectServiceListSettingRolePermission;
  @JsonKey(name: 'crm-service_sale-management-contract_infor')
  PermissionAction? crmServiceSaleManagementContractInfor;
  @JsonKey(name: 'workflow-service_workflow')
  PermissionAction? workflowServiceWorkflow;
  @JsonKey(name: 'ticket-service_import-ticket')
  PermissionAction? ticketServiceImportTicket;
  @JsonKey(name: 'hcm-time.hcm-service_settings')
  PermissionAction? hcmTimeHcmServiceSettings;
  @JsonKey(name: 'personal_workgroup_task')
  PermissionAction? personalWorkgroupTask;
  @JsonKey(name: 'bscticket-service_dashboard')
  PermissionAction? bscticketServiceDashboard;
  @JsonKey(name: 'project-service_list_deliverable')
  PermissionAction? projectServiceListDeliverable;
  @JsonKey(
      name:
          'crm-service_sale-management_sale-opporturnity') // CRM - Opporturnity - Overview/All Opporturnity - Information All Opportunity - CRMRoutes.CRM_OPPORTUNITY
  PermissionAction? crmServiceSaleManagementSaleOpporturnity;
  @JsonKey(name: 'crm-service_settings_authorization_user-role-group')
  PermissionAction? crmServiceSettingsAuthorizationUserRoleGroup;
  @JsonKey(name: 'crm-service_settings_products_price')
  PermissionAction? crmServiceSettingsProductsPrice;
  @JsonKey(name: 'timesheet_report')
  PermissionAction? timesheetReport;
  @JsonKey(name: 'crm-service_sale-management_leadSource_legal-person_infor')
  PermissionAction? crmServiceSaleManagementLeadSourceLegalPersonInfor;
  @JsonKey(name: 'hcm-service_person_contract')
  PermissionAction? hcmServicePersonContract;
  @JsonKey(name: 'hcm-service_permission')
  PermissionAction? hcmServicePermission;
  @JsonKey(name: 'administrative-service_dispatch_content-type')
  PermissionAction? administrativeServiceDispatchContentType;
  @JsonKey(name: 'ticket-service_category_location')
  PermissionAction? ticketServiceCategoryLocation;
  @JsonKey(name: 'crm-service_sale-management_sale-lead_infor')
  PermissionAction? crmServiceSaleManagementSaleLeadInfor;
  @JsonKey(name: 'crm-service_sale-management_price-quote_related-activity')
  PermissionAction? crmServiceSaleManagementPriceQuoteRelatedActivity;
  @JsonKey(name: 'settings_category_working-time')
  PermissionAction? settingsCategoryWorkingTime;
  @JsonKey(name: 'crm-service_settings_products_product_info')
  PermissionAction? crmServiceSettingsProductsProductInfo;
  @JsonKey(name: 'crm-service_sale-management_price-quote_info')
  PermissionAction? crmServiceSaleManagementPriceQuoteInfo;
  @JsonKey(name: 'crm-configuration.workflow')
  PermissionAction? crmConfigurationWorkflow;
  @JsonKey(
      name:
          'crm-service_customer-management_related-lead') // CRM - Account - Detail Account - Related Information Lead - CRMRoutes.CRM_ACCOUNT_LEAD
  PermissionAction? crmServiceCustomerManagementRelatedLead;
  @JsonKey(name: 'hcm-time.hcm-service.time.grant_shift')
  PermissionAction? hcmTimeHcmServiceTimeGrantShift;
  @JsonKey(name: 'ticket-service_settings_rule')
  PermissionAction? ticketServiceSettingsRule;
  @JsonKey(name: 'hcm-time.hcm-service.time.import')
  PermissionAction? hcmTimeHcmServiceTimeImport;
  @JsonKey(name: 'project-service_list_info_organization')
  PermissionAction? projectServiceListInfoOrganization;
  @JsonKey(name: 'project-service_category_entry')
  PermissionAction? projectServiceCategoryEntry;
  @JsonKey(name: 'workflow-service_config')
  PermissionAction? workflowServiceConfig;
  @JsonKey(name: 'crm-configuration-entity-setting')
  PermissionAction? crmConfigurationEntitySetting;
  @JsonKey(name: 'crm-service_dashboard')
  PermissionAction? crmServiceDashboard;
  @JsonKey(name: 'crm-service_settings.category.notice-config')
  PermissionAction? crmServiceSettingsCategoryNoticeConfig;
  @JsonKey(name: 'crm-service_settings_material')
  PermissionAction? crmServiceSettingsMaterial;
  @JsonKey(name: 'crm-service-service_category_category')
  PermissionAction? crmServiceServiceCategoryCategory;
  @JsonKey(name: 'project-service_list_resource_allocate')
  PermissionAction? projectServiceListResourceAllocate;
  @JsonKey(name: 'crm-service_sale-management_price-quote')
  PermissionAction? crmServiceSaleManagementPriceQuote;
  @JsonKey(name: 'crm-service-order_service-order_customer-confirmation')
  PermissionAction? crmServiceOrderServiceOrderCustomerConfirmation;
  @JsonKey(name: 'crm-service_settings_authorization_action')
  PermissionAction? crmServiceSettingsAuthorizationAction;
  @JsonKey(name: 'hcm-time.hcm-service_time_ot')
  PermissionAction? hcmTimeHcmServiceTimeOt;
  @JsonKey(name: 'crm-service-service_setting_processing-group')
  PermissionAction? crmServiceServiceSettingProcessingGroup;
  @JsonKey(name: 'ticket-service_settings_customers')
  PermissionAction? ticketServiceSettingsCustomers;
  @JsonKey(name: 'hcm-service_workflow')
  PermissionAction? hcmServiceWorkflow;
  @JsonKey(name: 'hcm-service_dictionary')
  PermissionAction? hcmServiceDictionary;
  @JsonKey(name: 'crm-service-service_setting_authorize_action')
  PermissionAction? crmServiceServiceSettingAuthorizeAction;
  @JsonKey(name: 'crm-service-service_setting_state')
  PermissionAction? crmServiceServiceSettingState;
  @JsonKey(name: 'hcm-time.hcm-service_timekeeping_code')
  PermissionAction? hcmTimeHcmServiceTimekeepingCode;
  @JsonKey(name: 'crm-service-order_service-order_infor')
  PermissionAction? crmServiceOrderServiceOrderInfor;
  @JsonKey(name: 'project-service_list_scope')
  PermissionAction? projectServiceListScope;
  @JsonKey(name: 'super-admin_category_territory')
  PermissionAction? superAdminCategoryTerritory;
  @JsonKey(
      name:
          'crm-service_customer-management_settings_priority-matrix') // CRM - Account - Routes Trống
  PermissionAction? crmServiceCustomerManagementSettingsPriorityMatrix;
  @JsonKey(name: 'admin_workflow')
  PermissionAction? adminWorkflow;
  @JsonKey(name: 'admin_entity')
  PermissionAction? adminEntity;
  @JsonKey(
      name:
          'crm-service_sale-management_sale-activity') // CRM - Activity - Overview/All Activity - Information All Activity - CRMRoutes.CRM_ALL_ACTIVITY
  PermissionAction? crmServiceSaleManagementSaleActivity;
  @JsonKey(name: 'bscticket-service_category_sla')
  PermissionAction? bscticketServiceCategorySla;
  @JsonKey(name: 'ticket-service_settings_permission')
  PermissionAction? ticketServiceSettingsPermission;
  PermissionAction? dashboard;
  @JsonKey(name: 'project-service_setting_notice')
  PermissionAction? projectServiceSettingNotice;
  @JsonKey(name: 'personal_workgroup_feed')
  PermissionAction? personalWorkgroupFeed;
  @JsonKey(name: 'bscticket-service_category_category')
  PermissionAction? bscticketServiceCategoryCategory;
  @JsonKey(name: 'hcm-time.hcm-service_information_leave')
  PermissionAction? hcmTimeHcmServiceInformationLeave;
  @JsonKey(name: 'hcm-service_educate_result')
  PermissionAction? hcmServiceEducateResult;
  @JsonKey(name: 'crm-service-order_service-order-human')
  PermissionAction? crmServiceOrderServiceOrderHuman;
  @JsonKey(name: 'crm-configuration-roles')
  PermissionAction? crmConfigurationRoles;
  @JsonKey(name: 'bscticket-service_list')
  PermissionAction? bscticketServiceList;
  @JsonKey(name: 'crm-service_sale-management-contract_related-activity')
  PermissionAction? crmServiceSaleManagementContractRelatedActivity;
  @JsonKey(name: 'crm-configuration-action')
  PermissionAction? crmConfigurationAction;
  @JsonKey(name: 'project-service_list_issues_risks')
  PermissionAction? projectServiceListIssuesRisks;
  @JsonKey(name: 'crm-master-data-activity')
  PermissionAction? crmMasterDataActivity;
  @JsonKey(name: 'crm-service-service_category_resource')
  PermissionAction? crmServiceServiceCategoryResource;
  @JsonKey(name: 'project-service_list_schedule_kanban')
  PermissionAction? projectServiceListScheduleKanban;
  @JsonKey(name: 'admin_permission')
  PermissionAction? adminPermission;
  @JsonKey(name: 'hcm-service_person')
  PermissionAction? hcmServicePerson;
  @JsonKey(name: 'hcm-service_recruitment_planing')
  PermissionAction? hcmServiceRecruitmentPlaning;
  @JsonKey(name: 'bscticket-service_settings_rule')
  PermissionAction? bscticketServiceSettingsRule;
  @JsonKey(name: 'crm-service_settings_authorization_roles')
  PermissionAction? crmServiceSettingsAuthorizationRoles;
  @JsonKey(name: 'crm-service_sale-management-sale-order_party-involved')
  PermissionAction? crmServiceSaleManagementSaleOrderPartyInvolved;
  @JsonKey(name: 'hrm-service_position')
  PermissionAction? hrmServicePosition;
  @JsonKey(name: 'bscticket-service_category_location')
  PermissionAction? bscticketServiceCategoryLocation;
  @JsonKey(name: 'super-admin_dictionary')
  PermissionAction? superAdminDictionary;
  @JsonKey(name: 'crm-service_customer-management_settings_account-user')
  PermissionAction? crmServiceCustomerManagementSettingsAccountUser;
  @JsonKey(name: 'crm-service_sale-management-sale-order')
  PermissionAction? crmServiceSaleManagementSaleOrder;
  @JsonKey(name: 'bsc.qtht.role_org')
  PermissionAction? bscQthtRoleOrg;
  @JsonKey(name: 'project-service_list_finance_cost')
  PermissionAction? projectServiceListFinanceCost;
  @JsonKey(name: 'project-service_list_resource_actual')
  PermissionAction? projectServiceListResourceActual;
  @JsonKey(name: 'crm-service_settings_material-info')
  PermissionAction? crmServiceSettingsMaterialInfo;
  @JsonKey(name: 'project-service_list_storage')
  PermissionAction? projectServiceListStorage;
  @JsonKey(name: 'bscticket-service_settings_notice')
  PermissionAction? bscticketServiceSettingsNotice;
  @JsonKey(name: 'crm-configuration.major')
  PermissionAction? crmConfigurationMajor;
  @JsonKey(name: 'super-admin_company')
  PermissionAction? superAdminCompany;
  @JsonKey(name: 'crm-service_sale-management-contract_payment-schedule')
  PermissionAction? crmServiceSaleManagementContractPaymentSchedule;
  @JsonKey(name: 'administrative-service_dispatch_issue-merchant')
  PermissionAction? administrativeServiceDispatchIssueMerchant;
  @JsonKey(name: 'hcm-service_person_evaludate-result')
  PermissionAction? hcmServicePersonEvaludateResult;
  @JsonKey(name: 'crm-service-service_setting_authorize_function-authorize')
  PermissionAction? crmServiceServiceSettingAuthorizeFunctionAuthorize;
  @JsonKey(name: 'bscticket-service_category_resource')
  PermissionAction? bscticketServiceCategoryResource;
  @JsonKey(name: 'crm-service_customer-management_related-contract')
  PermissionAction? crmServiceCustomerManagementRelatedContract;
  @JsonKey(name: 'workflow-service_notification-template')
  PermissionAction? workflowServiceNotificationTemplate;
  PermissionAction? erp;
  @JsonKey(name: 'hcm-service_dashboard')
  PermissionAction? hcmServiceDashboard;
  @JsonKey(name: 'project-service_category_phase')
  PermissionAction? projectServiceCategoryPhase;
  @JsonKey(name: 'super-admin_permission_resource')
  PermissionAction? superAdminPermissionResource;
  @JsonKey(name: 'project-service_dashboard')
  PermissionAction? projectServiceDashboard;
  @JsonKey(name: 'settings_category_holiday')
  PermissionAction? settingsCategoryHoliday;
  @JsonKey(name: 'project-service_list_info_information')
  PermissionAction? projectServiceListInfoInformation;
  @JsonKey(name: 'hcm-time.hcm-service.timekeeping_running')
  PermissionAction? hcmTimeHcmServiceTimekeepingRunning;
  @JsonKey(name: 'project-service_list_tasks_list-task-workflow')
  PermissionAction? projectServiceListTasksListTaskWorkflow;
  @JsonKey(name: 'ticket-service_settings_notice')
  PermissionAction? ticketServiceSettingsNotice;
  @JsonKey(name: 'crm-service_settings.category.entity-config')
  PermissionAction? crmServiceSettingsCategoryEntityConfig;
  @JsonKey(name: 'admin_customer')
  PermissionAction? adminCustomer;
  @JsonKey(name: 'crm-service_customer-management_settings_products')
  PermissionAction? crmServiceCustomerManagementSettingsProducts;
  @JsonKey(name: 'crm-service_sale-management_price-quote_item')
  PermissionAction? crmServiceSaleManagementPriceQuoteItem;
  @JsonKey(name: 'crm-service_duc_nv')
  PermissionAction? crmServiceDucNv;
  @JsonKey(name: 'crm-master-data-contact_info')
  PermissionAction? crmMasterDataContactInfo;
  @JsonKey(name: 'project-service_list_resource_dashboard')
  PermissionAction? projectServiceListResourceDashboard;
  @JsonKey(
      name: 'crm-service-service_setting_authorize_define-function-permission')
  PermissionAction? crmServiceServiceSettingAuthorizeDefineFunctionPermission;
  @JsonKey(name: 'crm-service_sale-management_sale-lead_party-involved')
  PermissionAction? crmServiceSaleManagementSaleLeadPartyInvolved;
  @JsonKey(name: 'hcm-service_person_decision')
  PermissionAction? hcmServicePersonDecision;
  @JsonKey(name: 'hcm-service_educate_planing')
  PermissionAction? hcmServiceEducatePlaning;
  @JsonKey(name: 'crm-service-service_setting_schedule')
  PermissionAction? crmServiceServiceSettingSchedule;
  @JsonKey(name: 'hcm-service_educate_regist')
  PermissionAction? hcmServiceEducateRegist;
  @JsonKey(name: 'hcm-time.hcm-service.timekeeping_status')
  PermissionAction? hcmTimeHcmServiceTimekeepingStatus;
  @JsonKey(name: 'crm-service_customer-management_related-order')
  PermissionAction? crmServiceCustomerManagementRelatedOrder;
  @JsonKey(name: 'crm-service-service_ticket')
  PermissionAction? crmServiceServiceTicket;
  @JsonKey(
      name:
          'crm-service_customer-management_related-opp') // CRM - Account - Overview Opportunity - Information Opportunity Account  - CRMRoutes.CRM_OPPORTUNITY
  PermissionAction? crmServiceCustomerManagementRelatedOpp;
  @JsonKey(name: 'crm-service_settings_employee_info')
  PermissionAction? crmServiceSettingsEmployeeInfo;
  @JsonKey(name: 'crm-service-service_setting_setup-automation')
  PermissionAction? crmServiceServiceSettingSetupAutomation;
  @JsonKey(name: 'project-service_category_category')
  PermissionAction? projectServiceCategoryCategory;
  @JsonKey(name: 'personal_workgroup_drive')
  PermissionAction? personalWorkgroupDrive;
  @JsonKey(name: 'super-admin_entity-config')
  PermissionAction? superAdminEntityConfig;
  @JsonKey(name: 'crm-service_sale-management-contract')
  PermissionAction? crmServiceSaleManagementContract;
  @JsonKey(
      name:
          'crm-service_sale-management_sale-opporturnity_info') // CRM - Opporturnity - Detail Opporturnity - Detail Information Opportunity - CRMRoutes.CRM_OPPORTUNITY_DETAIL
  PermissionAction? crmServiceSaleManagementSaleOpporturnityInfo;
  @JsonKey(name: 'crm-service_sale-management-sale-order_related-activity')
  PermissionAction? crmServiceSaleManagementSaleOrderRelatedActivity;
  @JsonKey(
      name:
          'crm-service_sale-management_sale-opporturnity_related-activity') // CRM - Opporturnity - Opporturnity Related Activity - Information Activity - Sliding/ CRMRoutes.CRM_ALL_ACTIVITY
  PermissionAction? crmServiceSaleManagementSaleOpporturnityRelatedActivity;
  @JsonKey(name: 'crm-service_settings_path_infor')
  PermissionAction? crmServiceSettingsPathInfor;
  @JsonKey(name: 'project-service_setting_workflow')
  PermissionAction? projectServiceSettingWorkflow;
  @JsonKey(name: 'crm-service_sale-management-sale-order_item')
  PermissionAction? crmServiceSaleManagementSaleOrderItem;
  @JsonKey(name: 'busy_rate_project')
  PermissionAction? busyRateProject;
  @JsonKey(name: 'bsc.setting.workflow')
  PermissionAction? bscSettingWorkflow;
  @JsonKey(
      name:
          'crm-master-data-account') // CRM - Account  //CRMRoutes.CRM_ACCOUNT_ALL
  PermissionAction? crmMasterDataAccount;
  @JsonKey(name: 'crm-service_settings_products_product-families')
  PermissionAction? crmServiceSettingsProductsProductFamilies;
  @JsonKey(name: 'ticket-service_category_category')
  PermissionAction? ticketServiceCategoryCategory;
  @JsonKey(name: 'busy_rate_department')
  PermissionAction? busyRateDepartment;
  @JsonKey(name: 'administrative-service_dispatch_document-type')
  PermissionAction? administrativeServiceDispatchDocumentType;
  @JsonKey(name: 'personal_workgroup_config')
  PermissionAction? personalWorkgroupConfig;
  @JsonKey(name: 'project-service_list')
  PermissionAction? projectServiceList;
  @JsonKey(name: 'super-admin_api-resource-action')
  PermissionAction? superAdminApiResourceAction;
  @JsonKey(name: 'crm-service-service_service-order')
  PermissionAction? crmServiceServiceServiceOrder;
  @JsonKey(name: 'hcm-time.hcm-service_timekeeping_leave-list')
  PermissionAction? hcmTimeHcmServiceTimekeepingLeaveList;
  @JsonKey(name: 'personal_workgroup_permission')
  PermissionAction? personalWorkgroupPermission;
  @JsonKey(name: 'crm-master-data-salesforce')
  PermissionAction? crmMasterDataSalesforce;
  @JsonKey(name: 'project-service_list_schedule_gantt')
  PermissionAction? projectServiceListScheduleGantt;
  @JsonKey(name: 'project-service_list_issues_issues')
  PermissionAction? projectServiceListIssuesIssues;
  @JsonKey(name: 'crm-service_sale-management_sale-opporturnity_infor')
  PermissionAction? crmServiceSaleManagementSaleOpporturnityInfor;
  @JsonKey(name: 'crm-service_settings_authorization_user-group')
  PermissionAction? crmServiceSettingsAuthorizationUserGroup;
  @JsonKey(name: 'crm-master-data.product-management.product-family')
  PermissionAction? crmMasterDataProductManagementProductFamily;
  @JsonKey(name: 'crm-service_settings_products_price_info')
  PermissionAction? crmServiceSettingsProductsPriceInfo;
  @JsonKey(name: 'crm-service_settings_products_price_price-material')
  PermissionAction? crmServiceSettingsProductsPricePriceMaterial;
  @JsonKey(name: 'crm-service_settings_material-type')
  PermissionAction? crmServiceSettingsMaterialType;
  @JsonKey(name: 'crm-service_settings_authorization_api-resource-action')
  PermissionAction? crmServiceSettingsAuthorizationApiResourceAction;
  @JsonKey(name: 'bscticket-service_settings_custom-field')
  PermissionAction? bscticketServiceSettingsCustomField;
  @JsonKey(name: 'crm-configuration-api-resource-action')
  PermissionAction? crmConfigurationApiResourceAction;
  @JsonKey(name: 'crm-service_sale-management_payment-info')
  PermissionAction? crmServiceSaleManagementPaymentInfo;
  @JsonKey(name: 'crm-master-data-organization-structure')
  PermissionAction? crmMasterDataOrganizationStructure;
  @JsonKey(name: 'crm-service_settings_products_product_price-book')
  PermissionAction? crmServiceSettingsProductsProductPriceBook;
  @JsonKey(name: 'crm-service_settings_employee')
  PermissionAction? crmServiceSettingsEmployee;
  @JsonKey(name: 'settings_category_dictionary')
  PermissionAction? settingsCategoryDictionary;
  @JsonKey(
      name:
          'crm-service_sale-management_contact') // CRM - Contact - Overview/All Contact - CRMRoutes.CRM_CONTACT_ALL
  PermissionAction? crmServiceSaleManagementContact;
  @JsonKey(name: 'crm-service_sale-management-contract_letter-credit')
  PermissionAction? crmServiceSaleManagementContractLetterCredit;
  @JsonKey(name: 'crm-service_settings_workflow')
  PermissionAction? crmServiceSettingsWorkflow;
  @JsonKey(name: 'ticket-service_settings_state')
  PermissionAction? ticketServiceSettingsState;
  @JsonKey(name: 'bsc.qtht')
  PermissionAction? bscQtht;
  @JsonKey(name: 'crm-service_sale-management-contract_payment-infor')
  PermissionAction? crmServiceSaleManagementContractPaymentInfor;
  @JsonKey(name: 'crm-service-service_setting_notification-form')
  PermissionAction? crmServiceServiceSettingNotificationForm;
  @JsonKey(name: 'workflow-service_action')
  PermissionAction? workflowServiceAction;
  @JsonKey(name: 'crm-master-data-account_related-information')
  PermissionAction? crmMasterDataAccountRelatedInformation;
  @JsonKey(name: 'crm-service-service_setting_authorize_user-group')
  PermissionAction? crmServiceServiceSettingAuthorizeUserGroup;
  @JsonKey(name: 'crm-configuration-user-role-group')
  PermissionAction? crmConfigurationUserRoleGroup;
  @JsonKey(name: 'crm-service-service_setting_field-custom')
  PermissionAction? crmServiceServiceSettingFieldCustom;
  @JsonKey(
      name:
          'crm-service_customer-management_related-contact') // CRM - Account - Detail Account - Related Information Contact - CRMRoutes.CRM_ACCOUNT_CONTACT
  PermissionAction? crmServiceCustomerManagementRelatedContact;
  @JsonKey(name: 'hrm-service_agent')
  PermissionAction? hrmServiceAgent;
  @JsonKey(name: 'administrative-service_dispatch_issue-type')
  PermissionAction? administrativeServiceDispatchIssueType;
  @JsonKey(name: 'crm-master-data-curency')
  PermissionAction? crmMasterDataCurency;
  @JsonKey(name: 'crm-service_sale-management_leadSource_Seller')
  PermissionAction? crmServiceSaleManagementLeadSourceSeller;
  @JsonKey(name: 'project-service_list_setting_location')
  PermissionAction? projectServiceListSettingLocation;
  @JsonKey(name: 'crm-service_sale-management-sale-order_info')
  PermissionAction? crmServiceSaleManagementSaleOrderInfo;
  @JsonKey(name: 'crm-service_settings_material_related-information')
  PermissionAction? crmServiceSettingsMaterialRelatedInformation;
  @JsonKey(
      name:
          'crm-service_sale-management_contact_info') // CRM - Contact - Detail Contact - Detail Information - CRMRoutes.CRM_CONTACT_DETAIL
  PermissionAction? crmServiceSaleManagementContactInfo;

  MenuActions({
    this.crmMasterDataProductManagementProduct,
    this.crmServiceSettingsAuthorizationResource,
    this.crmServiceSalePlanSuperAdminEntityConfig,
    this.administrativeServiceDispatchLocalStorage,
    this.crmMasterDataAccountRelatedActivity,
    this.hcmServicePerformanceCheckpoint,
    this.projectServiceListSettingSystem,
    this.crmServiceSaleManagementLeadSourceLegalPersonDetail,
    this.hcmServicePersonAcademicLevel,
    this.crmServiceOrderServiceOrder,
    this.crmServiceSaleManagementSaleOpporturnityRelatedQuote,
    this.hcmTimeHcmServiceTimeShiftSummary,
    this.crmServiceSaleManagementSaleOpporturnityItem,
    this.crmServiceSalePlanBscPlanAngDesireQuantity,
    this.hcmTimehcmTimeHcmServiceTimekeeping,
    this.crmServiceSaleManagementContractAddendum,
    this.crmServiceCustomerManagementPartyInvolved,
    this.crmServiceSaleManagementContractPartyInvolved,
    this.crmServiceServiceSettingPriorityMatrix,
    this.ticketServiceList,
    this.hcmServiceEducateCourse,
    this.crmServiceSettingsCurrencyExchangeRate,
    this.administrativeServiceDispatchList,
    this.hcmServicePersonInsurance,
    this.crmServiceSaleManagementSaleLead,
    this.ticketServiceCategoryResource,
    this.superAdminNoticeConfig,
    this.projectServiceListTasksListTask,
    this.workflowServiceCategory,
    this.personalRequest,
    this.crmServiceSaleManagementLeadSource,
    this.crmServiceCustomerManagementRelatedActivity,
    this.crmServiceServiceSettingAuthorizeMajor,
    this.bscQthtRolePermission,
    this.crmMasterDataProductManagementPricebook,
    this.ticketServiceSettingsWorkingSchedule,
    this.crmServiceCustomerManagementHcmServiceTimekeepingResult,
    this.hcmTimeHcmServiceTimekeepingResult,
    this.projectServiceListTasksOt,
    this.crmServiceServiceSettingAuthorizeUserAdmin,
    this.crmServiceOrderServiceOrderMaterial,
    this.crmMasterData,
    this.hcmServicePersonPersonalInfo,
    this.bscticketService,
    this.crmServiceSaleManagementPriceQuotePartyInvolved,
    this.crmServiceCustomerManagementInfo,
    this.bscQthtUserOrg,
    this.bscticketServiceSettingsPermission,
    this.crmServiceSaleManagementSaleOpporturnityPartyInvolved,
    this.crmMasterDataContact,
    this.crmServiceCustomerManagementRelatedInformation,
    this.hcmServicePersonTrainingResult,
    this.crmMasterDataAccountInfo,
    this.adminApi,
    this.crmServiceOrderServiceOrderCosts,
    this.ticketServiceCategorySla,
    this.ticketServiceSettingsCustomField,
    this.bscticketServiceImportBscticket,
    this.projectServiceSettingPermission,
    this.hcmServiceOrganization,
    this.personalTask,
    this.settingsCategoryConfigTime,
    this.hcmServiceRecruitmentCandidate,
    this.hcmTimeHcmServiceSignUpOt,
    this.hcmServicePersonWorkingExperience,
    this.hcmServicePersonEmployeeInfo,
    this.crmServiceSettingsProductsPricePriceBook,
    this.hcmServiceTimekeepingTimeManagement,
    this.crmServiceSettingsPath,
    this.crmServiceCustomerManagementRelatedQuote,
    this.crmServiceSettingsEmployeeAuthor,
    this.crmMasterDataCategory,
    this.hcmTimeHcmServiceTimeGrantCalendar,
    this.personalWorkgroup,
    this.crmConfigurationNotificationSettings,
    this.crmServiceSaleManagementSaleInvoice,
    this.crmServiceSettings,
    this.crmServiceSaleManagementSaleLeadRelatedInfor,
    this.superAdminPermissionAction,
    this.projectServiceListResourceRoles,
    this.ticketServiceDashboard,
    this.ticketService,
    this.crmServiceSettingsProductsProduct,
    this.crmServiceSettingsOrganization,
    this.crmServiceSaleManagementSaleLeadRelatedActivity,
    this.projectServiceListInfoDashboard,
    this.bscticketServiceSettingsState,
    this.projectServiceListSettingRolePermission,
    this.crmServiceSaleManagementContractInfor,
    this.workflowServiceWorkflow,
    this.ticketServiceImportTicket,
    this.hcmTimeHcmServiceSettings,
    this.personalWorkgroupTask,
    this.bscticketServiceDashboard,
    this.projectServiceListDeliverable,
    this.crmServiceSaleManagementSaleOpporturnity,
    this.crmServiceSettingsAuthorizationUserRoleGroup,
    this.crmServiceSettingsProductsPrice,
    this.timesheetReport,
    this.crmServiceSaleManagementLeadSourceLegalPersonInfor,
    this.hcmServicePersonContract,
    this.hcmServicePermission,
    this.administrativeServiceDispatchContentType,
    this.ticketServiceCategoryLocation,
    this.crmServiceSaleManagementSaleLeadInfor,
    this.crmServiceSaleManagementPriceQuoteRelatedActivity,
    this.settingsCategoryWorkingTime,
    this.crmServiceSettingsProductsProductInfo,
    this.crmServiceSaleManagementPriceQuoteInfo,
    this.crmConfigurationWorkflow,
    this.crmServiceCustomerManagementRelatedLead,
    this.hcmTimeHcmServiceTimeGrantShift,
    this.ticketServiceSettingsRule,
    this.hcmTimeHcmServiceTimeImport,
    this.projectServiceListInfoOrganization,
    this.projectServiceCategoryEntry,
    this.workflowServiceConfig,
    this.crmConfigurationEntitySetting,
    this.crmServiceDashboard,
    this.crmServiceSettingsCategoryNoticeConfig,
    this.crmServiceSettingsMaterial,
    this.crmServiceServiceCategoryCategory,
    this.projectServiceListResourceAllocate,
    this.crmServiceSaleManagementPriceQuote,
    this.crmServiceOrderServiceOrderCustomerConfirmation,
    this.crmServiceSettingsAuthorizationAction,
    this.hcmTimeHcmServiceTimeOt,
    this.crmServiceServiceSettingProcessingGroup,
    this.ticketServiceSettingsCustomers,
    this.hcmServiceWorkflow,
    this.hcmServiceDictionary,
    this.crmServiceServiceSettingAuthorizeAction,
    this.crmServiceServiceSettingState,
    this.hcmTimeHcmServiceTimekeepingCode,
    this.crmServiceOrderServiceOrderInfor,
    this.projectServiceListScope,
    this.superAdminCategoryTerritory,
    this.crmServiceCustomerManagementSettingsPriorityMatrix,
    this.adminWorkflow,
    this.adminEntity,
    this.crmServiceSaleManagementSaleActivity,
    this.bscticketServiceCategorySla,
    this.ticketServiceSettingsPermission,
    this.dashboard,
    this.projectServiceSettingNotice,
    this.personalWorkgroupFeed,
    this.bscticketServiceCategoryCategory,
    this.hcmTimeHcmServiceInformationLeave,
    this.hcmServiceEducateResult,
    this.crmServiceOrderServiceOrderHuman,
    this.crmConfigurationRoles,
    this.bscticketServiceList,
    this.crmServiceSaleManagementContractRelatedActivity,
    this.crmConfigurationAction,
    this.projectServiceListIssuesRisks,
    this.crmMasterDataActivity,
    this.crmServiceServiceCategoryResource,
    this.projectServiceListScheduleKanban,
    this.adminPermission,
    this.hcmServicePerson,
    this.hcmServiceRecruitmentPlaning,
    this.bscticketServiceSettingsRule,
    this.crmServiceSettingsAuthorizationRoles,
    this.crmServiceSaleManagementSaleOrderPartyInvolved,
    this.hrmServicePosition,
    this.bscticketServiceCategoryLocation,
    this.superAdminDictionary,
    this.crmServiceCustomerManagementSettingsAccountUser,
    this.crmServiceSaleManagementSaleOrder,
    this.bscQthtRoleOrg,
    this.projectServiceListFinanceCost,
    this.projectServiceListResourceActual,
    this.crmServiceSettingsMaterialInfo,
    this.projectServiceListStorage,
    this.bscticketServiceSettingsNotice,
    this.crmConfigurationMajor,
    this.superAdminCompany,
    this.crmServiceSaleManagementContractPaymentSchedule,
    this.administrativeServiceDispatchIssueMerchant,
    this.hcmServicePersonEvaludateResult,
    this.crmServiceServiceSettingAuthorizeFunctionAuthorize,
    this.bscticketServiceCategoryResource,
    this.crmServiceCustomerManagementRelatedContract,
    this.workflowServiceNotificationTemplate,
    this.erp,
    this.hcmServiceDashboard,
    this.projectServiceCategoryPhase,
    this.superAdminPermissionResource,
    this.projectServiceDashboard,
    this.settingsCategoryHoliday,
    this.projectServiceListInfoInformation,
    this.hcmTimeHcmServiceTimekeepingRunning,
    this.projectServiceListTasksListTaskWorkflow,
    this.ticketServiceSettingsNotice,
    this.crmServiceSettingsCategoryEntityConfig,
    this.adminCustomer,
    this.crmServiceCustomerManagementSettingsProducts,
    this.crmServiceSaleManagementPriceQuoteItem,
    this.crmServiceDucNv,
    this.crmMasterDataContactInfo,
    this.projectServiceListResourceDashboard,
    this.crmServiceServiceSettingAuthorizeDefineFunctionPermission,
    this.crmServiceSaleManagementSaleLeadPartyInvolved,
    this.hcmServicePersonDecision,
    this.hcmServiceEducatePlaning,
    this.crmServiceServiceSettingSchedule,
    this.hcmServiceEducateRegist,
    this.hcmTimeHcmServiceTimekeepingStatus,
    this.crmServiceCustomerManagementRelatedOrder,
    this.crmServiceServiceTicket,
    this.crmServiceCustomerManagementRelatedOpp,
    this.crmServiceSettingsEmployeeInfo,
    this.crmServiceServiceSettingSetupAutomation,
    this.projectServiceCategoryCategory,
    this.personalWorkgroupDrive,
    this.superAdminEntityConfig,
    this.crmServiceSaleManagementContract,
    this.crmServiceSaleManagementSaleOpporturnityInfo,
    this.crmServiceSaleManagementSaleOrderRelatedActivity,
    this.crmServiceSaleManagementSaleOpporturnityRelatedActivity,
    this.crmServiceSettingsPathInfor,
    this.projectServiceSettingWorkflow,
    this.crmServiceSaleManagementSaleOrderItem,
    this.busyRateProject,
    this.bscSettingWorkflow,
    this.crmMasterDataAccount,
    this.crmServiceSettingsProductsProductFamilies,
    this.ticketServiceCategoryCategory,
    this.busyRateDepartment,
    this.administrativeServiceDispatchDocumentType,
    this.personalWorkgroupConfig,
    this.projectServiceList,
    this.superAdminApiResourceAction,
    this.crmServiceServiceServiceOrder,
    this.hcmTimeHcmServiceTimekeepingLeaveList,
    this.personalWorkgroupPermission,
    this.crmMasterDataSalesforce,
    this.projectServiceListScheduleGantt,
    this.projectServiceListIssuesIssues,
    this.crmServiceSaleManagementSaleOpporturnityInfor,
    this.crmServiceSettingsAuthorizationUserGroup,
    this.crmMasterDataProductManagementProductFamily,
    this.crmServiceSettingsProductsPriceInfo,
    this.crmServiceSettingsProductsPricePriceMaterial,
    this.crmServiceSettingsMaterialType,
    this.crmServiceSettingsAuthorizationApiResourceAction,
    this.bscticketServiceSettingsCustomField,
    this.crmConfigurationApiResourceAction,
    this.crmServiceSaleManagementPaymentInfo,
    this.crmMasterDataOrganizationStructure,
    this.crmServiceSettingsProductsProductPriceBook,
    this.crmServiceSettingsEmployee,
    this.settingsCategoryDictionary,
    this.crmServiceSaleManagementContact,
    this.crmServiceSaleManagementContractLetterCredit,
    this.crmServiceSettingsWorkflow,
    this.ticketServiceSettingsState,
    this.bscQtht,
    this.crmServiceSaleManagementContractPaymentInfor,
    this.crmServiceServiceSettingNotificationForm,
    this.workflowServiceAction,
    this.crmMasterDataAccountRelatedInformation,
    this.crmServiceServiceSettingAuthorizeUserGroup,
    this.crmConfigurationUserRoleGroup,
    this.crmServiceServiceSettingFieldCustom,
    this.crmServiceCustomerManagementRelatedContact,
    this.hrmServiceAgent,
    this.administrativeServiceDispatchIssueType,
    this.crmMasterDataCurency,
    this.crmServiceSaleManagementLeadSourceSeller,
    this.projectServiceListSettingLocation,
    this.crmServiceSaleManagementSaleOrderInfo,
    this.crmServiceSettingsMaterialRelatedInformation,
    this.crmServiceSaleManagementContactInfo,
  });

  factory MenuActions.fromJson(Map<String, dynamic> json) {
    return _$MenuActionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MenuActionsToJson(this);
}

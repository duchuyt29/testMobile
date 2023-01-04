import 'package:sicix/data/app_data_global.dart';
import 'package:sicix/shared/constants/common.dart';

import '../../datasource/crm_ui_api.dart';
import '../../models/account/account.dart';
import '../../models/account/account_address.dart';
import '../../models/contact/contact.dart';
import '../../models/lead/lead_detail.dart';
import '../../request/account/account_address_request.dart';
import '../../request/account/account_contact_request.dart';
import '../../request/account/account_document_request.dart';
import '../../request/account/account_party_involved_request.dart';
import '../../request/activity_checkin_request.dart';
import '../../request/activity_create_request.dart';
import '../../request/activity_edit_request.dart';
import '../../request/activity_request.dart';
import '../../request/contact/contact_party_involved_request.dart';
import '../../request/lead/lead_additional_request.dart';
import '../../request/lead/lead_address_request.dart';
import '../../request/lead/lead_convert_request.dart';
import '../../request/lead/lead_filter_request.dart';
import '../../request/lead/lead_info_request.dart';
import '../../request/lead/lead_party_involved_request.dart';
import '../../request/lead/lead_stage_request.dart';
import '../../request/lead/lead_status_request.dart';
import '../../request/opportunity/opportunity_additional_information_request.dart';
import '../../request/opportunity/opportunity_filter_request.dart';
import '../../request/opportunity/opportunity_info_request.dart';
import '../../request/opportunity/opportunity_item_request.dart';
import '../../request/opportunity/opportunity_party_involved_request.dart';
import '../../request/opportunity/opportunity_request.dart';
import '../../request/opportunity/opportunity_stage_request.dart';
import '../../request/opportunity/opportunity_status_request.dart';
import '../../response/account/account_contact_response.dart';
import '../../response/account/account_count_response.dart';
import '../../response/account/account_info_response.dart';
import '../../response/account/account_party_involved_response.dart';
import '../../response/account/account_response.dart';
import '../../response/account/accounts_response.dart';
import '../../response/activity/activity_account_response.dart';
import '../../response/activity/activity_contact_response.dart';
import '../../response/activity/activity_contract_response.dart';
import '../../response/activity/activity_detail_response.dart';
import '../../response/activity/activity_lead_response.dart';
import '../../response/activity/activity_opp_response.dart';
import '../../response/activity/activity_order_response.dart';
import '../../response/activity/activity_qoute_response.dart';
import '../../response/activity/activity_response.dart';
import '../../response/activity/activity_update_state_response.dart';
import '../../response/authorization_group/authorization_group_response.dart';
import '../../response/base_response.dart';
import '../../response/common/crm_document_type_response.dart';
import '../../response/common/crm_master_data_response.dart';
import '../../response/common/district_response.dart';
import '../../response/common/province_response.dart';
import '../../response/common/ward_response.dart';
import '../../response/contact/contact_account_response.dart';
import '../../response/contact/contact_all_response.dart';
import '../../response/contact/contact_party_involved_response.dart';
import '../../response/contact/contact_response.dart';
import '../../response/contact/contacts_response.dart';
import '../../response/employee/employee_info_response.dart';
import '../../response/employee/employees_response.dart';
import '../../response/lead/lead_detail_response.dart';
import '../../response/lead/lead_format_address_response.dart';
import '../../response/lead/lead_party_involved_response.dart';
import '../../response/lead/lead_response.dart';
import '../../response/lead/lead_used_response.dart';
import '../../response/lead/lead_stage_reason_response.dart';
import '../../response/opporunity/opp_account_response.dart';
import '../../response/opporunity/opp_sale_party_involved_response.dart';
import '../../response/opporunity/opportunities_response.dart';
import '../../response/opporunity/opportunity_info_response.dart';
import '../../response/opporunity/opportunity_product_item_response.dart';
import '../../response/opporunity/opportunity_stage_reason_response.dart';
import '../../response/product/products_price_response.dart';
import '../../response/product/products_response.dart';
import '../crm_api_repository.dart';

class CrmApiRepositoryImpl implements CrmApiRepository {
  final CrmUIAPI _api;

  CrmApiRepositoryImpl(this._api);

  /*
  * Employee
  */

  @override
  Future<EmployeeInfoResponse> getEmployeeProfile(String uid) {
    if (AppDataGlobal.env == DEV_ENVIRONMENT) {
      return _api.getEmployeeProfileDEV(uid);
    } else {
      return _api.getEmployeeProfile(uid);
    }
  }

  @override
  Future<EmployeesResponse> getEmployees() {
    return _api.getEmployees();
  }

  /*
  * Product
  */

  @override
  Future<ProductsResponse> getAllProducts() {
    return _api.getAllProducts();
  }

  @override
  Future<ActivityResponse> getActivities(
      int page, int size, String sort, ActivityRequest request) {
    return _api.getActivities(page, size, sort, request);
  }

  @override
  Future<ActivityDetailResponse> getActivityDetail(int id) {
    return _api.getActivityDetail(id);
  }

  @override
  Future<ActivityDetailResponse> editActivity(
      int id, ActivityEditRequest request) {
    return _api.editActivity(id, request);
  }

  @override
  Future<BaseResponse> checkinActivity(int id, ActivityCheckinRequest request) {
    return _api.checkinActivity(id, request);
  }

  @override
  Future<ActivityUpdateStateResponse> activityUpdateState(
      int id, String state) {
    return _api.activityUpdateState(id, state);
  }

  @override
  Future<BaseResponse> createActivity(ActivityCreateRequest request) {
    return _api.createActivity(request);
  }

  @override
  Future<ActivityAccountResponse> getActivityAccount() {
    return _api.getActivityAccount();
  }

  @override
  Future<ActivityLeadResponse> getActivityLead() {
    return _api.getActivityLead();
  }

  @override
  Future<ActivityOppResponse> getActivityOpp() {
    return _api.getActivityOpp();
  }

  @override
  Future<ActivityQouteResponse> getActivityQoute() {
    return _api.getActivityQoute();
  }

  @override
  Future<ActivityContractResponse> getActivityContract() {
    return _api.getActivityContract();
  }

  @override
  Future<ActivityOrderResponse> getActivityOrder() {
    return _api.getActivityOrder();
  }

  @override
  Future<ActivityContactResponse> getActivityContact(int id) {
    return _api.getActivityContact(id);
  }

  // @override
  // Future<ProductsResponse> searchProduct(
  //   int page,
  //   int size,
  //   String sort,
  // ) async {
  //   return await _api.searchProduct(page, size, sort);
  // }

  // @override
  // Future<AccountResponse> searchAccount(
  //   int page,
  //   int size,
  //   String sort,
  // ) async {
  //   return await _api.searchAccount(page, size, sort);
  // }

  /*
  * Common
  */
  @override
  Future<CrmMasterDataResponse> getMasterData() {
    return _api.getCrmMasterData();
  }

  @override
  Future<ProvinceResponse> getProvince(String countryId) {
    return _api.getProvince(countryId);
  }

  // get district via provinceId
  @override
  Future<DistrictResponse> getDistrict(int provinceId) {
    return _api.getDistrict(provinceId);
  }

  // get ward via districtId
  @override
  Future<WardResponse> getWard(int districtId) {
    return _api.getWard(districtId);
  }

  // Lấy danh sách nhóm đối tượng
  @override
  Future<AuthorizationGroupResponse> getAuthorizationGroup() {
    return _api.getAuthorizationGroup();
  }

  // Lấy danh sách loại giấy tờ
  @override
  Future<CrmDocumentTypeResponse> getDocumentType(int accountTypeId) {
    return _api.getDocumentType(accountTypeId);
  }

  /*
  * Account
  */
  @override
  Future<AccountsResponse> searchAccounts({
    int page = 0,
    int size = 0,
    String sort = '',
    String search = '',
    String ownerEmployeeId = '',
    String industryId = '',
    String accountTypeId = '',
    String genderId = '',
    String relativeAccount = '',
    String relativeContact = '',
    String accountBillingCountryId = '',
    int accountBillingProvinceId = 0,
    int accountBillingDistrictId = 0,
    int accountBillingWardId = 0,
  }) {
    return _api.searchAccounts(
      page,
      size,
      sort,
      search,
      ownerEmployeeId,
      industryId,
      accountTypeId,
      genderId,
      relativeAccount,
      relativeContact,
      accountBillingCountryId,
      accountBillingProvinceId,
      accountBillingDistrictId,
      accountBillingWardId,
    );
  }

  @override
  Future<AccountInfoResponse> getAccountDetail(int accountId) {
    return _api.getAccountDetail(accountId);
  }

  @override
  Future<AccountInfoResponse> insertAccount(AccountInfo request) {
    return _api.insertAccount(request);
  }

  @override
  Future<AccountInfoResponse> updateAccount(
      int accountId, AccountInfo request) {
    return _api.updateAccount(accountId, request);
  }

  @override
  Future<BaseResponse> deleteAccount(int accountId) {
    return _api.deleteAccount(accountId);
  }

  @override
  Future<AccountCountResponse> getAccountCount(int accountId) {
    return _api.getAccountCount(accountId);
  }

  @override
  Future<AccountResponse> lockAccount(int accountId) {
    return _api.lockAccount(accountId);
  }

  /*
  * Account - Address
  */
  @override
  Future<BaseResponse> insertAccountAddress(AccountAddressRequest request) {
    return _api.insertAccountAddress(request);
  }

  @override
  Future<BaseResponse> updateAccountAddress(
      int id, AccountAddressRequest request) {
    return _api.updateAccountAddress(id, request);
  }

  @override
  Future<BaseResponse> deleteAccountAddress(int id) {
    return _api.deleteAccountAddress(id);
  }

  /*
  * Account - Document
  */
  @override
  Future<BaseResponse> insertAccountDocument(AccountDocumentRequest request) {
    return _api.insertAccountDocument(request);
  }

  @override
  Future<BaseResponse> updateAccountDocument(
      int id, AccountDocumentRequest request) {
    return _api.updateAccountDocument(id, request);
  }

  @override
  Future<BaseResponse> deleteAccountDocument(int id) {
    return _api.deleteAccountDocument(id);
  }

  /*
  * Account - Party involved
  */
  @override
  Future<AccountPartyInvolvedResponse> getAccountPartyInvolved(int accountId) {
    return _api.getAccountPartyInvolved(accountId);
  }

  @override
  Future<BaseResponse> insertAccountPartyInvolved(
      AccountPartyInvolvedRequest request) {
    return _api.insertAccountPartyInvolved(request);
  }

  @override
  Future<BaseResponse> updateAccountPartyInvolved(
      int id, AccountPartyInvolvedRequest request) {
    return _api.updateAccountPartyInvolved(id, request);
  }

  @override
  Future<BaseResponse> deleteAccountPartyInvolved(int accountId) {
    return _api.deleteAccountPartyInvolved(accountId);
  }

  /*
  * Account - Contact
  */
  @override
  Future<AccountContactResponse> getAccountContact(int accountId) {
    return _api.getAccountContact(accountId);
  }

  @override
  Future<BaseResponse> insertAccountContact(AccountContactRequest request) {
    return _api.insertAccountContact(request);
  }

  @override
  Future<BaseResponse> insertAccountContactAccount(
      AccountContactAccountRequest request) {
    return _api.insertAccountContactAccount(request);
  }

  @override
  Future<BaseResponse> updateAccountContact(
      int id, AccountContactRequest request) {
    return _api.updateAccountContact(id, request);
  }

  @override
  Future<BaseResponse> deleteAccountContact(int accountId) {
    return _api.deleteAccountContact(accountId);
  }

  /*
  * Contact - Người liên hệ
  */
  @override
  Future<ContactAllResponse> getAllContacts() {
    return _api.getAllContacts();
  }

  @override
  Future<ContactsResponse> getContacts(
    int page,
    int size,
    String sort,
    String search,
    int genderId,
    String countryId,
    int provinceId,
    int districtId,
    int wardId,
  ) {
    return _api.getContacts(
      page,
      size,
      sort,
      search,
      genderId,
      countryId,
      provinceId,
      districtId,
      wardId,
    );
  }

  @override
  Future<ContactResponse> getContactDetail(int id) {
    return _api.getContactDetail(id);
  }

  @override
  Future<ContactResponse> insertContact(Contact request) {
    return _api.insertContact(request);
  }

  @override
  Future<ContactResponse> updateContact(int id, Contact request) {
    return _api.updateContact(id, request);
  }

  @override
  Future<BaseResponse> deleteContact(int id) {
    return _api.deleteContact(id);
  }

  @override
  Future<ContactPartyInvolvedResponse> getContactPartyInvolved(int contactId) {
    return _api.getContactPartyInvolved(contactId);
  }

  @override
  Future<BaseResponse> insertContactPartyInvolved(
      ContactPartyInvolvedRequest request) {
    return _api.insertContactPartyInvolved(request);
  }

  @override
  Future<BaseResponse> updateContactPartyInvolved(
      int id, ContactPartyInvolvedRequest request) {
    return _api.updateContactPartyInvolved(id, request);
  }

  @override
  Future<BaseResponse> deleteContactPartyInvolved(int contactId) {
    return _api.deleteContactPartyInvolved(contactId);
  }

  @override
  Future<ContactAccountResponse> getContactRelated(int contactId) {
    return _api.getContactRelated(contactId);
  }

  /*
  * Lead - Khách hàng tiềm năng
  */

  @override
  Future<LeadsResponse> getLeads(
    int page,
    int size,
    String sort,
    String search,
    LeadFilterRequest request,
  ) {
    return _api.getLeads(
      page,
      size,
      sort,
      search,
      leadSourceId: request.getLeadSourceId(),
      stageId: request.getStageId(),
      productId: request.getProductId(),
      employeeId: request.getEmployeeId(),
      leadPotentialLevelId: request.getLeadPotentialLevelId(),
      fromDate: request.getFromDate(),
      toDate: request.getToDate(),
    );
  }

  @override
  Future<LeadDetailResponse> getLeadDetail(int id) {
    return _api.getLeadDetail(id);
  }

  @override
  Future<LeadDetailResponse> createLead(LeadDetail request) {
    return _api.createLead(request);
  }

  @override
  Future<BaseResponse> deleteLead(int id) {
    return _api.deleteLead(id);
  }

  @override
  Future<BaseResponse> updateLead(int id, LeadDetail request) {
    return _api.updateLead(id, request);
  }

  @override
  Future<BaseResponse> updateLeadStage(int id, LeadStageRequest request) {
    return _api.updateLeadStage(id, request);
  }

  @override
  Future<LeadUsedResponse> checkLeadPhoneExist(String leadPhone) {
    return _api.checkLeadPhoneExist(leadPhone);
  }

  @override
  Future<BaseResponse> leadConvert(LeadConvertRequest request) {
    return _api.leadConvert(request);
  }

  @override
  Future<LeadStageReasonResponse> leadStageReason(int id) {
    return _api.leadStageReason(id);
  }

  @override
  Future<BaseResponse> updateLeadStatus(LeadStatusRequest request) {
    return _api.updateLeadStatus(request);
  }

  @override
  Future<BaseResponse> updateLeadInfo(LeadInfoRequest request) {
    return _api.updateLeadInfo(request);
  }

  @override
  Future<BaseResponse> updateLeadAddress(LeadAddressRequest request) {
    return _api.updateLeadAddress(request);
  }

  @override
  Future<BaseResponse> updateLeadAdditional(LeadAdditionalRequest request) {
    return _api.updateLeadAdditional(request);
  }

  @override
  Future<LeadFormatAddressResponse> getAddressDetailFromString(
      String fullAddress) {
    return _api.getAddressDetailFromString(fullAddress);
  }

  /*
  * Lead party involved - Nhân sự liên quan - KHTN
  */

  // Lấy danh sách nhân sự
  @override
  Future<LeadPartyInvolvedResponse> getLeadPartyInvolved(int id) {
    return _api.getLeadPartyInvolved(id);
  }

  @override
  Future<BaseResponse> insertLeadPartyInvolved(
      LeadPartyInvolvedRequest request) {
    return _api.insertLeadPartyInvolved(request);
  }

  @override
  Future<BaseResponse> updateLeadPartyInvolved(
      int id, LeadPartyInvolvedRequest request) {
    return _api.updateLeadPartyInvolved(id, request);
  }

  @override
  Future<BaseResponse> deleteLeadPartyInvolved(int id) {
    return _api.deleteLeadPartyInvolved(id);
  }

  /*
  * Products - Sản phẩm quan tâm - KHTN
  */

  @override
  Future<ProductsResponse> getLeadProducts(int id) {
    return _api.getLeadProducts(id);
  }

  /*
  * Opportunity - Cơ hội bán hàng
  */

  @override
  Future<OpportunitiesResponse> getOpportunities(
    int page,
    int size,
    String sort,
    String search,
    OpportunityFilterRequest request,
  ) {
    return _api.getOpportunities(
      page,
      size,
      sort,
      search,
      leadSourceId: request.getLeadSource(),
      stageId: request.getStageId(),
      productId: request.getProductId(),
      employeeId: request.getEmployeeId(),
      accountId: request.getAccountId(),
      fromDate: request.getFromDate(),
      toDate: request.getToDate(),
      fromStartDate: request.getFromStartDate(),
      toStartDate: request.getToStartDate(),
      currencyExchangeRateId: request.getCurrencies(),
    );
  }

  @override
  Future<OppAccountResponse> getAllAccount() {
    return _api.getAllAccount();
  }

  @override
  Future<OpportunityInfoResponse> getOpportunityDetail(int opportunityId) {
    return _api.getOpportunityById(opportunityId);
  }

  @override
  Future<OppSalePartyInvolvedListResponse> getOpportunitySalePartyInvolved(
      int opportunityId) {
    return _api.getOpportunitySalePartyInvolved(opportunityId);
  }

  @override
  Future<OpportunityProductItemResponse> getProductsByOpportunityId(
      int opportunityId) {
    return _api.getProductsByOpportunityId(opportunityId);
  }

  @override
  Future<BaseResponse> deleteOpportunityById(
    int opportunityId,
  ) {
    return _api.deleteOpportunityById(opportunityId);
  }

  @override
  Future<BaseResponse> postNewOpportunity(OpportunityRequest request) {
    return _api.postNewOpportunity(request);
  }

  @override
  Future<BaseResponse> updateOpportunityStatus(
    OpportunityStatusRequest request,
  ) {
    return _api.updateOpportunityStatus(request);
  }

  @override
  Future<BaseResponse> updateOpportunityInfo(
    OpportunityInfoRequest request,
  ) {
    return _api.updateOpportunityInfo(request);
  }

  @override
  Future<BaseResponse> updateOpportunityAdditionalInfo(
    OpportunityAdditionalInformationRequest request,
  ) {
    return _api.updateOpportunityAdditionalInfo(request);
  }

  @override
  Future<BaseResponse> updateOpportunityById(
    int opportunityId,
    OpportunityRequest request,
  ) {
    return _api.updateOpportunityById(opportunityId, request);
  }

  @override
  Future<BaseResponse> selectPriceForOpportunity(
    int opportunityId,
    int priceId,
  ) {
    return _api.selectPriceForOpportunity(opportunityId, priceId);
  }

  @override
  Future<BaseResponse> insertOpportunityPartyInvolved(
      OpportunityPartyInvolvedRequest request) {
    return _api.insertOpportunityPartyInvolved(request);
  }

  @override
  Future<BaseResponse> updateOpportunityPartyInvolved(
      int id, OpportunityPartyInvolvedRequest request) {
    return _api.updateOpportunityPartyInvolved(id, request);
  }

  @override
  Future<BaseResponse> deleteOpportunityPartyInvolved(int partyInvolvedId) {
    return _api.deleteOpportunityPartyInvolved(partyInvolvedId);
  }

  @override
  Future<BaseResponse> createProductInOpportunity(
    int opportunityId,
    OpportunityItemsRequest request,
  ) {
    return _api.createProductInOpportunity(opportunityId, request);
  }

  @override
  Future<BaseResponse> updateProductInOpportunity(
    int id,
    OpportunityItem request,
  ) {
    return _api.updateProductInOpportunity(id, request);
  }

  @override
  Future<BaseResponse> deleteProductInOpportunity(int id) {
    return _api.deleteProductInOpportunity(id);
  }

  @override
  Future<ProductsPriceResponse> getProductsByPriceId(
    int priceId,
    int currencyExchangeRateId,
  ) {
    return _api.getProductsByPriceId(priceId, currencyExchangeRateId);
  }

  @override
  Future<OpportunityStageReasonResponse> getOpportunityStageReason(
    int stageId,
  ) {
    return _api.getOpportunityStageReason(stageId);
  }

  @override
  Future<BaseResponse> updateOpportunityStage(
    int opportunityId,
    OpportunityStageRequest request,
  ) {
    return _api.updateOpportunityStage(opportunityId, request);
  }

  @override
  Future<BaseResponse> updatePriceForOpportunity(
    int opportunityId,
    int priceId,
  ) {
    return _api.updatePriceForOpportunity(opportunityId, priceId);
  }
}

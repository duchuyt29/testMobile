import '../models/account/account.dart';
import '../models/account/account_address.dart';
import '../models/contact/contact.dart';
import '../models/lead/lead_detail.dart';
import '../request/account/account_address_request.dart';
import '../request/account/account_contact_request.dart';
import '../request/account/account_document_request.dart';
import '../request/account/account_party_involved_request.dart';
import '../request/activity_checkin_request.dart';
import '../request/activity_create_request.dart';
import '../request/activity_edit_request.dart';
import '../request/activity_request.dart';
import '../request/contact/contact_party_involved_request.dart';
import '../request/lead/lead_additional_request.dart';
import '../request/lead/lead_address_request.dart';
import '../request/lead/lead_convert_request.dart';
import '../request/lead/lead_filter_request.dart';
import '../request/lead/lead_info_request.dart';
import '../request/lead/lead_party_involved_request.dart';
import '../request/lead/lead_stage_request.dart';
import '../request/lead/lead_status_request.dart';
import '../request/opportunity/opportunity_additional_information_request.dart';
import '../request/opportunity/opportunity_filter_request.dart';
import '../request/opportunity/opportunity_info_request.dart';
import '../request/opportunity/opportunity_item_request.dart';
import '../request/opportunity/opportunity_party_involved_request.dart';
import '../request/opportunity/opportunity_request.dart';
import '../request/opportunity/opportunity_stage_request.dart';
import '../request/opportunity/opportunity_status_request.dart';
import '../response/account/account_contact_response.dart';
import '../response/account/account_count_response.dart';
import '../response/account/account_info_response.dart';
import '../response/account/account_party_involved_response.dart';
import '../response/account/account_response.dart';
import '../response/account/accounts_response.dart';
import '../response/activity/activity_account_response.dart';
import '../response/activity/activity_contact_response.dart';
import '../response/activity/activity_contract_response.dart';
import '../response/activity/activity_detail_response.dart';
import '../response/activity/activity_lead_response.dart';
import '../response/activity/activity_opp_response.dart';
import '../response/activity/activity_order_response.dart';
import '../response/activity/activity_qoute_response.dart';
import '../response/activity/activity_response.dart';
import '../response/activity/activity_update_state_response.dart';
import '../response/authorization_group/authorization_group_response.dart';
import '../response/base_response.dart';
import '../response/common/crm_document_type_response.dart';
import '../response/common/crm_master_data_response.dart';
import '../response/common/district_response.dart';
import '../response/common/province_response.dart';
import '../response/common/ward_response.dart';
import '../response/contact/contact_account_response.dart';
import '../response/contact/contact_all_response.dart';
import '../response/contact/contact_party_involved_response.dart';
import '../response/contact/contact_response.dart';
import '../response/contact/contacts_response.dart';
import '../response/employee/employee_info_response.dart';
import '../response/employee/employees_response.dart';
import '../response/lead/lead_detail_response.dart';
import '../response/lead/lead_format_address_response.dart';
import '../response/lead/lead_party_involved_response.dart';
import '../response/lead/lead_response.dart';
import '../response/lead/lead_used_response.dart';
import '../response/lead/lead_stage_reason_response.dart';
import '../response/opporunity/opp_account_response.dart';
import '../response/opporunity/opp_sale_party_involved_response.dart';
import '../response/opporunity/opportunities_response.dart';
import '../response/opporunity/opportunity_info_response.dart';
import '../response/opporunity/opportunity_product_item_response.dart';
import '../response/opporunity/opportunity_stage_reason_response.dart';
import '../response/product/products_price_response.dart';
import '../response/product/products_response.dart';

abstract class CrmApiRepository {
  /*
  * Employee
  */

  Future<EmployeeInfoResponse> getEmployeeProfile(String uid);

  Future<EmployeesResponse> getEmployees();

  /*
  * Product
  */

  Future<ProductsResponse> getAllProducts();

  /*
  * Common
  */

  // get province via countryId
  Future<CrmMasterDataResponse> getMasterData();

  // get province via countryId
  Future<ProvinceResponse> getProvince(String countryId);

  // get district via provinceId
  Future<DistrictResponse> getDistrict(int provinceId);

  // get ward via districtId
  Future<WardResponse> getWard(int districtId);

  // L???y danh s??ch nh??m ?????i t?????ng
  Future<AuthorizationGroupResponse> getAuthorizationGroup();

// L???y danh s??ch lo???i gi???y t???
  Future<CrmDocumentTypeResponse> getDocumentType(int accountTypeId);

  /*
  * Activity
  */
  Future<ActivityResponse> getActivities(
      int page, int size, String sort, ActivityRequest request);

  Future<ActivityDetailResponse> getActivityDetail(int id);

  Future<ActivityDetailResponse> editActivity(
      int id, ActivityEditRequest request);

  Future<BaseResponse> checkinActivity(int id, ActivityCheckinRequest request);

  Future<ActivityUpdateStateResponse> activityUpdateState(int id, String state);

  Future<BaseResponse> createActivity(ActivityCreateRequest request);

  Future<ActivityAccountResponse> getActivityAccount();

  Future<ActivityLeadResponse> getActivityLead();

  Future<ActivityOppResponse> getActivityOpp();

  Future<ActivityQouteResponse> getActivityQoute();

  Future<ActivityContractResponse> getActivityContract();

  Future<ActivityOrderResponse> getActivityOrder();

  Future<ActivityContactResponse> getActivityContact(int id);

  /*
  * Account
  */

  Future<AccountsResponse> searchAccounts({
    int page,
    int size,
    String sort,
    String search,
    String ownerEmployeeId,
    String industryId,
    String accountTypeId,
    String genderId,
    String relativeAccount,
    String relativeContact,
    String accountBillingCountryId,
    int accountBillingProvinceId,
    int accountBillingDistrictId,
    int accountBillingWardId,
  });

  Future<AccountInfoResponse> getAccountDetail(int accountId);

  Future<AccountInfoResponse> insertAccount(AccountInfo request);

  Future<AccountInfoResponse> updateAccount(
    int accountId,
    AccountInfo request,
  );

  Future<BaseResponse> deleteAccount(int accountId);

  Future<AccountCountResponse> getAccountCount(int accountId);

  Future<AccountResponse> lockAccount(int accountId);

  /*
  * Account - Address
  */
  // ?????a ch??? kh??ch h??ng
  Future<BaseResponse> insertAccountAddress(AccountAddressRequest request);

  Future<BaseResponse> updateAccountAddress(
      int id, AccountAddressRequest request);

  Future<BaseResponse> deleteAccountAddress(int accountId);

/*
  * Account - Document
  */
  // Gi???y t??? kh??ch h??ng
  Future<BaseResponse> insertAccountDocument(AccountDocumentRequest request);

  Future<BaseResponse> updateAccountDocument(
      int id, AccountDocumentRequest request);

  Future<BaseResponse> deleteAccountDocument(int accountId);

  /*
  * Account - Party involved
  */
  // Nh??n s??? li??n quan
  Future<AccountPartyInvolvedResponse> getAccountPartyInvolved(int accountId);

  Future<BaseResponse> insertAccountPartyInvolved(
      AccountPartyInvolvedRequest request);

  Future<BaseResponse> updateAccountPartyInvolved(
      int id, AccountPartyInvolvedRequest request);

  Future<BaseResponse> deleteAccountPartyInvolved(int accountId);

  /*
  * Account - Contact
  */
  // M???i quan h??? li??n quan
  Future<AccountContactResponse> getAccountContact(int accountId);

  Future<BaseResponse> insertAccountContact(AccountContactRequest request);

  Future<BaseResponse> insertAccountContactAccount(
      AccountContactAccountRequest request);

  Future<BaseResponse> updateAccountContact(
      int id, AccountContactRequest request);

  Future<BaseResponse> deleteAccountContact(int accountId);

  /*
  * Contact - Ng?????i li??n h???
  */
  // L???y danh s??ch t???t c??? ng?????i li??n h???:
  Future<ContactAllResponse> getAllContacts();

  // L???y danh s??ch ng?????i li??n h???:
  // - N???u search r???ng l?? l???y t???t c???
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
  );

  // L???y chi ti???t ng?????i li??n h???
  Future<ContactResponse> getContactDetail(int id);

  // Th??m m???i ng?????i li??n h???
  Future<ContactResponse> insertContact(Contact request);

  // C???p nh???t ng?????i li??n h???
  Future<ContactResponse> updateContact(int id, Contact request);

  // Xo?? ng?????i li??n h???
  Future<BaseResponse> deleteContact(int id);

  /*
  * Contact - Ng?????i li??n h??? - Nh??n s??? li??n quan
  */
  // Nh??n s??? li??n quan
  Future<ContactPartyInvolvedResponse> getContactPartyInvolved(int contactId);

  // Th??m Nh??n s??? li??n quan
  Future<BaseResponse> insertContactPartyInvolved(
      ContactPartyInvolvedRequest request);

  // C???p nh???t nh??n s??? li??n quan
  Future<BaseResponse> updateContactPartyInvolved(
      int id, ContactPartyInvolvedRequest request);

  //Xo?? Nh??n s??? li??n quan
  Future<BaseResponse> deleteContactPartyInvolved(int contactId);

  /*
  * Contact - Ng?????i li??n h??? - M???i quan h??? li??n quan
  */
  // M???i quan h??? li??n quan
  Future<ContactAccountResponse> getContactRelated(int contactId);

  /*
  * Lead - Kh??ch h??ng ti???m n??ng
  */

  // L???y danh s??ch kh??ch h??ng ti???m n??ng:
  // - N???u search r???ng l?? l???y t???t c???
  Future<LeadsResponse> getLeads(
    int page,
    int size,
    String sort,
    String search,
    LeadFilterRequest request,
  );

  // L???y chi ti???t kh??ch h??ng ti???m n??ng
  Future<LeadDetailResponse> getLeadDetail(int id);

  // Th??m kh??ch h??ng ti???m n??ng
  Future<LeadDetailResponse> createLead(LeadDetail request);

  // X??a kh??ch h??ng ti???m n??ng
  Future<BaseResponse> deleteLead(int id);

  // C???p nh???t kh??ch h??ng ti???m n??ng
  Future<BaseResponse> updateLead(int id, LeadDetail request);

  // C???p nh???t tr???ng th??i kh??ch h??ng ti???m n??ng
  Future<BaseResponse> updateLeadStage(int id, LeadStageRequest request);

  // Ki???m tra s??? ??i???n tho???i ???? t???n t???i trong h??? th???ng hay ch??a
  Future<LeadUsedResponse> checkLeadPhoneExist(String leadPhone);

  // Chuy???n ?????i kh??ch hang ti???m n??ng th??nh c?? h???i b??n h??ng
  Future<BaseResponse> leadConvert(LeadConvertRequest request);

  // Danh s??ch l?? do ????ng v?? kh??ng chuy???n ?????i
  Future<LeadStageReasonResponse> leadStageReason(int id);

  // C???p nh???t tr???ng th??i kh??ch h??ng ti???m n??ng
  Future<BaseResponse> updateLeadStatus(LeadStatusRequest request);

  // C???p nh???t th??ng tin kh??ch h??ng ti???m n??ng
  Future<BaseResponse> updateLeadInfo(LeadInfoRequest request);

  // C???p nh???t th??ng tin kh??ch h??ng ti???m n??ng
  Future<BaseResponse> updateLeadAddress(LeadAddressRequest request);

  // C???p nh???t th??ng tin kh??ch h??ng ti???m n??ng
  Future<BaseResponse> updateLeadAdditional(LeadAdditionalRequest request);

  // L???y th??ng tin ?????a ch??? c??? th??? t??? ?????a ch??? qu??t ???????c tr??n cccd
  Future<LeadFormatAddressResponse> getAddressDetailFromString(
      String fullAddress);

  /*
  * Lead party involved - Nh??n s??? li??n quan - KHTN
  */

  // L???y danh s??ch nh??n s???
  Future<LeadPartyInvolvedResponse> getLeadPartyInvolved(int id);

  // Th??m Nh??n s??? li??n quan
  Future<BaseResponse> insertLeadPartyInvolved(
      LeadPartyInvolvedRequest request);

  // C???p nh???t nh??n s??? li??n quan
  Future<BaseResponse> updateLeadPartyInvolved(
      int id, LeadPartyInvolvedRequest request);

  //Xo?? Nh??n s??? li??n quan
  Future<BaseResponse> deleteLeadPartyInvolved(int id);

  /*
  * Products - S???n ph???m quan t??m - KHTN
  */

  // L???y danh s??ch s???n ph???m quan t??m c???a m???t KHTN
  Future<ProductsResponse> getLeadProducts(int id);

  /*
  * Opportunity - C?? h???i b??n h??ng
  */

  // L???y danh s??ch c?? h???i b??n h??ng:
  // - N???u search r???ng l?? l???y t???t c???
  Future<OpportunitiesResponse> getOpportunities(
    int page,
    int size,
    String sort,
    String search,
    OpportunityFilterRequest request,
  );

  // Get all danh s??ch kh??ch h??ng
  Future<OppAccountResponse> getAllAccount();

  // L???y th??ng tin chi ti???t c?? h???i b??n h??ng
  Future<OpportunityInfoResponse> getOpportunityDetail(
    int opportunityId,
  );

  // L???y nh??n s??? li??n quan c?? h???i b??n h??ng
  Future<OppSalePartyInvolvedListResponse> getOpportunitySalePartyInvolved(
    int opportunityId,
  );

  // L???y s???n ph???m li??n quan c?? h???i b??n h??ng
  Future<OpportunityProductItemResponse> getProductsByOpportunityId(
    int opportunityId,
  );

  // X??a c?? h???i b??n h??ng
  Future<BaseResponse> deleteOpportunityById(int opportunityId);

// L???y l?? do ????ng th???t b???i c?? h???i b??n h??ng
  Future<OpportunityStageReasonResponse> getOpportunityStageReason(
    int opportunityStageId,
  );

  // C???p nh???t giai ??o???n c?? h???i b??n h??ng
  Future<BaseResponse> updateOpportunityStage(
    int opportunityId,
    OpportunityStageRequest request,
  );

  // T???o m???i c?? h???i b??n h??ng
  Future<BaseResponse> postNewOpportunity(
    OpportunityRequest request,
  );

  // C???p nh???t tr???ng th??i c?? h???i b??n h??ng
  Future<BaseResponse> updateOpportunityStatus(
    OpportunityStatusRequest request,
  );

  // C???p nh???t th??ng tin c?? h???i b??n h??ng
  Future<BaseResponse> updateOpportunityInfo(
    OpportunityInfoRequest request,
  );

  // C???p nh???t th??ng tin b??? sung c?? h???i b??n h??ng
  Future<BaseResponse> updateOpportunityAdditionalInfo(
    OpportunityAdditionalInformationRequest request,
  );

  // C???p nh???t c?? h???i b??n h??ng
  Future<BaseResponse> updateOpportunityById(
    int opportunityId,
    OpportunityRequest request,
  );

  // Ch???n b???ng gi?? cho c?? h???i b??n h??ng
  Future<BaseResponse> selectPriceForOpportunity(
    int opportunityId,
    int priceId,
  );

  // Th??m nh??n s??? li??n quan cho c?? h???i b??n h??ng
  Future<BaseResponse> insertOpportunityPartyInvolved(
    OpportunityPartyInvolvedRequest request,
  );

  // C???p nh???t nh??n s??? li??n quan cho c?? h???i b??n h??ng
  Future<BaseResponse> updateOpportunityPartyInvolved(
    int id,
    OpportunityPartyInvolvedRequest request,
  );

  // X??a nh??n s??? li??n quan cho c?? h???i b??n h??ng
  Future<BaseResponse> deleteOpportunityPartyInvolved(
    int id,
  );

  // L???y danh s??ch s???n ph???m theo b???ng gi?? v?? ti???n id
  Future<ProductsPriceResponse> getProductsByPriceId(
    int priceId,
    int currencyExchangeRateId,
  );

  // Th??m s???n ph???m v??o c?? h???i b??n h??ng
  Future<BaseResponse> createProductInOpportunity(
    int opportunityId,
    OpportunityItemsRequest request,
  );

  // C???p nh???t s???n ph???m trong c?? h???i b??n h??ng
  Future<BaseResponse> updateProductInOpportunity(
    int id,
    OpportunityItem request,
  );

  // X??a s???n ph???m trong c?? h???i b??n h??ng
  Future<BaseResponse> deleteProductInOpportunity(int id);

  // C???p nh???t b???ng gi?? cho c?? h???i b??n h??ng
  Future<BaseResponse> updatePriceForOpportunity(
    int opportunityId,
    int priceId,
  );
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/account/account.dart';
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
import '../request/lead/lead_info_request.dart';
import '../request/lead/lead_party_involved_request.dart';
import '../request/lead/lead_stage_request.dart';
import '../request/lead/lead_status_request.dart';
import '../request/opportunity/opportunity_additional_information_request.dart';
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
import '../response/lead/lead_stage_reason_response.dart';
import '../response/lead/lead_used_response.dart';
import '../response/opporunity/opp_account_response.dart';
import '../response/opporunity/opp_sale_party_involved_response.dart';
import '../response/opporunity/opportunities_response.dart';
import '../response/opporunity/opportunity_info_response.dart';
import '../response/opporunity/opportunity_product_item_response.dart';
import '../response/opporunity/opportunity_stage_reason_response.dart';
import '../response/product/products_price_response.dart';
import '../response/product/products_response.dart';

part 'crm_ui_api.g.dart';

@RestApi()
abstract class CrmUIAPI {
  factory CrmUIAPI(Dio dio, {String baseUrl}) = _CrmUIAPI;

  /*
  * Employee
  */

  // L???y th??ng tin employee t??? CRM
  @GET('/crm/employee')
  Future<EmployeeInfoResponse> getEmployeeProfileDEV(
    @Header('uid') String uid,
  );

  /*
  * Common
  */

  // get master data
  @GET('/crm/sale-module-service/mobile/ultra-view')
  Future<CrmMasterDataResponse> getCrmMasterData();

  // L???y danh s??ch t???t c??? employee
  @GET('/crm/employee/search/all')
  Future<EmployeesResponse> getEmployees();

  // L???y danh s??ch documentType theo accountType
  @GET('/crm/document-type/{id}')
  Future<CrmDocumentTypeResponse> getDocumentType(
      @Path('id') int accountTypeId);

  /*
  * Product
  */

  // L???y danh s??ch t???t c??? employee
  @GET('/crm/product/search/all?status=1')
  Future<ProductsResponse> getAllProducts();

  /*
  * Common
  */

  // get province via countryId
  @GET('/crm/province')
  Future<ProvinceResponse> getProvince(
    @Query('countryId') String countryId,
  );

  // get district via provinceId
  @GET('/crm/district')
  Future<DistrictResponse> getDistrict(
    @Query('provinceId') int provinceId,
  );

  // get ward via districtId
  @GET('/crm/ward')
  Future<WardResponse> getWard(
    @Query('districtId') int districtId,
  );

  // L???y danh s??ch nh??m ?????i t?????ng
  @GET('/crm/authorization-group/search/all?status=1')
  Future<AuthorizationGroupResponse> getAuthorizationGroup();

  @GET('/crm/employee')
  Future<EmployeeInfoResponse> getEmployeeProfile(
    String uid,
  );

  // L???y danh s??ch ho???t ?????ng t??? CRM
  @POST('/crm/activity/filter')
  Future<ActivityResponse> getActivities(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Body() ActivityRequest request,
  );

  // L???y chi ti???t ho???t ?????ng t??? CRM
  @GET('/crm/activity/{id}?include=next-states')
  Future<ActivityDetailResponse> getActivityDetail(
    @Path('id') int id,
  );

  @PUT('/crm/activity/{id}?include=next-states')
  Future<ActivityDetailResponse> editActivity(
    @Path('id') int id,
    @Body() ActivityEditRequest request,
  );

  @PUT('/crm/activity/checkin/{id}')
  Future<BaseResponse> checkinActivity(
    @Path('id') int id,
    @Body() ActivityCheckinRequest request,
  );

  // C???p nh???t tr???ng th??i ho???t ?????ng t??? CRM
  @PUT('/crm/activity/state/{id}/{state}?include=next-states')
  Future<ActivityUpdateStateResponse> activityUpdateState(
    @Path('id') int int,
    @Path('state') String state,
  );

  // T???o ho???t ?????ng
  @POST('/crm/activity?include=next-states')
  Future<BaseResponse> createActivity(
    @Body() ActivityCreateRequest request,
  );

  @GET('/crm/account/search/all?status=1')
  Future<ActivityAccountResponse> getActivityAccount();

  @GET('/crm-sale/lead/search/all?status=1')
  Future<ActivityLeadResponse> getActivityLead();

  @GET('/crm-sale/opportunity/search/all?status=1')
  Future<ActivityOppResponse> getActivityOpp();

  @GET('/crm-sale/quote/search/all?status=1')
  Future<ActivityQouteResponse> getActivityQoute();

  @GET('/crm-sale/contract/search/all?status=1')
  Future<ActivityContractResponse> getActivityContract();

  @GET('/crm-sale/order/search/all?status=1')
  Future<ActivityOrderResponse> getActivityOrder();

  @GET('/crm/account-contact/account/{id}?objectTypeId=1')
  Future<ActivityContactResponse> getActivityContact(@Path('id') int id);

  /*
  * Account
  */

  // Filter kh??ch h??ng
  @GET('/crm/account/search')
  Future<AccountsResponse> searchAccounts(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Query('search') String search,
    @Query('ownerEmployeeId') String ownerEmployeeId,
    @Query('industryId') String industryId,
    @Query('accountTypeId') String accountTypeId,
    @Query('genderId') String genderId,
    @Query('relativeAccount') String relativeAccount,
    @Query('relativeContact') String relativeContact,
    @Query('accountBillingCountryId') String accountBillingCountryId,
    @Query('accountBillingProvinceId') int accountBillingProvinceId,
    @Query('accountBillingDistrictId') int accountBillingDistrictId,
    @Query('accountBillingWardId') int accountBillingWardId,
  );

  // Chi ti???t kh??ch h??ng
  @GET('/crm/account/mobile/{id}')
  Future<AccountInfoResponse> getAccountDetail(@Path('id') int accountId);

  // Th??m th??ng tin kh??ch h??ng
  @POST('/crm/account')
  Future<AccountInfoResponse> insertAccount(@Body() AccountInfo request);

  // Update th??ng tin kh??ch h??ng
  @PUT('/crm/account/{id}')
  Future<AccountInfoResponse> updateAccount(
    @Path('id') int accountId,
    @Body() AccountInfo request,
  );

  // Xo?? kh??ch h??ng
  @DELETE('/crm/account/{id}')
  Future<BaseResponse> deleteAccount(@Path('id') int accountId);

  // L???y s??? l?????ng giao d???ch theo kh??ch h??ng
  @GET('/crm-sale/count/accountId/{id}')
  Future<AccountCountResponse> getAccountCount(@Path('id') int accountId);

  // Kho?? kh??ch h??ng
  @PUT('/crm/account/active/{id}')
  Future<AccountResponse> lockAccount(@Path('id') int accountId);

  /*
  * Account - Address
  */
  // Th??m ?????a ch??? - Kh??ch h??ng
  @POST('/crm/account-address/mobile')
  Future<BaseResponse> insertAccountAddress(
    @Body() AccountAddressRequest request,
  );

  // C???p nh???t ?????a ch??? - Kh??ch h??ng
  @PUT('/crm/account-address/mobile/{id}')
  Future<BaseResponse> updateAccountAddress(
    @Path('id') int id,
    @Body() AccountAddressRequest request,
  );

  //Xo?? ?????a ch??? - Kh??ch h??ng
  @DELETE('/crm/account-address/mobile/{id}')
  Future<BaseResponse> deleteAccountAddress(@Path('id') int id);

/*
  * Account - Document
  */
  // Th??m gi???y t??? - Kh??ch h??ng
  @POST('/crm/account-doccument/mobile')
  Future<BaseResponse> insertAccountDocument(
    @Body() AccountDocumentRequest request,
  );

  // C???p nh???t gi???y t??? - Kh??ch h??ng
  @PUT('/crm/account-doccument/mobile/{id}')
  Future<BaseResponse> updateAccountDocument(
    @Path('id') int id,
    @Body() AccountDocumentRequest request,
  );

  //Xo?? gi???y t??? - Kh??ch h??ng
  @DELETE('/crm/account-doccument/mobile/{id}')
  Future<BaseResponse> deleteAccountDocument(@Path('id') int id);

  /*
  * Account - Party involved
  */
  // Nh??n s??? li??n quan - Kh??ch h??ng
  @GET('/crm/account-party-involved/account/{id}')
  Future<AccountPartyInvolvedResponse> getAccountPartyInvolved(
      @Path('id') int accountId);

  // Th??m nh??n s??? li??n quan - Kh??ch h??ng
  @POST('/crm/account-party-involved/account')
  Future<BaseResponse> insertAccountPartyInvolved(
    @Body() AccountPartyInvolvedRequest request,
  );

  // C???p nh???t nh??n s??? li??n quan - Kh??ch h??ng
  @PUT('/crm/account-party-involved/{id}')
  Future<BaseResponse> updateAccountPartyInvolved(
    @Path('id') int id,
    @Body() AccountPartyInvolvedRequest request,
  );

  //Xo?? Nh??n s??? li??n quan - Kh??ch h??ng
  @DELETE('/crm/account-party-involved/{id}')
  Future<BaseResponse> deleteAccountPartyInvolved(@Path('id') int accountId);

  /*
  * Account - Contact
  */
  // M???i quan h??? li??n quan - Kh??ch h??ng
  @GET('/crm/account-contact/account/{id}')
  Future<AccountContactResponse> getAccountContact(@Path('id') int accountId);

  // Th??m m???i quan h??? li??n quan (Ng?????i li??n h???) - Kh??ch h??ng
  @POST('/crm/account-contact/account')
  Future<BaseResponse> insertAccountContact(
      @Body() AccountContactRequest accountId);

  // Th??m m???i quan h??? li??n quan (Kh??ch h??ng) - Kh??ch h??ng
  @POST('/crm/account-contact/account-account')
  Future<BaseResponse> insertAccountContactAccount(
      @Body() AccountContactAccountRequest accountId);

  // C???p nh???t m???i quan h??? li??n quan - Kh??ch h??ng
  @PUT('/crm/account-contact/{id}')
  Future<BaseResponse> updateAccountContact(
    @Path('id') int id,
    @Body() AccountContactRequest request,
  );
  //Xo?? M???i quan h??? li??n quan  - Kh??ch h??ng
  @DELETE('/crm/account-contact/{id}')
  Future<BaseResponse> deleteAccountContact(@Path('id') int accountId);

  /*
  * Contact - Ng?????i li??n h???
  */
  // L???y danh s??ch t???t c??? ng?????i li??n h???:
  @GET('/crm/contact/search/all?status=1')
  Future<ContactAllResponse> getAllContacts();

  // L???y danh s??ch ng?????i li??n h???:
  // - N???u search r???ng l?? l???y t???t c???
  @GET('/crm/contact/search')
  Future<ContactsResponse> getContacts(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Query('search') String search,
    @Query('genderId') int genderId,
    @Query('contactBillingCountryId') String countryId,
    @Query('contactBillingProvinceId') int provinceId,
    @Query('contactBillingDistrictId') int districtId,
    @Query('contactBillingWardId') int wardId,
  );

  // L???y chi ti???t ng?????i li??n h???
  @GET('/crm/contact/mobile/{id}')
  Future<ContactResponse> getContactDetail(@Path('id') int id);

  // Th??m m???i th??ng tin ng?????i li??n h???
  @POST('/crm/contact')
  Future<ContactResponse> insertContact(
    @Body() Contact request,
  );

  // C???p nh???t th??ng tin ng?????i li??n h???
  @PUT('/crm/contact/{id}')
  Future<ContactResponse> updateContact(
    @Path('id') int contactId,
    @Body() Contact request,
  );

  // Xo?? ng?????i li??n h???
  @DELETE('/crm/contact/{id}')
  Future<BaseResponse> deleteContact(@Path('id') int id);

  /*
  * Contact - Ng?????i li??n h??? - Nh??n s??? li??n quan
  */
  // Nh??n s??? li??n quan - Ng?????i li??n h???
  @GET('/crm/contact-party-involved/contact/{id}')
  Future<ContactPartyInvolvedResponse> getContactPartyInvolved(
      @Path('id') int contactId);

  // Th??m nh??n s??? li??n quan - Ng?????i li??n h???
  @POST('/crm/contact-party-involved/contact')
  Future<BaseResponse> insertContactPartyInvolved(
    @Body() ContactPartyInvolvedRequest request,
  );

  // C???p nh???t nh??n s??? li??n quan - Ng?????i li??n h???
  @PUT('/crm/contact-party-involved/{id}')
  Future<BaseResponse> updateContactPartyInvolved(
    @Path('id') int id,
    @Body() ContactPartyInvolvedRequest request,
  );

  //Xo?? Nh??n s??? li??n quan - Ng?????i li??n h???
  @DELETE('/crm/contact-party-involved/{id}')
  Future<BaseResponse> deleteContactPartyInvolved(@Path('id') int contactId);

  /*
  * Contact - Ng?????i li??n h??? - M???i quan h??? li??n quan
  */
  // M???i quan h??? li??n quan - Ng?????i li??n h???
  @GET('/crm/contact/account/{id}')
  Future<ContactAccountResponse> getContactRelated(
      @Path('id') int contactId);

  /*
  * Lead - Kh??ch h??ng ti???m n??ng
  */

  // L???y danh s??ch kh??ch h??ng ti???m n??ng:
  // - N???u search r???ng l?? l???y t???t c???
  @GET('/crm-sale/lead/mobile/search')
  Future<LeadsResponse> getLeads(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Query('search') String search, {
    @Query('leadSourceId') String? leadSourceId,
    @Query('stageId') String? stageId,
    @Query('productId') String? productId,
    @Query('employeeId') String? employeeId,
    @Query('leadPotentialLevelId') String? leadPotentialLevelId,
    @Query('fromStartDate') String? fromDate,
    @Query('toStartDate') String? toDate,
  });

  // L???y chi ti???t kh??ch h??ng ti???m n??ng
  @GET('/crm-sale/lead/mobile/{id}')
  Future<LeadDetailResponse> getLeadDetail(@Path('id') int id);

  // Th??m kh??ch h??ng ti???m n??ng
  @POST('/crm-sale/lead')
  Future<LeadDetailResponse> createLead(@Body() LeadDetail request);

  // X??a kh??ch h??ng ti???m n??ng
  @DELETE('/crm-sale/lead/{id}')
  Future<BaseResponse> deleteLead(@Path('id') int id);

  // C???p nh???t kh??ch h??ng ti???m n??ng
  @PUT('/crm-sale/lead/{id}')
  Future<BaseResponse> updateLead(
      @Path('id') int id, @Body() LeadDetail request);

  // C???p nh???t tr???ng th??i kh??ch h??ng ti???m n??ng
  @PUT('/crm-sale/lead/mobile/update-lead-status')
  Future<BaseResponse> updateLeadStatus(@Body() LeadStatusRequest request);

  // C???p nh???t th??ng tin kh??ch h??ng ti???m n??ng
  @PUT('/crm-sale/lead/mobile/update-lead-information')
  Future<BaseResponse> updateLeadInfo(@Body() LeadInfoRequest request);

  // C???p nh???t th??ng tin kh??ch h??ng ti???m n??ng
  @PUT('/crm-sale/lead/mobile/update-lead-address')
  Future<BaseResponse> updateLeadAddress(@Body() LeadAddressRequest request);

  // C???p nh???t th??ng tin kh??ch h??ng ti???m n??ng
  @PUT('/crm-sale/lead/mobile/update-lead-additional-information')
  Future<BaseResponse> updateLeadAdditional(
      @Body() LeadAdditionalRequest request);

  // C???p nh???t tr???ng th??i kh??ch h??ng ti???m n??ng
  @PUT('/crm-sale/lead/stage/{id}')
  Future<BaseResponse> updateLeadStage(
      @Path('id') int id, @Body() LeadStageRequest request);

  // Ki???m tra s??? ??i???n tho???i ???? t???n t???i trong h??? th???ng hay ch??a
  @GET('/crm-sale/count/leadPhone')
  Future<LeadUsedResponse> checkLeadPhoneExist(
    @Query('leadPhone') String leadPhone,
  );

  // Chuy???n ?????i kh??ch hang ti???m n??ng th??nh c?? h???i b??n h??ng
  @POST('/crm/sale-module-service/convert-lead-to-opp')
  Future<BaseResponse> leadConvert(@Body() LeadConvertRequest request);

  // Danh s??ch l?? do ????ng v?? kh??ng chuy???n ?????i
  @GET('/crm-sale/lead-stage-reason/{id}')
  Future<LeadStageReasonResponse> leadStageReason(@Path('id') int id);

  // L???y th??ng tin ?????a ch??? c??? th??? t??? ?????a ch??? qu??t ???????c tr??n cccd
  @GET('/crm/address/get-address')
  Future<LeadFormatAddressResponse> getAddressDetailFromString(
    @Query('fullAddress') String fullAddress,
  );

  /*
  * Lead party involved - Nh??n s??? li??n quan - KHTN
  */

  // L???y danh s??ch nh??n s???
  @GET('/crm-sale/sale-party-involved/lead/{id}')
  Future<LeadPartyInvolvedResponse> getLeadPartyInvolved(@Path('id') int id);

  // Th??m nh??n s??? li??n quan
  @POST('/crm-sale/sale-party-involved')
  Future<BaseResponse> insertLeadPartyInvolved(
    @Body() LeadPartyInvolvedRequest request,
  );

  // C???p nh???t nh??n s??? li??n quan
  @PUT('/crm-sale/sale-party-involved/{id}')
  Future<BaseResponse> updateLeadPartyInvolved(
    @Path('id') int id,
    @Body() LeadPartyInvolvedRequest request,
  );

  //Xo?? Nh??n s??? li??n quan
  @DELETE('/crm-sale/sale-party-involved/{id}')
  Future<BaseResponse> deleteLeadPartyInvolved(@Path('id') int id);

  /*
  * Product - S???n ph???m quan t??m - KHTN
  */

  // L???y danh s??ch s???n ph???m quan t??m c???a m???t KHTN
  @GET('/crm-sale/lead/product/mobile/{id}')
  Future<ProductsResponse> getLeadProducts(@Path('id') int id);

  /*
    * C?? h???i b??n h??ng
  */

  @GET('/crm-sale/opportunity/mobile/search')
  Future<OpportunitiesResponse> getOpportunities(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Query('search') String search, {
    @Query('leadSourceId') String? leadSourceId,
    @Query('employeeId') String? employeeId,
    @Query('accountId') String? accountId,
    @Query('currencyExchangeRateId') String? currencyExchangeRateId,
    @Query('productId') String? productId,
    @Query('stageId') String? stageId,
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('fromStartDate') String? fromStartDate,
    @Query('toStartDate') String? toStartDate,
  });

  // Get all kh??ch h??ng
  @GET('/crm/account/search/all?status=1')
  Future<OppAccountResponse> getAllAccount();

  // Get by id
  @GET('/crm-sale/opportunity/mobile/{id}')
  Future<OpportunityInfoResponse> getOpportunityById(
    @Path('id') int id,
  );

  // Get sale party involved list by opportunity id
  @GET('/crm-sale/sale-party-involved/mobile/opp/{id}')
  Future<OppSalePartyInvolvedListResponse> getOpportunitySalePartyInvolved(
    @Path('id') int id,
  );

  // Get product list by opportunity id
  @GET('/crm-sale/opportunity/item/mobile/{id}')
  Future<OpportunityProductItemResponse> getProductsByOpportunityId(
      @Path('id') int id);

  // X??a s???n ph???m trong c?? h???i b??n h??ng
  @DELETE('/crm-sale/opportunity-item/{id}')
  Future<BaseResponse> deleteProductInOpportunity(
    @Path('id') int id,
  );

  // T???o s???n ph???m trong c?? h???i b??n h??ng
  @POST('/crm-sale/opportunity/item/{id}')
  Future<BaseResponse> createProductInOpportunity(
    @Path('id') int opportunityId,
    @Body() OpportunityItemsRequest request,
  );

  // C???p nh???t tr???ng th??i c?? h???i b??n h??ng
  @PUT('/crm-sale/opportunity/mobile/update-opportunity-status')
  Future<BaseResponse> updateOpportunityStatus(
    @Body() OpportunityStatusRequest request,
  );

  // C???p nh???t th??ng tin c?? h???i b??n h??ng
  @PUT('/crm-sale/opportunity/mobile/update-opportunity-information')
  Future<BaseResponse> updateOpportunityInfo(
    @Body() OpportunityInfoRequest request,
  );

  // C???p nh???t th??ng tin b??? sung c?? h???i b??n h??ng
  @PUT('/crm-sale/opportunity/mobile/update-opportunity-additional-information')
  Future<BaseResponse> updateOpportunityAdditionalInfo(
    @Body() OpportunityAdditionalInformationRequest request,
  );

  // L???y nguy??n nh??n ????ng c?? h???i b??n h??ng
  @GET('/crm-sale/opportunity-stage-reason/{id}')
  Future<OpportunityStageReasonResponse> getOpportunityStageReason(
    @Path('id') int id,
  );

  // C???p nh???t giai ??o???n c?? h???i b??n h??ng
  @PUT('/crm-sale/opportunity/stage/{id}')
  Future<BaseResponse> updateOpportunityStage(
    @Path('id') int opportunityId,
    @Body() OpportunityStageRequest request,
  );

  // C???p nh???t s???n ph???m trong c?? h???i b??n h??ng
  @PUT('/crm-sale/opportunity-item/{id}')
  Future<BaseResponse> updateProductInOpportunity(
    @Path('id') int id,
    @Body() OpportunityItem request,
  );

  // DELETE opportunity by id
  @DELETE('/crm-sale/opportunity/{id}')
  Future<BaseResponse> deleteOpportunityById(@Path('id') int opportunityId);

  // Post new opportunity
  @POST('/crm-sale/opportunity')
  Future<BaseResponse> postNewOpportunity(
    @Body() OpportunityRequest request,
  );

  // Update opportunity
  @PUT('/crm-sale/opportunity/{id}')
  Future<BaseResponse> updateOpportunityById(
    @Path('id') int opportunityId,
    @Body() OpportunityRequest request,
  );

  // Th??m nh??n s??? li??n quan - opportunity
  @POST('/crm-sale/sale-party-involved')
  Future<BaseResponse> insertOpportunityPartyInvolved(
    @Body() OpportunityPartyInvolvedRequest request,
  );

  // C???p nh???t nh??n s??? li??n quan - opportunity
  @PUT('/crm-sale/sale-party-involved/{id}')
  Future<BaseResponse> updateOpportunityPartyInvolved(
    @Path('id') int id,
    @Body() OpportunityPartyInvolvedRequest request,
  );

  // X??a nh??n s??? li??n quan - opportunity
  @DELETE('/crm-sale/sale-party-involved/{id}')
  Future<BaseResponse> deleteOpportunityPartyInvolved(
    @Path('id') int id,
  );

  // Ch???n b???ng gi?? cho c?? h???i b??n h??ng
  @POST('/crm-sale/opportunity/price/{id}')
  Future<BaseResponse> selectPriceForOpportunity(
    @Path('id') int opportunityId,
    @Body() int priceId,
  );

  // L???y danh s??ch s???n ph???m theo b???ng gi?? v?? ti???n id
  @GET(
      '/crm/product-price/price/{id}?currencyExchangeRateId={currencyExchangeRateId}')
  Future<ProductsPriceResponse> getProductsByPriceId(
    @Path('id') int priceId,
    @Path('currencyExchangeRateId') int currencyExchangeRateId,
  );

  // C???p nh???t b???ng gi?? cho c?? h???i b??n h??ng
  @PUT('/crm-sale/opportunity/price/{id}')
  Future<BaseResponse> updatePriceForOpportunity(
    @Path('id') int opportunityId,
    @Body() int priceId,
  );
}

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

  // Lấy thông tin employee từ CRM
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

  // Lấy danh sách tất cả employee
  @GET('/crm/employee/search/all')
  Future<EmployeesResponse> getEmployees();

  // Lấy danh sách documentType theo accountType
  @GET('/crm/document-type/{id}')
  Future<CrmDocumentTypeResponse> getDocumentType(
      @Path('id') int accountTypeId);

  /*
  * Product
  */

  // Lấy danh sách tất cả employee
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

  // Lấy danh sách nhóm đối tượng
  @GET('/crm/authorization-group/search/all?status=1')
  Future<AuthorizationGroupResponse> getAuthorizationGroup();

  @GET('/crm/employee')
  Future<EmployeeInfoResponse> getEmployeeProfile(
    String uid,
  );

  // Lấy danh sách hoạt động từ CRM
  @POST('/crm/activity/filter')
  Future<ActivityResponse> getActivities(
    @Query('page') int page,
    @Query('size') int size,
    @Query('sort') String sort,
    @Body() ActivityRequest request,
  );

  // Lấy chi tiết hoạt động từ CRM
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

  // Cập nhật trạng thái hoạt động từ CRM
  @PUT('/crm/activity/state/{id}/{state}?include=next-states')
  Future<ActivityUpdateStateResponse> activityUpdateState(
    @Path('id') int int,
    @Path('state') String state,
  );

  // Tạo hoạt động
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

  // Filter khách hàng
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

  // Chi tiết khách hàng
  @GET('/crm/account/mobile/{id}')
  Future<AccountInfoResponse> getAccountDetail(@Path('id') int accountId);

  // Thêm thông tin khách hàng
  @POST('/crm/account')
  Future<AccountInfoResponse> insertAccount(@Body() AccountInfo request);

  // Update thông tin khách hàng
  @PUT('/crm/account/{id}')
  Future<AccountInfoResponse> updateAccount(
    @Path('id') int accountId,
    @Body() AccountInfo request,
  );

  // Xoá khách hàng
  @DELETE('/crm/account/{id}')
  Future<BaseResponse> deleteAccount(@Path('id') int accountId);

  // Lấy số lượng giao dịch theo khách hàng
  @GET('/crm-sale/count/accountId/{id}')
  Future<AccountCountResponse> getAccountCount(@Path('id') int accountId);

  // Khoá khách hàng
  @PUT('/crm/account/active/{id}')
  Future<AccountResponse> lockAccount(@Path('id') int accountId);

  /*
  * Account - Address
  */
  // Thêm địa chỉ - Khách hàng
  @POST('/crm/account-address/mobile')
  Future<BaseResponse> insertAccountAddress(
    @Body() AccountAddressRequest request,
  );

  // Cập nhật địa chỉ - Khách hàng
  @PUT('/crm/account-address/mobile/{id}')
  Future<BaseResponse> updateAccountAddress(
    @Path('id') int id,
    @Body() AccountAddressRequest request,
  );

  //Xoá địa chỉ - Khách hàng
  @DELETE('/crm/account-address/mobile/{id}')
  Future<BaseResponse> deleteAccountAddress(@Path('id') int id);

/*
  * Account - Document
  */
  // Thêm giấy tờ - Khách hàng
  @POST('/crm/account-doccument/mobile')
  Future<BaseResponse> insertAccountDocument(
    @Body() AccountDocumentRequest request,
  );

  // Cập nhật giấy tờ - Khách hàng
  @PUT('/crm/account-doccument/mobile/{id}')
  Future<BaseResponse> updateAccountDocument(
    @Path('id') int id,
    @Body() AccountDocumentRequest request,
  );

  //Xoá giấy tờ - Khách hàng
  @DELETE('/crm/account-doccument/mobile/{id}')
  Future<BaseResponse> deleteAccountDocument(@Path('id') int id);

  /*
  * Account - Party involved
  */
  // Nhân sự liên quan - Khách hàng
  @GET('/crm/account-party-involved/account/{id}')
  Future<AccountPartyInvolvedResponse> getAccountPartyInvolved(
      @Path('id') int accountId);

  // Thêm nhân sự liên quan - Khách hàng
  @POST('/crm/account-party-involved/account')
  Future<BaseResponse> insertAccountPartyInvolved(
    @Body() AccountPartyInvolvedRequest request,
  );

  // Cập nhật nhân sự liên quan - Khách hàng
  @PUT('/crm/account-party-involved/{id}')
  Future<BaseResponse> updateAccountPartyInvolved(
    @Path('id') int id,
    @Body() AccountPartyInvolvedRequest request,
  );

  //Xoá Nhân sự liên quan - Khách hàng
  @DELETE('/crm/account-party-involved/{id}')
  Future<BaseResponse> deleteAccountPartyInvolved(@Path('id') int accountId);

  /*
  * Account - Contact
  */
  // Mối quan hệ liên quan - Khách hàng
  @GET('/crm/account-contact/account/{id}')
  Future<AccountContactResponse> getAccountContact(@Path('id') int accountId);

  // Thêm mối quan hệ liên quan (Người liên hệ) - Khách hàng
  @POST('/crm/account-contact/account')
  Future<BaseResponse> insertAccountContact(
      @Body() AccountContactRequest accountId);

  // Thêm mối quan hệ liên quan (Khách hàng) - Khách hàng
  @POST('/crm/account-contact/account-account')
  Future<BaseResponse> insertAccountContactAccount(
      @Body() AccountContactAccountRequest accountId);

  // Cập nhật mối quan hệ liên quan - Khách hàng
  @PUT('/crm/account-contact/{id}')
  Future<BaseResponse> updateAccountContact(
    @Path('id') int id,
    @Body() AccountContactRequest request,
  );
  //Xoá Mối quan hệ liên quan  - Khách hàng
  @DELETE('/crm/account-contact/{id}')
  Future<BaseResponse> deleteAccountContact(@Path('id') int accountId);

  /*
  * Contact - Người liên hệ
  */
  // Lấy danh sách tất cả người liên hệ:
  @GET('/crm/contact/search/all?status=1')
  Future<ContactAllResponse> getAllContacts();

  // Lấy danh sách người liên hệ:
  // - Nếu search rỗng là lấy tất cả
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

  // Lấy chi tiết người liên hệ
  @GET('/crm/contact/mobile/{id}')
  Future<ContactResponse> getContactDetail(@Path('id') int id);

  // Thêm mới thông tin người liên hệ
  @POST('/crm/contact')
  Future<ContactResponse> insertContact(
    @Body() Contact request,
  );

  // Cập nhật thông tin người liên hệ
  @PUT('/crm/contact/{id}')
  Future<ContactResponse> updateContact(
    @Path('id') int contactId,
    @Body() Contact request,
  );

  // Xoá người liên hệ
  @DELETE('/crm/contact/{id}')
  Future<BaseResponse> deleteContact(@Path('id') int id);

  /*
  * Contact - Người liên hệ - Nhân sự liên quan
  */
  // Nhân sự liên quan - Người liên hệ
  @GET('/crm/contact-party-involved/contact/{id}')
  Future<ContactPartyInvolvedResponse> getContactPartyInvolved(
      @Path('id') int contactId);

  // Thêm nhân sự liên quan - Người liên hệ
  @POST('/crm/contact-party-involved/contact')
  Future<BaseResponse> insertContactPartyInvolved(
    @Body() ContactPartyInvolvedRequest request,
  );

  // Cập nhật nhân sự liên quan - Người liên hệ
  @PUT('/crm/contact-party-involved/{id}')
  Future<BaseResponse> updateContactPartyInvolved(
    @Path('id') int id,
    @Body() ContactPartyInvolvedRequest request,
  );

  //Xoá Nhân sự liên quan - Người liên hệ
  @DELETE('/crm/contact-party-involved/{id}')
  Future<BaseResponse> deleteContactPartyInvolved(@Path('id') int contactId);

  /*
  * Contact - Người liên hệ - Mối quan hệ liên quan
  */
  // Mối quan hệ liên quan - Người liên hệ
  @GET('/crm/contact/account/{id}')
  Future<ContactAccountResponse> getContactRelated(
      @Path('id') int contactId);

  /*
  * Lead - Khách hàng tiềm năng
  */

  // Lấy danh sách khách hàng tiềm năng:
  // - Nếu search rỗng là lấy tất cả
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

  // Lấy chi tiết khách hàng tiềm năng
  @GET('/crm-sale/lead/mobile/{id}')
  Future<LeadDetailResponse> getLeadDetail(@Path('id') int id);

  // Thêm khách hàng tiềm năng
  @POST('/crm-sale/lead')
  Future<LeadDetailResponse> createLead(@Body() LeadDetail request);

  // Xóa khách hàng tiềm năng
  @DELETE('/crm-sale/lead/{id}')
  Future<BaseResponse> deleteLead(@Path('id') int id);

  // Cập nhật khách hàng tiềm năng
  @PUT('/crm-sale/lead/{id}')
  Future<BaseResponse> updateLead(
      @Path('id') int id, @Body() LeadDetail request);

  // Cập nhật trạng thái khách hàng tiềm năng
  @PUT('/crm-sale/lead/mobile/update-lead-status')
  Future<BaseResponse> updateLeadStatus(@Body() LeadStatusRequest request);

  // Cập nhật thông tin khách hàng tiềm năng
  @PUT('/crm-sale/lead/mobile/update-lead-information')
  Future<BaseResponse> updateLeadInfo(@Body() LeadInfoRequest request);

  // Cập nhật thông tin khách hàng tiềm năng
  @PUT('/crm-sale/lead/mobile/update-lead-address')
  Future<BaseResponse> updateLeadAddress(@Body() LeadAddressRequest request);

  // Cập nhật thông tin khách hàng tiềm năng
  @PUT('/crm-sale/lead/mobile/update-lead-additional-information')
  Future<BaseResponse> updateLeadAdditional(
      @Body() LeadAdditionalRequest request);

  // Cập nhật trạng thái khách hàng tiềm năng
  @PUT('/crm-sale/lead/stage/{id}')
  Future<BaseResponse> updateLeadStage(
      @Path('id') int id, @Body() LeadStageRequest request);

  // Kiểm tra số điện thoại đã tồn tại trong hệ thống hay chưa
  @GET('/crm-sale/count/leadPhone')
  Future<LeadUsedResponse> checkLeadPhoneExist(
    @Query('leadPhone') String leadPhone,
  );

  // Chuyển đổi khách hang tiềm năng thành cơ hội bán hàng
  @POST('/crm/sale-module-service/convert-lead-to-opp')
  Future<BaseResponse> leadConvert(@Body() LeadConvertRequest request);

  // Danh sách lý do Đóng và không chuyển đổi
  @GET('/crm-sale/lead-stage-reason/{id}')
  Future<LeadStageReasonResponse> leadStageReason(@Path('id') int id);

  // Lấy thông tin địa chỉ cụ thể từ địa chỉ quét được trên cccd
  @GET('/crm/address/get-address')
  Future<LeadFormatAddressResponse> getAddressDetailFromString(
    @Query('fullAddress') String fullAddress,
  );

  /*
  * Lead party involved - Nhân sự liên quan - KHTN
  */

  // Lấy danh sách nhân sự
  @GET('/crm-sale/sale-party-involved/lead/{id}')
  Future<LeadPartyInvolvedResponse> getLeadPartyInvolved(@Path('id') int id);

  // Thêm nhân sự liên quan
  @POST('/crm-sale/sale-party-involved')
  Future<BaseResponse> insertLeadPartyInvolved(
    @Body() LeadPartyInvolvedRequest request,
  );

  // Cập nhật nhân sự liên quan
  @PUT('/crm-sale/sale-party-involved/{id}')
  Future<BaseResponse> updateLeadPartyInvolved(
    @Path('id') int id,
    @Body() LeadPartyInvolvedRequest request,
  );

  //Xoá Nhân sự liên quan
  @DELETE('/crm-sale/sale-party-involved/{id}')
  Future<BaseResponse> deleteLeadPartyInvolved(@Path('id') int id);

  /*
  * Product - Sản phẩm quan tâm - KHTN
  */

  // Lấy danh sách sản phẩm quan tâm của một KHTN
  @GET('/crm-sale/lead/product/mobile/{id}')
  Future<ProductsResponse> getLeadProducts(@Path('id') int id);

  /*
    * Cơ hội bán hàng
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

  // Get all khách hàng
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

  // Xóa sản phẩm trong cơ hội bán hàng
  @DELETE('/crm-sale/opportunity-item/{id}')
  Future<BaseResponse> deleteProductInOpportunity(
    @Path('id') int id,
  );

  // Tạo sản phẩm trong cơ hội bán hàng
  @POST('/crm-sale/opportunity/item/{id}')
  Future<BaseResponse> createProductInOpportunity(
    @Path('id') int opportunityId,
    @Body() OpportunityItemsRequest request,
  );

  // Cập nhật trạng thái cơ hội bán hàng
  @PUT('/crm-sale/opportunity/mobile/update-opportunity-status')
  Future<BaseResponse> updateOpportunityStatus(
    @Body() OpportunityStatusRequest request,
  );

  // Cập nhật thông tin cơ hội bán hàng
  @PUT('/crm-sale/opportunity/mobile/update-opportunity-information')
  Future<BaseResponse> updateOpportunityInfo(
    @Body() OpportunityInfoRequest request,
  );

  // Cập nhật thông tin bổ sung cơ hội bán hàng
  @PUT('/crm-sale/opportunity/mobile/update-opportunity-additional-information')
  Future<BaseResponse> updateOpportunityAdditionalInfo(
    @Body() OpportunityAdditionalInformationRequest request,
  );

  // Lấy nguyên nhân đóng cơ hội bán hàng
  @GET('/crm-sale/opportunity-stage-reason/{id}')
  Future<OpportunityStageReasonResponse> getOpportunityStageReason(
    @Path('id') int id,
  );

  // Cập nhật giai đoạn cơ hội bán hàng
  @PUT('/crm-sale/opportunity/stage/{id}')
  Future<BaseResponse> updateOpportunityStage(
    @Path('id') int opportunityId,
    @Body() OpportunityStageRequest request,
  );

  // Cập nhật sản phẩm trong cơ hội bán hàng
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

  // Thêm nhân sự liên quan - opportunity
  @POST('/crm-sale/sale-party-involved')
  Future<BaseResponse> insertOpportunityPartyInvolved(
    @Body() OpportunityPartyInvolvedRequest request,
  );

  // Cập nhật nhân sự liên quan - opportunity
  @PUT('/crm-sale/sale-party-involved/{id}')
  Future<BaseResponse> updateOpportunityPartyInvolved(
    @Path('id') int id,
    @Body() OpportunityPartyInvolvedRequest request,
  );

  // Xóa nhân sự liên quan - opportunity
  @DELETE('/crm-sale/sale-party-involved/{id}')
  Future<BaseResponse> deleteOpportunityPartyInvolved(
    @Path('id') int id,
  );

  // Chọn bảng giá cho cơ hội bán hàng
  @POST('/crm-sale/opportunity/price/{id}')
  Future<BaseResponse> selectPriceForOpportunity(
    @Path('id') int opportunityId,
    @Body() int priceId,
  );

  // Lấy danh sách sản phẩm theo bảng giá và tiện id
  @GET(
      '/crm/product-price/price/{id}?currencyExchangeRateId={currencyExchangeRateId}')
  Future<ProductsPriceResponse> getProductsByPriceId(
    @Path('id') int priceId,
    @Path('currencyExchangeRateId') int currencyExchangeRateId,
  );

  // Cập nhật bảng giá cho cơ hội bán hàng
  @PUT('/crm-sale/opportunity/price/{id}')
  Future<BaseResponse> updatePriceForOpportunity(
    @Path('id') int opportunityId,
    @Body() int priceId,
  );
}

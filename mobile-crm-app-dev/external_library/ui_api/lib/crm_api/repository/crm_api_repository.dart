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

  // Lấy danh sách nhóm đối tượng
  Future<AuthorizationGroupResponse> getAuthorizationGroup();

// Lấy danh sách loại giấy tờ
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
  // Địa chỉ khách hàng
  Future<BaseResponse> insertAccountAddress(AccountAddressRequest request);

  Future<BaseResponse> updateAccountAddress(
      int id, AccountAddressRequest request);

  Future<BaseResponse> deleteAccountAddress(int accountId);

/*
  * Account - Document
  */
  // Giấy tờ khách hàng
  Future<BaseResponse> insertAccountDocument(AccountDocumentRequest request);

  Future<BaseResponse> updateAccountDocument(
      int id, AccountDocumentRequest request);

  Future<BaseResponse> deleteAccountDocument(int accountId);

  /*
  * Account - Party involved
  */
  // Nhân sự liên quan
  Future<AccountPartyInvolvedResponse> getAccountPartyInvolved(int accountId);

  Future<BaseResponse> insertAccountPartyInvolved(
      AccountPartyInvolvedRequest request);

  Future<BaseResponse> updateAccountPartyInvolved(
      int id, AccountPartyInvolvedRequest request);

  Future<BaseResponse> deleteAccountPartyInvolved(int accountId);

  /*
  * Account - Contact
  */
  // Mối quan hệ liên quan
  Future<AccountContactResponse> getAccountContact(int accountId);

  Future<BaseResponse> insertAccountContact(AccountContactRequest request);

  Future<BaseResponse> insertAccountContactAccount(
      AccountContactAccountRequest request);

  Future<BaseResponse> updateAccountContact(
      int id, AccountContactRequest request);

  Future<BaseResponse> deleteAccountContact(int accountId);

  /*
  * Contact - Người liên hệ
  */
  // Lấy danh sách tất cả người liên hệ:
  Future<ContactAllResponse> getAllContacts();

  // Lấy danh sách người liên hệ:
  // - Nếu search rỗng là lấy tất cả
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

  // Lấy chi tiết người liên hệ
  Future<ContactResponse> getContactDetail(int id);

  // Thêm mới người liên hệ
  Future<ContactResponse> insertContact(Contact request);

  // Cập nhật người liên hệ
  Future<ContactResponse> updateContact(int id, Contact request);

  // Xoá người liên hệ
  Future<BaseResponse> deleteContact(int id);

  /*
  * Contact - Người liên hệ - Nhân sự liên quan
  */
  // Nhân sự liên quan
  Future<ContactPartyInvolvedResponse> getContactPartyInvolved(int contactId);

  // Thêm Nhân sự liên quan
  Future<BaseResponse> insertContactPartyInvolved(
      ContactPartyInvolvedRequest request);

  // Cập nhật nhân sự liên quan
  Future<BaseResponse> updateContactPartyInvolved(
      int id, ContactPartyInvolvedRequest request);

  //Xoá Nhân sự liên quan
  Future<BaseResponse> deleteContactPartyInvolved(int contactId);

  /*
  * Contact - Người liên hệ - Mối quan hệ liên quan
  */
  // Mối quan hệ liên quan
  Future<ContactAccountResponse> getContactRelated(int contactId);

  /*
  * Lead - Khách hàng tiềm năng
  */

  // Lấy danh sách khách hàng tiềm năng:
  // - Nếu search rỗng là lấy tất cả
  Future<LeadsResponse> getLeads(
    int page,
    int size,
    String sort,
    String search,
    LeadFilterRequest request,
  );

  // Lấy chi tiết khách hàng tiềm năng
  Future<LeadDetailResponse> getLeadDetail(int id);

  // Thêm khách hàng tiềm năng
  Future<LeadDetailResponse> createLead(LeadDetail request);

  // Xóa khách hàng tiềm năng
  Future<BaseResponse> deleteLead(int id);

  // Cập nhật khách hàng tiềm năng
  Future<BaseResponse> updateLead(int id, LeadDetail request);

  // Cập nhật trạng thái khách hàng tiềm năng
  Future<BaseResponse> updateLeadStage(int id, LeadStageRequest request);

  // Kiểm tra số điện thoại đã tồn tại trong hệ thống hay chưa
  Future<LeadUsedResponse> checkLeadPhoneExist(String leadPhone);

  // Chuyển đổi khách hang tiềm năng thành cơ hội bán hàng
  Future<BaseResponse> leadConvert(LeadConvertRequest request);

  // Danh sách lý do Đóng và không chuyển đổi
  Future<LeadStageReasonResponse> leadStageReason(int id);

  // Cập nhật trạng thái khách hàng tiềm năng
  Future<BaseResponse> updateLeadStatus(LeadStatusRequest request);

  // Cập nhật thông tin khách hàng tiềm năng
  Future<BaseResponse> updateLeadInfo(LeadInfoRequest request);

  // Cập nhật thông tin khách hàng tiềm năng
  Future<BaseResponse> updateLeadAddress(LeadAddressRequest request);

  // Cập nhật thông tin khách hàng tiềm năng
  Future<BaseResponse> updateLeadAdditional(LeadAdditionalRequest request);

  // Lấy thông tin địa chỉ cụ thể từ địa chỉ quét được trên cccd
  Future<LeadFormatAddressResponse> getAddressDetailFromString(
      String fullAddress);

  /*
  * Lead party involved - Nhân sự liên quan - KHTN
  */

  // Lấy danh sách nhân sự
  Future<LeadPartyInvolvedResponse> getLeadPartyInvolved(int id);

  // Thêm Nhân sự liên quan
  Future<BaseResponse> insertLeadPartyInvolved(
      LeadPartyInvolvedRequest request);

  // Cập nhật nhân sự liên quan
  Future<BaseResponse> updateLeadPartyInvolved(
      int id, LeadPartyInvolvedRequest request);

  //Xoá Nhân sự liên quan
  Future<BaseResponse> deleteLeadPartyInvolved(int id);

  /*
  * Products - Sản phẩm quan tâm - KHTN
  */

  // Lấy danh sách sản phẩm quan tâm của một KHTN
  Future<ProductsResponse> getLeadProducts(int id);

  /*
  * Opportunity - Cơ hội bán hàng
  */

  // Lấy danh sách cơ hội bán hàng:
  // - Nếu search rỗng là lấy tất cả
  Future<OpportunitiesResponse> getOpportunities(
    int page,
    int size,
    String sort,
    String search,
    OpportunityFilterRequest request,
  );

  // Get all danh sách khách hàng
  Future<OppAccountResponse> getAllAccount();

  // Lấy thông tin chi tiết cơ hội bán hàng
  Future<OpportunityInfoResponse> getOpportunityDetail(
    int opportunityId,
  );

  // Lấy nhân sự liên quan cơ hội bán hàng
  Future<OppSalePartyInvolvedListResponse> getOpportunitySalePartyInvolved(
    int opportunityId,
  );

  // Lấy sản phẩm liên quan cơ hội bán hàng
  Future<OpportunityProductItemResponse> getProductsByOpportunityId(
    int opportunityId,
  );

  // Xóa cơ hội bán hàng
  Future<BaseResponse> deleteOpportunityById(int opportunityId);

// Lấy lý do đóng thất bại cơ hội bán hàng
  Future<OpportunityStageReasonResponse> getOpportunityStageReason(
    int opportunityStageId,
  );

  // Cập nhật giai đoạn cơ hội bán hàng
  Future<BaseResponse> updateOpportunityStage(
    int opportunityId,
    OpportunityStageRequest request,
  );

  // Tạo mới cơ hội bán hàng
  Future<BaseResponse> postNewOpportunity(
    OpportunityRequest request,
  );

  // Cập nhật trạng thái cơ hội bán hàng
  Future<BaseResponse> updateOpportunityStatus(
    OpportunityStatusRequest request,
  );

  // Cập nhật thông tin cơ hội bán hàng
  Future<BaseResponse> updateOpportunityInfo(
    OpportunityInfoRequest request,
  );

  // Cập nhật thông tin bổ sung cơ hội bán hàng
  Future<BaseResponse> updateOpportunityAdditionalInfo(
    OpportunityAdditionalInformationRequest request,
  );

  // Cập nhật cơ hội bán hàng
  Future<BaseResponse> updateOpportunityById(
    int opportunityId,
    OpportunityRequest request,
  );

  // Chọn bảng giá cho cơ hội bán hàng
  Future<BaseResponse> selectPriceForOpportunity(
    int opportunityId,
    int priceId,
  );

  // Thêm nhân sự liên quan cho cơ hội bán hàng
  Future<BaseResponse> insertOpportunityPartyInvolved(
    OpportunityPartyInvolvedRequest request,
  );

  // Cập nhật nhân sự liên quan cho cơ hội bán hàng
  Future<BaseResponse> updateOpportunityPartyInvolved(
    int id,
    OpportunityPartyInvolvedRequest request,
  );

  // Xóa nhân sự liên quan cho cơ hội bán hàng
  Future<BaseResponse> deleteOpportunityPartyInvolved(
    int id,
  );

  // Lấy danh sách sản phẩm theo bảng giá và tiện id
  Future<ProductsPriceResponse> getProductsByPriceId(
    int priceId,
    int currencyExchangeRateId,
  );

  // Thêm sản phẩm vào cơ hội bán hàng
  Future<BaseResponse> createProductInOpportunity(
    int opportunityId,
    OpportunityItemsRequest request,
  );

  // Cập nhật sản phẩm trong cơ hội bán hàng
  Future<BaseResponse> updateProductInOpportunity(
    int id,
    OpportunityItem request,
  );

  // Xóa sản phẩm trong cơ hội bán hàng
  Future<BaseResponse> deleteProductInOpportunity(int id);

  // Cập nhật bảng giá cho cơ hội bán hàng
  Future<BaseResponse> updatePriceForOpportunity(
    int opportunityId,
    int priceId,
  );
}

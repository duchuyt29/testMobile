import 'package:get/get.dart';

import '../modules/crm/crm_activity/activity/binding/crm_activity_binding.dart';
import '../modules/crm/crm_activity/activity/views/crm_activity_page.dart';
import '../modules/crm/crm_activity/activity_detail/bindings/crm_detail_activity_bindings.dart';
import '../modules/crm/crm_activity/activity_detail/views/crm_detail_activity_page.dart';
import '../modules/crm/crm_activity/activity_detail_detail/bindings/crm_detail_detail_activity_bindings.dart';
import '../modules/crm/crm_activity/activity_detail_detail/views/crm_detail_detail_activity_page.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_account/bindings/activity_account_binding.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_account/views/activity_account_page.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_contact/bindings/activity_contact_binding.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_contact/views/activity_contact_page.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_contract/bindings/activity_contract_binding.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_contract/views/activity_contract_page.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_lead/bindings/activity_lead_binding.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_lead/views/activity_lead_page.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_opp/bindings/activity_opp_binding.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_opp/views/activity_opp_page.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_order/bindings/activity_order_binding.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_order/views/activity_order_page.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_qoute/bindings/activity_qoute_binding.dart';
import '../modules/crm/crm_activity/activity_get_data/activity_qoute/views/activity_qoute_page.dart';
import '../modules/crm/crm_activity/all_activity/bindings/crm_all_activity_bindings.dart';
import '../modules/crm/crm_activity/all_activity/views/crm_all_activity_page.dart';
import '../modules/crm/crm_activity/filter_activity/bindings/crm_filter_activity_bindings.dart';
import '../modules/crm/crm_activity/filter_activity/views/crm_filter_activity_page.dart';
import '../modules/crm/crm_activity/form_activity/add_form_appointment_activity/bindings/crm_add_form_appointment_bindings.dart';
import '../modules/crm/crm_activity/form_activity/add_form_appointment_activity/views/crm_add_form_appointment_page.dart';
import '../modules/crm/crm_activity/form_activity/add_form_call_activity/bindings/crm_add_form_call_activity_binding.dart';
import '../modules/crm/crm_activity/form_activity/add_form_call_activity/views/crm_add_form_call_activity_page.dart';
import '../modules/crm/crm_activity/form_activity/add_form_email_activity/bindings/crm_add_form_email_bindings.dart';
import '../modules/crm/crm_activity/form_activity/add_form_email_activity/views/crm_add_form_email_page.dart';
import '../modules/crm/crm_activity/form_activity/add_form_job_activity/bindings/crm_add_form_job_bindings.dart';
import '../modules/crm/crm_activity/form_activity/add_form_job_activity/views/crm_add_form_job_page.dart';
import '../modules/crm/crm_master_data/crm_account/bindings/accounts_binding.dart';
import '../modules/crm/crm_master_data/crm_account/views/accounts_page.dart';
import '../modules/crm/crm_master_data/crm_address/crm_address_district/bindings/crm_address_district_binding.dart';
import '../modules/crm/crm_master_data/crm_address/crm_address_district/views/crm_address_district_page.dart';
import '../modules/crm/crm_master_data/crm_address/crm_address_province/bindings/crm_address_province_binding.dart';
import '../modules/crm/crm_master_data/crm_address/crm_address_province/views/crm_address_province_page.dart';
import '../modules/crm/crm_master_data/crm_address/crm_address_ward/bindings/crm_address_ward_binding.dart';
import '../modules/crm/crm_master_data/crm_address/crm_address_ward/views/crm_address_ward_page.dart';
import '../modules/crm/crm_master_data/crm_authorization_group/bindings/authorization_group_binding.dart';
import '../modules/crm/crm_master_data/crm_authorization_group/views/authorization_group_page.dart';
import '../modules/crm/crm_master_data/crm_contact/bindings/contact_binding.dart';
import '../modules/crm/crm_master_data/crm_contact/views/contact_page.dart';
import '../modules/crm/crm_master_data/crm_currency_exchange_rate/add_currency_ex_rate/bindings/crm_add_currency_exchange_rate_binding.dart';
import '../modules/crm/crm_master_data/crm_currency_exchange_rate/add_currency_ex_rate/views/crm_add_currency_exchange_rate_page.dart';
import '../modules/crm/crm_master_data/crm_currency_exchange_rate/all_currency_ex_rate/bindings/crm_all_currency_exchange_rate_bindings.dart';
import '../modules/crm/crm_master_data/crm_currency_exchange_rate/all_currency_ex_rate/views/crm_all_currency_exchange_rate_screen.dart';
import '../modules/crm/crm_master_data/crm_currency_exchange_rate/crm_currency_exchange_rate/bindings/currency_exchange_rate_binding.dart';
import '../modules/crm/crm_master_data/crm_currency_exchange_rate/crm_currency_exchange_rate/views/crm_currency_exchange_rate_screen.dart';
import '../modules/crm/crm_master_data/crm_employee/bindings/employee_binding.dart';
import '../modules/crm/crm_master_data/crm_employee/views/employee_page.dart';
import '../modules/crm/crm_master_data/crm_md/bindings/crm_md_binding.dart';
import '../modules/crm/crm_master_data/crm_md/views/crm_md_page.dart';
import '../modules/crm/crm_master_data/crm_price/all_price/bindings/crm_all_price_binding.dart';
import '../modules/crm/crm_master_data/crm_price/all_price/views/crm_all_price_page.dart';
import '../modules/crm/crm_master_data/crm_price/create_new_price/bindings/crm_create_new_price_binding.dart';
import '../modules/crm/crm_master_data/crm_price/create_new_price/views/crm_create_new_price_page.dart';
import '../modules/crm/crm_master_data/crm_price/create_product_in_price/bindings/crm_create_product_in_price_bindings.dart';
import '../modules/crm/crm_master_data/crm_price/create_product_in_price/views/crm_create_product_in_price_page.dart';
import '../modules/crm/crm_master_data/crm_price/details_price/bindings/crm_details_price_binding.dart';
import '../modules/crm/crm_master_data/crm_price/details_price/views/crm_details_price_page.dart';
import '../modules/crm/crm_master_data/crm_price/price/bindings/crm_price_binding.dart';
import '../modules/crm/crm_master_data/crm_price/price/views/crm_price_page.dart';
import '../modules/crm/crm_master_data/crm_price/related_information_price/bindings/crm_Related_information.bindings.dart';
import '../modules/crm/crm_master_data/crm_price/related_information_price/views/crm_Related_information_pages.dart';
import '../modules/crm/crm_master_data/crm_product/all_product/bindings/crm_all_product_binding.dart';
import '../modules/crm/crm_master_data/crm_product/all_product/views/crm_all_product_page.dart';
import '../modules/crm/crm_master_data/crm_product/detail_detail_product/bindings/detail_detail_product_binding.dart';
import '../modules/crm/crm_master_data/crm_product/detail_detail_product/views/detail_detail_product_page.dart';
import '../modules/crm/crm_master_data/crm_product/detail_product/bindings/crm_detail_product_bindings.dart';
import '../modules/crm/crm_master_data/crm_product/detail_product/views/crm_detail_product_page.dart';
import '../modules/crm/crm_master_data/crm_product/home/bindings/crm_product_binding.dart';
import '../modules/crm/crm_master_data/crm_product/home/views/crm_product_home_page.dart';
import '../modules/crm/crm_master_data/crm_product/information_related/bindings/crm_information_related_product_binding.dart';
import '../modules/crm/crm_master_data/crm_product/information_related/information_related_form/add_price_form/bindings/crm_add_price_form_binding.dart';
import '../modules/crm/crm_master_data/crm_product/information_related/information_related_form/add_price_form/views/crm_add_price_form_page.dart';
import '../modules/crm/crm_master_data/crm_product/information_related/information_related_form/add_price_standard_form/bindings/crm_add_price_standard_form_binding.dart';
import '../modules/crm/crm_master_data/crm_product/information_related/information_related_form/add_price_standard_form/views/crm_add_price_standard_form_page.dart';
import '../modules/crm/crm_master_data/crm_product/information_related/views/crm_information_related_product_page.dart';
import '../modules/crm/crm_master_data/crm_product/product_form/bindings/crm_product_form_binding.dart';
import '../modules/crm/crm_master_data/crm_product/product_form/views/crm_product_form_page.dart';
import '../modules/crm/crm_master_data/crm_product/products_filter/bindings/products_filter_binding.dart';
import '../modules/crm/crm_master_data/crm_product/products_filter/views/products_filter_page.dart';
import '../modules/crm/crm_master_data/crm_product_management/bindings/product_management_binding.dart';
import '../modules/crm/crm_master_data/crm_product_management/views/product_management_screen.dart';
import '../modules/crm/crm_master_data/crm_productfamily/crm_productfamily/binding/crm_product_family_binding.dart';
import '../modules/crm/crm_master_data/crm_productfamily/crm_productfamily/views/crm_product_family_screen.dart';
import '../modules/crm/crm_master_data/crm_productfamily/crm_productfamily_add/binding/crm_productfamily_add_binding.dart';
import '../modules/crm/crm_master_data/crm_productfamily/crm_productfamily_add/views/crm_productfamily_add_pages.dart';
import '../modules/crm/crm_master_data/crm_productfamily/crm_productfamily_detail/binding/crm_productfamily_detail_binding.dart';
import '../modules/crm/crm_master_data/crm_productfamily/crm_productfamily_detail/view/crm_productfamily_detail_page.dart';
import '../modules/crm/crm_master_data/crm_productfamily/crm_productfamily_edit/binding/crm_productfamily_add_binding.dart';
import '../modules/crm/crm_master_data/crm_productfamily/crm_productfamily_edit/views/crm_productfamily_edit_page.dart';
import '../modules/crm/crm_master_data/crm_productfamily/crm_productfamily_overview/binding/crm_productfamily_overview_binding.dart';
import '../modules/crm/crm_master_data/crm_productfamily/crm_productfamily_overview/views/crm_productfamily_overview_page.dart';
import '../modules/crm/crm_master_data/crm_select_account/bindings/crm_select_account_binding.dart';
import '../modules/crm/crm_master_data/crm_select_account/views/crm_select_account_screen.dart';
import '../modules/crm/crm_master_data/crm_settings/bindings/settings_binding.dart';
import '../modules/crm/crm_master_data/crm_settings/views/settings_screen.dart';
import '../modules/crm/crm_master_menu/bindings/crm_master_menu_binding.dart';
import '../modules/crm/crm_master_menu/views/crm_master_menu_page.dart';
import '../modules/crm/crm_sales/crm_account/account_address/account_address_form/bindings/account_address_form_bindings.dart';
import '../modules/crm/crm_sales/crm_account/account_address/account_address_form/views/account_address_form_page.dart';
import '../modules/crm/crm_sales/crm_account/account_address/account_address_view/bindings/account_address_view_bindings.dart';
import '../modules/crm/crm_sales/crm_account/account_address/account_address_view/views/account_address_view_page.dart';
import '../modules/crm/crm_sales/crm_account/account_contact/account_contact_createrelation/binding/acount_contact_createrelation_binding.dart';
import '../modules/crm/crm_sales/crm_account/account_contact/account_contact_createrelation/view/account_contact_createrelation_view.dart';
import '../modules/crm/crm_sales/crm_account/account_contact/account_contact_view/binding/crm_accountcontact_binding.dart';
import '../modules/crm/crm_sales/crm_account/account_contact/account_contact_view/view/crm_accountcontact_page.dart';
import '../modules/crm/crm_sales/crm_account/account_document/account_document_form/bindings/account_document_form_bindings.dart';
import '../modules/crm/crm_sales/crm_account/account_document/account_document_form/views/account_document_form_page.dart';
import '../modules/crm/crm_sales/crm_account/account_document/account_document_view/bindings/account_document_view_bindings.dart';
import '../modules/crm/crm_sales/crm_account/account_document/account_document_view/views/account_document_view_page.dart';
import '../modules/crm/crm_sales/crm_account/account_filter/binding/crm_account_filter_binding.dart';
import '../modules/crm/crm_sales/crm_account/account_filter/views/crm_account_filter_views.dart';
import '../modules/crm/crm_sales/crm_account/account_form_create/bindings/account_form_create_binding.dart';
import '../modules/crm/crm_sales/crm_account/account_form_create/views/account_form_create_screen.dart';
import '../modules/crm/crm_sales/crm_account/account_home/bindings/crm_account_bindings.dart';
import '../modules/crm/crm_sales/crm_account/account_home/views/crm_account_pages.dart';
import '../modules/crm/crm_sales/crm_account/account_identification/account_identification_form/bindings/crm_create_form_identification_bindings.dart';
import '../modules/crm/crm_sales/crm_account/account_identification/account_identification_form/views/crm_create_form_identification_page.dart';
import '../modules/crm/crm_sales/crm_account/account_identification/account_identification_view/bindings/account_identification_view_bindings.dart';
import '../modules/crm/crm_sales/crm_account/account_identification/account_identification_view/views/account_identification_view_page.dart';
import '../modules/crm/crm_sales/crm_account/account_information_form/bindings/crm_form_account_bindings.dart';
import '../modules/crm/crm_sales/crm_account/account_information_form/views/crm_form_account_page.dart';
import '../modules/crm/crm_sales/crm_account/account_search/bindings/crm_account_search_binding.dart';
import '../modules/crm/crm_sales/crm_account/account_search/views/crm_account_search_page.dart';
import '../modules/crm/crm_sales/crm_account/all_account/bindings/crm_all_account_bindings.dart';
import '../modules/crm/crm_sales/crm_account/all_account/views/crm_all_account_page.dart';
import '../modules/crm/crm_sales/crm_account/detail_account/bindings/crm_detail_account_bindings.dart';
import '../modules/crm/crm_sales/crm_account/detail_account/views/crm_detail_account_page.dart';
import '../modules/crm/crm_sales/crm_account/detail_detail_account/bindings/crm_detail_detail_account_bindings.dart';
import '../modules/crm/crm_sales/crm_account/detail_detail_account/views/crm_detail_detail_account_page.dart';
import '../modules/crm/crm_sales/crm_account/related_infomation/bindings/crm_related_information_binding.dart';
import '../modules/crm/crm_sales/crm_account/related_infomation/views/crm_account_related_infomation_page.dart';
import '../modules/crm/crm_sales/crm_account/relevant_personal/add_relevant_personal/binding/add_relevantpersonal_binding.dart';
import '../modules/crm/crm_sales/crm_account/relevant_personal/add_relevant_personal/view/add_relevantpersonal_view.dart';
import '../modules/crm/crm_sales/crm_account/relevant_personal/relevant_personal/binding/crm_relevant_personal_binding.dart';
import '../modules/crm/crm_sales/crm_account/relevant_personal/relevant_personal/views/crm_relevant_personal_pages.dart';
import '../modules/crm/crm_sales/crm_contact/all_contact/bindings/crm_all_contact_bindings.dart';
import '../modules/crm/crm_sales/crm_contact/all_contact/views/crm_all_contact_page.dart';
import '../modules/crm/crm_sales/crm_contact/contact_detail/bindings/crm_detail_detail_contact_bindings.dart';
import '../modules/crm/crm_sales/crm_contact/contact_detail/views/crm_detail_detail_contact_page.dart';
import '../modules/crm/crm_sales/crm_contact/contact_document/contact_document/binding/crm_document_contact_binding.dart';
import '../modules/crm/crm_sales/crm_contact/contact_document/contact_document/views/crm_document_contact_pages.dart';
import '../modules/crm/crm_sales/crm_contact/contact_document/contact_document_form/bindings/crm_contact_create_form_document_bindings.dart';
import '../modules/crm/crm_sales/crm_contact/contact_document/contact_document_form/views/crm_contact_create_form_document_page.dart';
import '../modules/crm/crm_sales/crm_contact/contact_filter/bindings/crm_filter_contact_bindings.dart';
import '../modules/crm/crm_sales/crm_contact/contact_filter/views/crm_fliter_contact_page.dart';
import '../modules/crm/crm_sales/crm_contact/contact_preview/bindings/crm_detail_contact_bindings.dart';
import '../modules/crm/crm_sales/crm_contact/contact_preview/views/crm_detail_contact_page.dart';
import '../modules/crm/crm_sales/crm_contact/contact_related_relationship/contact_related_view/binding/crm_contact_related_binding.dart';
import '../modules/crm/crm_sales/crm_contact/contact_related_relationship/contact_related_view/view/crm_contact_related_page.dart';
import '../modules/crm/crm_sales/crm_contact/form_contact_create/form_contact_address/bindings/crm_form_permanent_address_bindings.dart';
import '../modules/crm/crm_sales/crm_contact/form_contact_create/form_contact_address/views/crm_form_permanent_address_page.dart';
import '../modules/crm/crm_sales/crm_contact/form_contact_create/form_contact_information/bindings/crm_form_information_contact_bindings.dart';
import '../modules/crm/crm_sales/crm_contact/form_contact_create/form_contact_information/views/crm_form_information_contact_page.dart';
import '../modules/crm/crm_sales/crm_contact/form_contact_create/form_update_contact_information/bindings/crm_form_update_information_contact_bindings.dart';
import '../modules/crm/crm_sales/crm_contact/form_contact_create/form_update_contact_information/views/crm_form_update_information_contact_page.dart';
import '../modules/crm/crm_sales/crm_contact/relevant_personal/form_relevant_personal/bindings/form_relevantpersonal_binding.dart';
import '../modules/crm/crm_sales/crm_contact/relevant_personal/form_relevant_personal/views/form_relevantpersonal_page.dart';
import '../modules/crm/crm_sales/crm_contact/relevant_personal/relevant_personal/binding/crm_relevant_personal_binding.dart';
import '../modules/crm/crm_sales/crm_contact/relevant_personal/relevant_personal/views/crm_relevant_personal_pages.dart';
import '../modules/crm/crm_sales/crm_crm/bindings/crm_crm_binding.dart';
import '../modules/crm/crm_sales/crm_crm/views/crm_crm_page.dart';
import '../modules/crm/crm_sales/crm_lead/all_lead/bindings/crm_all_lead_bindings.dart';
import '../modules/crm/crm_sales/crm_lead/all_lead/views/crm_all_lead_screen.dart';
import '../modules/crm/crm_sales/crm_lead/convert_lead/convert_lead/binding/convert_lead_binding.dart';
import '../modules/crm/crm_sales/crm_lead/convert_lead/convert_lead/view/convert_lead_screen.dart';
import '../modules/crm/crm_sales/crm_lead/convert_lead/convert_lead_create_account/binding/convert_lead_create_account_binding.dart';
import '../modules/crm/crm_sales/crm_lead/convert_lead/convert_lead_create_account/view/convert_lead_create_account_screen.dart';
import '../modules/crm/crm_sales/crm_lead/convert_lead/convert_lead_search_account/binding/convert_lead_search_account_binding.dart';
import '../modules/crm/crm_sales/crm_lead/convert_lead/convert_lead_search_account/view/convert_lead_search_account_screen.dart';
import '../modules/crm/crm_sales/crm_lead/convert_lead/convert_lead_search_contact/binding/covert_lead_search_contact_binding.dart';
import '../modules/crm/crm_sales/crm_lead/convert_lead/convert_lead_search_contact/view/convert_lead_search_contact_screen.dart';
import '../modules/crm/crm_sales/crm_lead/convert_lead/detail_lead_convert_create_contact/binding/detail_lead_create_account.dart';
import '../modules/crm/crm_sales/crm_lead/convert_lead/detail_lead_convert_create_contact/view/detail_lead_create_contact_view.dart';
import '../modules/crm/crm_sales/crm_lead/create_lead/create_lead/bindings/crm_create_lead_bindings.dart';
import '../modules/crm/crm_sales/crm_lead/create_lead/create_lead/views/crm_create_lead_screen.dart';
import '../modules/crm/crm_sales/crm_lead/create_lead/create_lead_product/bindings/crm_create_lead_product_bindings.dart';
import '../modules/crm/crm_sales/crm_lead/create_lead/create_lead_product/views/crm_create_lead_product_screen.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sale_opportunity_info/binding/detail_lead_sale_opportunity_info_binding.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sale_opportunity_info/view/detail_lead_sale_opportunity_info_view.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sales_party_involes/a_create_detail_lead_sales_party_involes/binding/crm_create_detail_lead_sales_party_involes_binding.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sales_party_involes/a_create_detail_lead_sales_party_involes/view/crm_create_detail_lead_sales_party_involes_view.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sales_party_involes/a_search_detail_lead_sales_party_involes/binding/detail_lead_search_sales_party_involes_binding.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sales_party_involes/a_search_detail_lead_sales_party_involes/view/detail_lead_search_sale_party_involed_page.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sales_party_involes/detail_lead_sales_party_involes_create_users/binding/crm_detail_lead_sales_party_involes_create_user_binding.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sales_party_involes/detail_lead_sales_party_involes_create_users/view/crm_detail_lead_sales_party_involes_create_userview.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sales_party_involes/detail_lead_sales_party_involes_home/binding/crm_detail_lead_relevant_personal_binding.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sales_party_involes/detail_lead_sales_party_involes_home/views/crm_detail_lead_relevant_personal_pages.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sales_party_involes/detail_lead_sales_party_involes_search_users/binding/detail_lead_sales_party_search_user_involes_binding.dart';
import '../modules/crm/crm_sales/crm_lead/detail_lead_sales_party_involes/detail_lead_sales_party_involes_search_users/view/detail_lead_search_sale_party_involed_page.dart';
import '../modules/crm/crm_sales/crm_lead/edit_lead/edit_lead_addition_info/binding/crm_edit_lead_addition_info_binding.dart';
import '../modules/crm/crm_sales/crm_lead/edit_lead/edit_lead_addition_info/view/crm_edit_lead_addition_info_screen.dart';
import '../modules/crm/crm_sales/crm_lead/edit_lead/edit_lead_address/binding/crm_detail_lead_address_edit_binding.dart';
import '../modules/crm/crm_sales/crm_lead/edit_lead/edit_lead_address/view/crm_edit_address_screen.dart';
import '../modules/crm/crm_sales/crm_lead/edit_lead/edit_lead_info/binding/crm_edit_lead_info_binding.dart';
import '../modules/crm/crm_sales/crm_lead/edit_lead/edit_lead_info/view/crm_edit_info_screen.dart';
import '../modules/crm/crm_sales/crm_lead/edit_lead/edit_lead_status/binding/crm_edit_lead_status_binding.dart';
import '../modules/crm/crm_sales/crm_lead/edit_lead/edit_lead_status/view/crm_edit_lead_status_screen.dart';
import '../modules/crm/crm_sales/crm_lead/lead_detail/bindings/crm_lead_detail_bindings.dart';
import '../modules/crm/crm_sales/crm_lead/lead_detail/views/crm_lead_detail_screen.dart';
import '../modules/crm/crm_sales/crm_lead/lead_document/lead_doccument_home/bindings/crm_lead_document_bindings.dart';
import '../modules/crm/crm_sales/crm_lead/lead_document/lead_doccument_home/views/crm_lead_document_page.dart';
import '../modules/crm/crm_sales/crm_lead/lead_document/lead_document_form/bindings/crm_lead_create_form_document_bindings.dart';
import '../modules/crm/crm_sales/crm_lead/lead_document/lead_document_form/views/crm_lead_create_form_document_page.dart';
import '../modules/crm/crm_sales/crm_lead/lead_filter/binding/crm_lead_filter_binding.dart';
import '../modules/crm/crm_sales/crm_lead/lead_filter/views/crm_lead_filter_screen.dart';
// import '../modules/crm/crm_sales/crm_lead/lead_home/bindings/crm_lead_bindings.dart';
// import '../modules/crm/crm_sales/crm_lead/lead_home/views/crm_lead_pages.dart';
import '../modules/crm/crm_sales/crm_lead/lead_products/form_add_product_care/bindings/crm_form_lead_add_product_care_bindings.dart';
import '../modules/crm/crm_sales/crm_lead/lead_products/form_add_product_care/views/crm_form_lead_add_product_care_page.dart';
import '../modules/crm/crm_sales/crm_lead/lead_products/lead_products/bindings/crm_lead_products_bindings.dart';
import '../modules/crm/crm_sales/crm_lead/lead_products/lead_products/views/crm_lead_products_screen.dart';
import '../modules/crm/crm_sales/crm_lead/lead_products/lead_products_edit/bindings/crm_lead_products_edit_bindings.dart';
import '../modules/crm/crm_sales/crm_lead/lead_products/lead_products_edit/views/crm_lead_products_edit_screen.dart';
import '../modules/crm/crm_sales/crm_lead/overview_lead/bindings/crm_overview_lead_bindings.dart';
import '../modules/crm/crm_sales/crm_lead/overview_lead/views/crm_overview_lead_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/crm_opportunity_additional_form/bindings/crm_opportunity_additional_form_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/crm_opportunity_additional_form/views/crm_opportunity_additional_form_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/crm_opportunity_filter/bindings/crm_opportunity_filter_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/crm_opportunity_filter/views/crm_opportunity_filter_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity-sale-party-involved/bindings/opportunity_sale_party_involved_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity-sale-party-involved/opportunity-sale-party-involved-form/bindings/opportunity_sale_party_involved_form_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity-sale-party-involved/opportunity-sale-party-involved-form/views/opportunity_sale_party_involved_form_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity-sale-party-involved/views/opportunity_sale_party_involved_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_detail/bindings/opportunity_detail_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_detail/views/opportunity_detail_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_detail_info/bindings/opportunity_detail_info_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_detail_info/views/opportunity_detail_info_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_form/bindings/opportunity_form_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_form/views/opportunity_form_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_home/bindings/crm_opportunity_bindings.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_home/views/crm_opportunity_pages.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_info_form/binding/opportunity_info_form_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_info_form/views/opportunity_info_form_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_product/bindings/opportunity_product_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_product/opportunity_product_form/bindings/opportunity_product_form_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_product/opportunity_product_form/views/opportunity_product_form_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_product/opportunity_product_price/bindings/opportunity_product_price_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_product/opportunity_product_price/views/opportunity_product_price_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_product/views/opportunity_product_screen.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_status_info_form/bindings/opportunity_status_info_binding.dart';
import '../modules/crm/crm_sales/crm_opportunity/opportunity_status_info_form/views/opportunity_status_info_form_screen.dart';
import '../modules/crm/crm_sales/crm_quote/all_quote/bindings/crm_quote_all_bindings.dart';
import '../modules/crm/crm_sales/crm_quote/all_quote/views/crm_quote_all_page.dart';
import '../modules/crm/crm_sales/crm_quote/detail_quote/bindings/crm_detail_quote_bindings.dart';
import '../modules/crm/crm_sales/crm_quote/detail_quote/views/crm_detail_quote_page.dart';
import '../modules/crm/crm_sales/crm_quote/quote_home/bindings/crm_quote_binding.dart';
import '../modules/crm/crm_sales/crm_quote/quote_home/views/crm_quote_pages.dart';
import '../modules/crm/crm_sales/crm_quote/quote_product/bindings/crm_quote_product_bindings.dart';
import '../modules/crm/crm_sales/crm_quote/quote_product/views/crm_quote_product_page.dart';

part 'crm_routes.dart';

final crmPages = [
  // CRM PAGE
  GetPage(
    name: CRMRoutes.CRM_MASTER_MENU,
    page: () => const CrmMasterMenuPage(),
    binding: CrmMasterMenuBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CRM,
    page: () => CrmCrmPage(),
    binding: CrmCrmBinding(),
  ),
  GetPage(
    name: CRMRoutes.SETTINGS,
    page: () => SettingsPage(),
    binding: SettingBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CURRENCY_EXCHANGE_RATE,
    page: () => CrmCurrencyExchangeRatePage(),
    binding: CrmCurrencyExchangeRateBinding(),
  ),
  GetPage(
    name: CRMRoutes.ALL_CURRENCY_EXCHANGE_RATE,
    page: () => CrmAllCurrencyExchangeRatePage(),
    binding: CrmAllCurrencyExchangeRateBinding(),
  ),

  GetPage(
    name: CRMRoutes.CRM_MD,
    page: () => CrmMdPage(),
    binding: CrmMdBinding(),
  ),
  GetPage(
    name: CRMRoutes.ADD_CURRENCY_EXCHANGE_RATE,
    page: () => const CrmAddCurrencyExchangeRatePage(),
    binding: CrmAddCurrencyExchangeRateBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY,
    page: () => CrmActivityPage(),
    binding: CrmActivityBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ALL_ACTIVITY,
    page: () => CrmAllActivityPage(),
    binding: CrmAllActivityBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_FILTER,
    page: () => CrmFilterActivityPage(),
    binding: CrmFilterActivityBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_ADD_FORM_APPOINTMENT,
    page: () => CrmAddFormAppointmentPage(),
    binding: CrmAddFormAppointmentBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_ADD_FORM_EMAIL,
    page: () => CrmAddFormEmailPage(),
    binding: CrmAddFormEmailBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_ADD_FORM_CALL,
    page: () => CrmAddFormCallPage(),
    binding: CrmAddFormCallBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_ADD_FORM_JOB,
    page: () => CrmAddFormJobPage(),
    binding: CrmAddFormJobBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_ACCOUNT,
    page: () => ActivityAccountPage(),
    binding: ActivityAccountBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_LEAD,
    page: () => ActivityLeadPage(),
    binding: ActivityLeadBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_OPP,
    page: () => ActivityOppPage(),
    binding: ActivityOppBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_QOUTE,
    page: () => ActivityQoutePage(),
    binding: ActivityQouteBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_CONTRACT,
    page: () => ActivityContractPage(),
    binding: ActivityContractBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_ORDER,
    page: () => ActivityOrderPage(),
    binding: ActivityOrderBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_CONTACT,
    page: () => ActivityContactPage(),
    binding: ActivityContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_DETAIL,
    page: () => CrmDetailActivityPage(),
    binding: CrmDetailActivityBindings(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACTIVITY_DETAIL_DETAIL,
    page: () => CrmDetailDetailActivityPage(),
    binding: CrmDetailDetailActivityBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_MANAGEMENT,
    page: () => ProductManagementScreen(),
    binding: ProductManagementBinding(),
  ),
  // CRM PAGE PRICE
  GetPage(
    name: CRMRoutes.CRM_PRICE,
    page: () => CrmPricePage(),
    binding: CrmPriceBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ALL_PRICE,
    page: () => CrmAllPricePage(),
    binding: CrmAllPriceBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CREATE_NEW_PRICE,
    page: () => CrmCreateNewPricePage(),
    binding: CrmCreateNewPriceBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_DETAILS_PRICE,
    page: () => CrmDetailsPricePage(),
    binding: CrmDetailsPriceBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_RELATED_INFORMATION_PRICE,
    page: () => CrmRelatedInformationPage(),
    binding: CrmRelatedInformationBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CREATE_PRODUCTS_IN_PRICE,
    page: () => CrmCreateProductsInPricePage(),
    binding: CrmCreateProductsInPriceBinding(),
  ),

  // CRM PAGE PRODUCT
  GetPage(
      name: CRMRoutes.CRM_PRODUCT,
      page: () => CrmProductHomePage(),
      binding: CrmProductBinding()),
  GetPage(
      name: CRMRoutes.CRM_ALL_PRODUCT,
      page: () => CrmAllProductPage(),
      binding: CrmAllProductBinding()),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_ADD,
    page: () => const CrmProductFormPage(),
    binding: CrmProductFormBinding(),
  ),
  GetPage(
    name: '${CRMRoutes.CRM_PRODUCT_EDIT}/:id',
    page: () => const CrmProductFormPage(),
    binding: CrmProductFormBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_DETAIL,
    page: () => CrmDetailProductPage(),
    binding: CrmDetailProductBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_DETAIL_DETAIL,
    page: () => CrmDetailDetailProductPage(),
    binding: CrmDetailDetailProductBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_INFORMATION_RELATED,
    page: () => CrmInformationRelatedProductPage(),
    binding: CrmInformationRelatedProductBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_ADD_ON_PRICE,
    page: () => CrmAddPriceFormPage(),
    binding: CrmAddPriceFormBindings(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_ADD_PRICE_STANDARD,
    page: () => CrmAddPriceStandardFormPage(),
    binding: CrmAddPriceStandardFormBindings(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT,
    page: () => CrmProductHomePage(),
    binding: CrmProductBinding(),
  ),

  //CRM PRODUCT FAMILY
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_FAMILY,
    page: () => CrmProductFamilyScreen(),
    binding: CrmProductFamilyBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_FAMILY_OVERVIEW,
    page: () => const CrmProductFamilyOverviewPage(),
    binding: CrmProductFamilyOverviewBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_FAMILY_ADD,
    page: () => CrmProductFamilyAddPages(),
    binding: CrmProductFamilyAddBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_FAMILY_DETAIL,
    page: () => CrmProductFamilyDetailPage(),
    binding: CrmProductFamilyDetailBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_FAMILY_EDIT,
    page: () => CrmProductFamilyEditPage(),
    binding: CrmProductFamilyEditBinding(),
  ),

  // CRM ACCOUNT
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT,
    page: () => CrmAccountPage(),
    binding: CrmAccountBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_SEARCH,
    page: () => const CrmAccountSearchPage(),
    binding: CrmAccountSearchBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_ALL,
    page: () => CrmAllAccountPage(),
    binding: CrmAllAccountBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_DETAIL,
    page: () => CrmDetailAccountPage(),
    binding: CrmDetailAccountBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_DETAIL_DETAIL,
    page: () => CrmDetailDetailAccountPage(),
    binding: CrmDetailDetailAccountBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_FILTER,
    page: () => CrmAccountFilterPage(),
    binding: CrmAccountFilterBinding(),
  ),

  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_RELATED_INFOR,
    page: () => const CrmAccountRelatedInformationPage(),
    binding: CrmAccountRelatedInformationBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_RELEVANT_PERSONAL,
    page: () => CrmRelevantPersonalPage(),
    binding: CrmRelevantPersonalBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_CREATE_NEW,
    page: () => const CrmCreateFormAccountPage(),
    binding: CrmCreateFormAccountBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_FORM_IDENTIFICATION_FORM,
    page: () => const CrmCreateFormIdentificationPage(),
    binding: CrmCreateFormIdentificationBindings(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_FORM_IDENTIFICATION_VIEW,
    page: () => AccountIdentificationViewPage(),
    binding: AccountIdentificationViewBinding(),
  ),

  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_ADDRESS_VIEW,
    page: () => AccountAddressViewPage(),
    binding: AccountAddressViewBinding(),
  ),

  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_ADDRESS_FORM,
    page: () => AccountAddressFormPage(),
    binding: AccountAddressFormBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_FORM_CREATE,
    page: () => const AccountFormCreatePage(),
    binding: AccountFormCreateBindings(),
  ),

  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_DOCUMENT_VIEW,
    page: () => AccountDocumentViewPage(),
    binding: AccountDocumentViewBinding(),
  ),

  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_DOCUMENT_FORM,
    page: () => AccountDocumentFormPage(),
    binding: AccountDocumentFormBinding(),
  ),

  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_LIST_ALL,
    page: () => CrmAccountsPage(),
    binding: CrmAccountsBinding(),
  ),

//lead
  // GetPage(
  //   name: CRMRoutes.CRM_LEAD,
  //   page: () => CrmLeadPage(),
  //   binding: CrmLeadBinding(),
  // ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_ADD_PERSONALRELEVANT,
    page: () => CrmAddRelevantPersonalView(),
    binding: CrmAddRelevantPersonalBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_ALL,
    page: () => CrmAllLeadScreen(),
    binding: CrmAllLeadBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OVERVIEW_LEAD,
    page: () => CrmOverviewLeadScreen(),
    binding: CrmOverviewLeadBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_DETAIL,
    page: () => CrmLeadDetailScreen(),
    binding: CrmLeadDetailBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_FILTER,
    page: () => const CrmLeadFilterScreen(),
    binding: CrmLeadFilterBindings(),
  ),

  GetPage(
    name: CRMRoutes.CRM_LEAD_ALL_PRODUCT_FILTER,
    page: () => CrmProductsFilterPage(),
    binding: CrmProductsFilterBinding(),
  ),
  // CRM CONTACT
  GetPage(
    name: CRMRoutes.CRM_CREATE_LEAD,
    page: () => const CrmCreateLeadScreen(),
    binding: CrmCreateLeadBindings(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CREATE_LEAD_PRODUCT,
    page: () => const CrmCreateLeadProductScreen(),
    binding: CrmCreateLeadProductBindings(),
  ),

  GetPage(
    name: CRMRoutes.CRM_LEAD_PRODUCTS,
    page: () => CrmLeadProductsScreen(),
    binding: CrmLeadProductsBindings(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_CREATE_FORM_PRODUCT_CARE,
    page: () => const CrmCreateFormLeadAddProductCarePage(),
    binding: CrmCreateFormLeadAddProductCareBindings(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_PRODUCTS_EDIT,
    page: () => const CrmLeadProductsEditScreen(),
    binding: CrmLeadProductsEditBindings(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_ALL,
    page: () => CrmAllContactPage(),
    binding: CrmAllContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_DETAIL,
    page: () => CrmDetailContactPage(),
    binding: CrmDetailContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_DETAIL_DETAIL,
    page: () => CrmDetailDetailContactPage(),
    binding: CrmDetailDetailContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_PERSONALRELEVANT,
    page: () => CrmRelevantPersonalContactPage(),
    binding: CrmRelevantPersonalContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_CREATE_FORM_PERSONALRELEVANT,
    page: () => CrmCreateRelevantPersonalPage(),
    binding: CrmCreateRelevantPersonalBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_DOCUMENT,
    page: () => CrmDocumentContactPage(),
    binding: CrmDocumentContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_CONTACT,
    page: () => CrmAccountContactPage(),
    binding: CrmAccountContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_ACCOUNT_CONTACT_CREATE_RELATION,
    page: () => const CrmAccountContactCreateRelationPage(),
    binding: CrmAccountContactCreateRelationBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_FORM_INFORMATION,
    page: () => const CrmFromInformationContactPage(),
    binding: CrmFromInformationContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_FORM_UPDATE_INFORMATION,
    page: () => const CrmFromUpdateInformationContactPage(),
    binding: CrmFromUpdateInformationContactBinding(),
  ),

  GetPage(
    name: CRMRoutes.CRM_CONTACT_FORM_ADDRESS_CONTACT,
    page: () => const CrmFromAddressContactPage(),
    binding: CrmFromAddressContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_CREATE_FORM_DOCUMENT,
    page: () => const CrmCreateFormContactDocumentPage(),
    binding: CrmCreateFormContactDocumentBindings(),
  ),

  GetPage(
    name: CRMRoutes.CRM_CONTACT_FILTER,
    page: () => const CrmFilterContactPage(),
    binding: CrmFilterContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_DOCUMENT,
    page: () => CrmLeadDocumentPage(),
    binding: CrmLeadDocumentBindings(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_CREATE_FORM_DOCUMENT,
    page: () => const CrmCreateFormLeadDocumentPage(),
    binding: CrmCreateFormLeadDocumentBindings(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_RELATED_RELATIONSHIP,
    page: () => CrmContactRelatedPage(),
    binding: CrmContactRelatedBinding(),
  ),

  // CRM QUOTE
  GetPage(
    name: CRMRoutes.CRM_QUOTE,
    page: () => CrmQuotePage(),
    binding: CrmQuoteBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_QUOTE_ALL,
    page: () => CrmAllQuotePage(),
    binding: CrmAllQuoteBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_QUOTE_DETAIL,
    page: () => CrmDetailQuotePage(),
    binding: CrmDetailQuoteBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_QUOTE_PRODUCT,
    page: () => CrmQuoteProductPage(),
    binding: CrmQuoteProductBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_EDIT_LEAD_STATUS,
    page: () => CrmEditLeadStatusScreen(),
    binding: CrmEditLeadStatusBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_EDIT_LEAD_INFO,
    page: () => CrmEditLeadInfoScreen(),
    binding: CrmEditLeadInfoBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_DETAIL_ADDRESS_EDIT,
    page: () => CrmEditLeadAddressScreen(),
    binding: CrmEditLeadAddressBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_EDIT_LEAD_ADDITION_INFO,
    page: () => CrmEditLeadAdditionInfoScreen(),
    binding: CrmEditLeadAdditionInfoBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_DETAIL_RELEVANT_PERSONAL,
    page: () => CrmDetailLeadRelevantPersonalPage(),
    binding: CrmDetailLeadRelevantPersonalBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CREATE_LEAD_DETAIL_RELEVANT_PERSONAL,
    page: () => CrmCreateDetailLeadSalePartyInvolesPage(),
    binding: CrmCreateDetailLeadSalePartyInvolesBinding(),
  ),
  // OPP
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY,
    page: () => CrmOpportunityPage(),
    binding: CrmOpportunityBindings(),
  ),

  // COMMON
  GetPage(
    name: CRMRoutes.CRM_PROVINCE,
    page: () => CrmAddressProvincePage(),
    binding: CrmAddressProvinceBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_DISTRICT,
    page: () => CrmAddressDistrictPage(),
    binding: CrmAddressDistrictBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_WARD,
    page: () => CrmAddressWardPage(),
    binding: CrmAddressWardBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_EMPLOYEE,
    page: () => CrmEmployeePage(),
    binding: CrmEmplyeeBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_AUTHORIZATION_GROUP,
    page: () => CrmAuthorizationGroupPage(),
    binding: CrmAuthorizationGroupBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONTACT_ALL_MASTER,
    page: () => CrmContactPage(),
    binding: CrmContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_FORM,
    page: () => const OpportunityFormScreen(),
    binding: OpportunityFormBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_SELECT_ACCOUNT,
    page: () => const CrmSelectAccountScreen(),
    binding: CrmSelectAccountBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_FILTER,
    page: () => const OpportunityFilterScreen(),
    binding: OpportunityFilterBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_STATUS_INFO_FORM,
    page: () => const OpportunityStatusInfoFormScreen(),
    binding: OpportunityStatusInfoFormBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_INFO_FORM,
    page: () => const OpportunityInfoFormScreen(),
    binding: OpportunityInfoFormBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_PRODUCT_FORM,
    page: () => const OpportunityProductFormScreen(),
    binding: OpportunityProductFormBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_PRODUCT_PRICE_SELECT,
    page: () => const OpportunityProductPriceScreen(),
    binding: OpportunityProductPriceBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_ADDITIONAL_FORM,
    page: () => const OpportunityAdditionalFormScreen(),
    binding: OpportunityAdditionalFormBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_DETAIL,
    page: () => CrmDetailOpportunityScreen(),
    binding: CrmOpportunityDetailBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_DETAIL_INFO,
    page: () => const OpportunityDetailInfoScreen(),
    binding: OpportunityDetailInfoBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_SALE_PARTY_INVOLVED,
    page: () => const OpportunitySalePartyInvolvedScreen(),
    binding: OpportunitySalePartyInvolvedBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_SALE_PARTY_INVOLVED_FORM,
    page: () => const OpportunitySalePartyInvolvedFormScreen(),
    binding: OpportunitySalePartyInvolvedFormBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_OPPORTUNITY_PRODUCT,
    page: () => const OpportunityProductScreen(),
    binding: OpportunityProductBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONVERT_LEAD,
    page: () => const ConvertLeadScreen(),
    binding: ConvertLeadBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONVERT_LEAD_SEARCH_ACCOUNT,
    page: () => const ConvertLeadSearchAccountScreen(),
    binding: ConvertLeadSearchAccountBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONVERT_LEAD_CREATE_ACCOUNT,
    page: () => CrmConvertLeadCreateAccountScreen(),
    binding: CrmConvertLeadCreateAccountBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONVERT_LEAD_SEARCH_CONTACT,
    page: () => ConvertLeadSearchContactScreen(),
    binding: ConvertLeadSearchContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_CONVERT_LEAD_CREATE_CONTACT,
    page: () => CrmDetailLeadContactCreateScreen(),
    binding: CrmDetailLeadCreateContactBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_SALES_OPPORTUNITY_INFO,
    page: () => CrmDetailLeadSalesOpportunityInfoScreen(),
    binding: CrmDetailLeadSalesOpportunityInfoBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_SEARCH_SALE_PARTY_INVOLES,
    page: () => DetailLeadSearchSalePartyInvolesScreen(),
    binding: DetailLeadSearchSalesPartyInvolesBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_SALES_PARTY_INVOLES_SEARCH_USERS,
    page: () => DetailLeadSearchUsersSalePartyInvolesScreen(),
    binding: DetailLeadSearchUsersSalesPartyInvolesBinding(),
  ),
  GetPage(
    name: CRMRoutes.CRM_LEAD_SALES_PARTY_INVOLES_CREATE_USERS,
    page: () => CrmDetailLeadSalePartyInvolesCreateUserScreen(),
    binding: CrmDetailLeadSalePartyInvolesCreateUsersBinding(),
  ),
];

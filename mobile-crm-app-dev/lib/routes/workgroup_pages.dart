import 'package:get/get.dart';

import '../modules/workplace_workgroup/manage_my_requests/my_request_detail/bindings/my_request_detail_bindings.dart';

import '../modules/workplace_workgroup/manage_my_requests/my_request_detail/views/my_request_detail_page.dart';
import '../modules/workplace_workgroup/manage_request_needs_my_approval/request_need_my_approval_process_progress/bindings/request_need_my_approval_process_progress_bindings.dart';
import '../modules/workplace_workgroup/manage_request_needs_my_approval/request_need_my_approval_process_progress/views/request_need_my_approval_process_progress_page.dart';
import '../modules/workplace_workgroup/manage_request_needs_my_approval/request_needs_my_approval__views_history/bindings/request_need_my_approval_views_history.bindings.dart';
import '../modules/workplace_workgroup/manage_request_needs_my_approval/request_needs_my_approval__views_history/views/request_need_my_approval_views_history_page.dart';
import '../modules/workplace_workgroup/manage_request_needs_my_approval/request_needs_my_approval_detail/bindings/request_needs_my_approval_detail_bindings.dart';
import '../modules/workplace_workgroup/manage_request_needs_my_approval/request_needs_my_approval_detail/views/request_needs_my_approval_detail_page.dart';
import '../modules/workplace_workgroup/manage_request_needs_my_approval/request_needs_my_approval_home/bindings/request_needs_my_approval_home_bindings.dart';
import '../modules/workplace_workgroup/manage_request_needs_my_approval/request_needs_my_approval_home/views/request_needs_my_approval_home_page.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/dashboard/dashboard_add_meeting/binding/workplace_dashboard_addmeet_binding.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/dashboard/dashboard_add_meeting/view/workplace_dashboard_addmeet_view.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/dashboard/dashboard_home/bindings/dashboard_bindings.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/dashboard/dashboard_home/views/dashboard_page.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_form/a_my_request_form_next/binding/create_my_request_next_binding.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_form/a_my_request_form_next/view/create_my_request_next_view.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_form/binding/create_my_request_binding.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_form/view/create_my_request_view.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_home/bindings/my_request_bindings.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_home/views/my_request_page.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_process_progress/bindings/my_request_process_progress_bindings.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_process_progress/views/my_request_process_progress_page.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_progress/bindings/mmy_request_progress_bindings.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_progress/views/my_request_progress_page.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_search/binding/my_request_search_binding.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_search/view/my_request_search_view.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_views_history/bindings/my_request_views_history.bindings.dart';
import '../modules/workplace_workgroup/manage_my_requests/my_request_views_history/views/my_request_views_history_page.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/form_update/form_work_project/binding/work_form_project_binding.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/form_update/form_work_project/view/work_form_project_view.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/form_update/form_work_ticket/binding/work_form_ticket_binding.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/form_update/form_work_ticket/view/work_form_ticket_view.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/form_update/form_work_workgroup/binding/work_form_workgroup_binding.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/form_update/form_work_workgroup/view/work_form_workgroup_view.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/to_be_completed/bindings/to_be_completed_bindings.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_assign_me/bindings/work_assignment_me_bindings.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_assign_me/views/work_assignment_me_page.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_detail/work_detail_project/bindings/detail_work_project_bindings.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_detail/work_detail_project/views/detail_work_project_page.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_detail/work_detail_ticket/bindings/detail_work_ticket_bindings.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_detail/work_detail_ticket/views/detail_work_ticket_page.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_detail/work_detail_workgroup/bindings/detail_work_group_bindings.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_detail/work_detail_workgroup/views/detail_work_group_page.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_me_assign/bindings/work_me_assignment_bindings.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_me_assign/views/work_me_assignment_page.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_me_monitoring/bindings/work_me_monitoring_bindings.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/work_me_monitoring/views/work_me_monitoring_page.dart';
import '../modules/workplace_workgroup/manage_work_list/work_approve_detail/bindings/detail_approve_bindings.dart';
import '../modules/workplace_workgroup/manage_work_list/work_approve_detail/views/detail_approve_page.dart';
import '../modules/workplace_workgroup/manage_work_list/work_attachments/bindings/attachments_bindings.dart';
import '../modules/workplace_workgroup/manage_work_list/work_attachments/views/attachments_page.dart';
import '../modules/workplace_workgroup/manage_work_list/work_detail/bindings/detail_work_bindings.dart';
import '../modules/workplace_workgroup/manage_work_list/work_detail/views/detail_work_page.dart';
import '../modules/workplace_workgroup/manage_work_list/work_form/binding/work_form_binding.dart';
import '../modules/workplace_workgroup/manage_work_list/work_form/view/work_form_view.dart';
import '../modules/workplace_workgroup/manage_work_list/work_form_create/binding/work_form_create_binding.dart';
import '../modules/workplace_workgroup/manage_work_list/work_form_create/view/work_form_create_view.dart';
import '../modules/workplace_workgroup/manage_work_list/work_history/binding/work_view_history_binding.dart';
import '../modules/workplace_workgroup/manage_work_list/work_history/view/work_view_history_view.dart';
import '../modules/workplace_workgroup/manage_work_list/work_home/bindings/work_home_bindings.dart';
import '../modules/workplace_workgroup/manage_work_list/work_home/views/work_home_page.dart';
import '../modules/workplace_workgroup/manage_work_list/work_manage_time/bindings/work_manage_time_bindings.dart';
import '../modules/workplace_workgroup/manage_work_list/work_manage_time/views/work_manage_time_page.dart';
import '../modules/workplace_workgroup/manage_work_list/work_manage_time_form/bindings/manage_time_form_bindings.dart';
import '../modules/workplace_workgroup/manage_work_list/work_manage_time_form/views/manage_time_form_page.dart';
import '../modules/workplace_workgroup/manage_work_list/work_search/binding/work_search_binding.dart';
import '../modules/workplace_workgroup/manage_work_list/work_search/view/work_search_view.dart';
import '../modules/workplace_workgroup/menu/bindings/menu_binding.dart';
import '../modules/workplace_workgroup/menu/views/menu_page.dart';
import '../modules/workplace_workgroup/profile/bindings/profile_bindings.dart';
import '../modules/workplace_workgroup/profile/views/profile_page.dart';
import '../modules/workplace_workgroup/manage_synthesize_information/to_be_completed/views/to_be_completed_page.dart';

part 'workgroup_routes.dart';

final workGroupPages = [
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_MENU,
    page: () => MenuPage(),
    binding: MenuBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_DASHBOARD,
    page: () => DashboardPage(),
    binding: DashoardBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_TO_BE_COMPLETED,
    page: () => ToBeCompletedPage(),
    binding: ToBeCompletedBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_DETAIL_WORK,
    page: () => DetailWorkPage(),
    binding: DetailWorkBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_HOME,
    page: () => WorkHomePage(),
    binding: WorkHomeBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_MY_REQUEST,
    page: () => MyRequestPage(),
    binding: MyRequestBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_MY_REQUEST_DETAIL,
    page: () => MyRequestDetailPage(),
    binding: MyRequestDetailBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_MY_REQUEST_VIEWS_HISTORY,
    page: () => MyRequestViewHistoryPage(),
    binding: MyRequestViewHistoryBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_MY_REQUEST_PROCESS_PROGRESS,
    page: () => MyRequestProcessProgressPage(),
    binding: MyRequestProcessProgressBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_MY_REQUEST_PROGRESS,
    page: () => MyRequestProgressPage(),
    binding: MyRequestProgrestBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_CREATE_MY_REQUEST,
    page: () => CrmCreateMyRequestPage(),
    binding: CrmCreateMyRequestBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_CREATE_MY_REQUEST_NEXT,
    page: () => CrmCreateMyRequestNextPage(),
    binding: CrmCreateMyRequestNextBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_PROFILE,
    page: () => ProfilePage(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_MANAGE_TIME,
    page: () => ManageTimeWorkPage(),
    binding: ManageTimeWorkBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_MANAGE_TIME_FORM,
    page: () => ManageTimeFormPage(),
    binding: ManageTimeFormBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_VIEW_HISTORY,
    page: () => WorkViewHistoryPage(),
    binding: WorkViewHistoryBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_ATTACHMENTS,
    page: () => AttachmentsPage(),
    binding: AttachmentsBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_APPROVE,
    page: () => DetailApprovePage(),
    binding: DetailApproveBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_FORM,
    page: () => const WorkFormPage(),
    binding: WorkFormBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_ASSIGNMENT_ME,
    page: () => TheAssignmentOfMePage(),
    binding: TheAssignmentOfMeBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_ME_ASSIGNMENT,
    page: () => TheMeAssignmentPage(),
    binding: TheMeAssignmentBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_ME_MONITORING,
    page: () => TheMeMonitoringPage(),
    binding: TheMeMonitoringBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_PROJECT,
    page: () => DetailWorkProjectPage(),
    binding: DetailWorkProjectBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_WORKGROUP,
    page: () => DetailWorkGroupPage(),
    binding: DetailWorkGroupBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_TICKET,
    page: () => DetailWorkTicketPage(),
    binding: DetailWorkTicketBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_SEARCH,
    page: () => const WorkSearchPage(),
    binding: WorkSearchBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_MYREQUEST_SEARCH,
    page: () => const MyRequestSearchPage(),
    binding: MyRequestSearchBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_DASHBOARD_ADDMEET,
    page: () => const WorkPlaceDashBoardAddMeetPage(),
    binding: WorkPlaceDashBoardBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_FORM_CREATE,
    page: () => const WorkFormCreatePage(),
    binding: WorkFormCreateBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_REQUEST_NEEDS_MY_APPROVAL,
    page: () => RequestNeedsMyApprovalHomePage(),
    binding: RequestNeedsMyApprovalHomeBinding(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_REQUEST_NEEDS_MY_APPROVAL_DETAIL,
    page: () => RequestNeedMyApprovalDetailPage(),
    binding: RequestNeedMyApprovalDetailBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_REQUEST_NEEDS_MY_APPROVAL_HISTORY,
    page: () => RequestNeedMyApprovalViewHistoryPage(),
    binding: RequestNeedMyApprovalViewHistoryBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes
        .WORKPLACE_WORKGROUP_REQUEST_NEEDS_MY_VIEW_PROCESS_PROGRESS,
    page: () => RequestNeedMyApprovalProcessProgressPage(),
    binding: RequestNeedMyApprovalProcessProgressBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_FORM_PROJECT,
    page: () => WorkFormProjectPage(),
    binding: WorkFormProjectbindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_FORM_TICKET,
    page: () => WorkFormTicketPage(),
    binding: WorkFormTicketBindings(),
  ),
  GetPage(
    name: WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_FORM_WORKGROUP,
    page: () => WorkFormWorkgroupPage(),
    binding: WorkFormWorkgroupBindings(),
  ),
];

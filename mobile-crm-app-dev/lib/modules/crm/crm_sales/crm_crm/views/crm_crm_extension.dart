part of 'crm_crm_page.dart';

extension CrmCrmExtension on CrmCrmPage {
  ListTile _buildListTile({
    required String title,
    required String image,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: FCoreImage(
        image,
        width: 40,
        height: 40,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: Text(title),
      onTap: onTap,
    );
  }
}

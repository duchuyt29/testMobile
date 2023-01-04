part of 'change_password_screen.dart';

extension ChangePasswordExtension on ChangePasswordScreen {
  Widget _buildLabel(String title, bool required) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 24),
        Text(
          title,
          style:
              AppTextStyle.heavy(fontSize: 16, color: AppColor.thirdTextColor),
        ),
        required
            ? Text(
                ' *',
                style: AppTextStyle.heavy(
                    fontSize: 16, color: AppColor.stateError),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _buildInputArea(
    String title,
    String? hint,
    TextEditingController controller,
    bool hidePassword,
    bool required, {
    Widget? suffix,
    Widget? belowWidget,
    List<TextInputFormatter>? formatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(title, required),
        const SizedBox(height: 8),
        TextField(
          obscureText: hidePassword,
          controller: controller,
          style: AppTextStyle.heavy(fontSize: 16),
          inputFormatters: formatters,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyle.regular(fontSize: 16),
            suffix: suffix,
            contentPadding: const EdgeInsets.only(
              top: 12.0,
              bottom: 12.0,
              left: 24.0,
              right: 16.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: AppColor.neutral8, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: AppColor.neutral8, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: AppColor.neutral8, width: 1),
            ),
          ),
        ),
        belowWidget ?? const SizedBox(),
      ],
    );
  }
}

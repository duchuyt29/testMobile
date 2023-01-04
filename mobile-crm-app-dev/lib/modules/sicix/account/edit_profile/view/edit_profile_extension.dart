part of 'edit_profile_screen.dart';

extension EditProfileExtension on EditProfileScreen {
  Widget _buildAvatar() {
    return Stack(
      children: [
        Obx(
          () => controller.avatar.value != null
              ? WidgetAvatar(
                  size: 100.0,
                  avatar: controller.avatar.value,
                  name: controller.userInfo.getName(),
                  isUrl: true,
                )
              : WidgetAvatar(
                  size: 100.0,
                  avatar: controller.userInfo.getAvatar(),
                  name: controller.userInfo.getName(),
                  isUrl: true,
                ),
        ),
        Positioned(
            right: 0.0,
            bottom: 0.0,
            child: InkWell(
              onTap: controller.showDialogChooseImage,
              child: Container(
                width: 32.0,
                height: 32.0,
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.baseColor,
                  border: Border.all(
                    color: AppColor.canvasColor,
                    width: 3.0,
                  ),
                ),
                child: FCoreImage(
                  IconConstants.iconCamera,
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildInputArea({
    required title,
    required String hint,
    TextInputType? inputType,
    TextEditingController? controller,
    bool isRequired = true,
    bool isReadOnly = false,
    Widget? suffixIcon,
    FormFieldValidator<String>? validator,
    GestureTapCallback? onSelection,
    List<TextInputFormatter>? formatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(title, isRequired),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          style: AppTextStyle.heavy(fontSize: 16),
          keyboardType: inputType,
          readOnly: isReadOnly,
          validator: validator,
          onTap: onSelection,
          inputFormatters: formatters,
          decoration: InputDecoration(
            hintText: hint,
            errorStyle: const TextStyle(height: 0),
            suffixIcon: suffixIcon == null
                ? null
                : Container(
                    alignment: Alignment.centerLeft,
                    child: suffixIcon,
                  ),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 20, maxWidth: 44),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String title, bool isRequired) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 24.0),
        Text(
          title,
          style: AppTextStyle.heavy(
            fontSize: 16,
            color: AppColor.neutral1,
          ),
        ),
        isRequired
            ? Text(
                '*',
                style: AppTextStyle.heavy(
                  fontSize: 14,
                  color: AppColor.stateError,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

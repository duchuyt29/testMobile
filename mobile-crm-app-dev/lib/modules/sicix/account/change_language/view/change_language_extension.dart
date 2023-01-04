part of 'change_language_screen.dart';

extension ChangeLanguageExtension on ChangeLanguageScreen {
  Widget _buidlLanguageList(List<Language> languages) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: languages.length,
      itemBuilder: (context, index) {
        return ItemLanguage(
          onTap: () {
            controller.onChooseLanguage(index);
          },
          language: languages[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 30,
      ),
    );
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/resource/assets_constant/images_constants.dart';

part 'conversation_theme.g.dart';

@JsonSerializable()
class ConversationTheme {
  static List<ConversationTheme> conversationThemes =
      List.generate(37, (index) => ConversationTheme(theme: index + 1));

  int? theme;

  ConversationTheme({this.theme});

  factory ConversationTheme.fromJson(Map<String, dynamic> json) {
    return _$ConversationThemeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConversationThemeToJson(this);

  String getBackground() {
    switch (theme) {
      case 1:
        return ImageConstants.theme1;
      case 2:
        return ImageConstants.theme2;
      case 3:
        return ImageConstants.theme3;
      case 4:
        return ImageConstants.theme4;
      case 5:
        return ImageConstants.theme5;
      case 6:
        return ImageConstants.theme6;
      case 7:
        return ImageConstants.theme7;
      case 8:
        return ImageConstants.theme8;
      case 9:
        return ImageConstants.theme9;
      case 10:
        return ImageConstants.theme10;
      case 11:
        return ImageConstants.theme11;
      case 12:
        return ImageConstants.theme12;
      case 13:
        return ImageConstants.theme13;
      case 14:
        return ImageConstants.theme14;
      case 15:
        return ImageConstants.theme15;
      case 16:
        return ImageConstants.theme16;
      case 17:
        return ImageConstants.theme17;
      case 18:
        return ImageConstants.theme18;
      case 19:
        return ImageConstants.theme19;
      case 20:
        return ImageConstants.theme20;
      case 21:
        return ImageConstants.theme21;
      case 22:
        return ImageConstants.theme22;
      case 23:
        return ImageConstants.theme23;
      case 24:
        return ImageConstants.theme24;
      case 25:
        return ImageConstants.theme25;
      case 26:
        return ImageConstants.theme26;
      case 27:
        return ImageConstants.theme27;
      case 28:
        return ImageConstants.theme28;
      case 29:
        return ImageConstants.theme29;
      case 30:
        return ImageConstants.theme30;
      case 31:
        return ImageConstants.theme31;
      case 32:
        return ImageConstants.theme32;
      case 33:
        return ImageConstants.theme33;
      case 34:
        return ImageConstants.theme34;
      case 35:
        return ImageConstants.theme35;
      case 36:
        return ImageConstants.theme36;
      case 37:
        return ImageConstants.theme37;
      case 38:
        return ImageConstants.theme38;
      default:
        return '';
    }
  }
}

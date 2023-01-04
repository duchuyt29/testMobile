import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/resource/assets_constant/icon_constants.dart';
import 'package:sicix/shared/services/path_service.dart';
import 'package:sicix/shared/utils/app_util.dart';

part 'media_file.g.dart';

@JsonSerializable()
class MediaFile {
  static Null toNull(_) => null;

  @JsonKey(fromJson: _valueToString)
  final String? id;
  final String? name;

  // trường ref này nếu != null, thì là id của file gốc
  @JsonKey(includeIfNull: false)
  String? ref;
  @JsonKey(toJson: toNull, includeIfNull: false)
  String? contentType;

  MediaFile({this.id, this.name, this.ref, this.contentType});

  factory MediaFile.fromJson(Map<String, dynamic> json) =>
      _$MediaFileFromJson(json);

  Map<String, dynamic> toJson() => _$MediaFileToJson(this);

  // String getMediaType() {
  //   if (GetUtils.isImage(file?.name ?? name ?? '')) {
  //     return MessageContentEvent.TYPE_MEDIA;
  //   }
  //   return ((file?.contentType?.contains('video') ?? false) ||
  //           (file?.contentType?.contains('inage') ?? false))
  //       ? MessageContentEvent.TYPE_MEDIA
  //       : MessageContentEvent.TYPE_FILE;
  // }

  String getMediaFilePreview() {
    if (GetUtils.isImage(name ?? '')) {
      return PathService.imagePreview(id);
    } else if (isVideo()) {
      return PathService.videoPreview(ref ?? id);
    } else {
      return _getFileIcon();
    }
  }

  String getMediaFilePath() {
    String filePath;
    if (GetUtils.isImage(name ?? '')) {
      filePath = PathService.imagePath(id);
    } else if (isVideo()) {
      filePath = PathService.videoPath(ref ?? id);
    } else {
      filePath = PathService.fileDownload(id);
    }
    return filePath;
  }

  bool isImage() {
    return GetUtils.isImage(name ?? '');
  }

  bool isVideo() {
    if (contentType != null &&
        contentType!.isNotEmpty &&
        !contentType!.contains('video')) {
      return false;
    }
    return AppUtil.isVideo(name ?? '');
  }

  // String getFilePath() {
  //   return isImage() ? getImagePreview() : getFile();
  // }

  // String getImagePreview() {
  //   if (GetUtils.isImage(name ?? '')) {
  //     return PathService.mediaPreview(id);
  //   } else if (AppCommon.isVideo(name ?? '')) {
  //     return PathService.mediaPreview(id);
  //   }
  // }

  // String getFile() {
  //   return PathService.fileDownload(id);
  // }

  String _getFileIcon() {
    final ext = name?.toLowerCase();
    if (AppUtil.isVideo(name ?? '')) {
      return IconConstants.icVideo;
    } else if (GetUtils.isAudio(name ?? '')) {
      return IconConstants.icAudio;
    } else if (GetUtils.isPPT(name ?? '')) {
      return IconConstants.icPpt;
    } else if (GetUtils.isExcel(name ?? '')) {
      return IconConstants.icXlsx;
    } else if (GetUtils.isPDF(name ?? '')) {
      return IconConstants.icPdf;
    } else if (GetUtils.isWord(name ?? '')) {
      return IconConstants.icDoc;
    } else if (GetUtils.isHTML(name ?? '')) {
      return IconConstants.icHtml;
    } else if (ext?.endsWith('csv') ?? false) {
      return IconConstants.icCsv;
    } else if (ext?.endsWith('md') ?? false) {
      return IconConstants.icMd;
    }
    return IconConstants.icFile;
  }
}

String? _valueToString(dynamic id) {
  if (id == null) {
    return null;
  } else if (id is String) {
    return id;
  } else {
    return id.toString();
  }
}
// enum DocumentType { audio, csv, doc, pdf, ppt, xlsx, md }

// extension DocumentTypeExtension on DocumentType {
//   String get icon {
//     switch (this) {
//       case DocumentType.audio:
//         return IconConstants.icCsv;
//       case DocumentType.csv:
//         return IconConstants.icCsv;
//       case DocumentType.doc:
//         return IconConstants.icDoc;
//       case DocumentType.pdf:
//         return IconConstants.icPdf;
//       case DocumentType.ppt:
//         return IconConstants.icPpt;
//       case DocumentType.xlsx:
//         return IconConstants.icXlsx;
//       case DocumentType.md:
//         return IconConstants.icMd;
//     }
//   }
// }

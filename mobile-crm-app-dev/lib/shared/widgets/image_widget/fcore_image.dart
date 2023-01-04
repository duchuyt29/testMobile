import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'fcore_image_controller.dart';
import 'skeleton_widget.dart';

class FCoreImage extends StatelessWidget {
  FCoreImage(
    this.source, {
    Key? key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeHolder,
    this.errorWidget,
    this.color,
    this.saveToLocal = false,
    this.isUrl = false,
  }) : super(key: key);

  final String source;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? placeHolder;
  final Widget? errorWidget;
  final Color? color;
  final bool saveToLocal;
  final bool isUrl;

  final _cacheImageController = CacheImageController();

  @override
  Widget build(BuildContext context) {
    if (source.isEmpty) {
      return const Placeholder();
    }

    if (isUrl || source.contains('http')) {
      // final cacheFile = _cacheImageController.imageCacheDAO.getByUrl(source);
      // if (cacheFile == null) {
      //   _cacheImageController.downloadFile(source);
      // } else {
      //   _cacheImageController.filename.value = cacheFile.filePath;
      // }
      // if (source.endsWith('.svg')) {
      //   return Obx(
      //     () => _cacheImageController.filename.value.isNotEmpty
      //         ? SvgPicture.file(File(_cacheImageController.filename.value))
      //         : usePlaceHolder
      //             ? const SizedBox()
      //             : const Skeleton(),
      //   );
      // }

      // return Obx(() => _cacheImageController.filename.value.isNotEmpty
      //     ? ExtendedImage.file(
      //         File(_cacheImageController.filename.value),
      //         fit: fit,
      //       )
      //     : usePlaceHolder
      //         ? const SizedBox()
      //         : const Skeleton());
      return CachedNetworkImage(
        imageUrl: source,
        fit: fit,
        width: width,
        height: height,
        // imageBuilder: (context, imageProvider) => Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(image: imageProvider, fit: fit),
        //   ),
        // ),
        placeholder: (context, url) => placeHolder ?? const Skeleton(),
        errorWidget: (context, url, error) =>
            errorWidget ?? placeHolder ?? const Skeleton(),
      );
    }
    if (source.contains('.svg')) {
      return SvgPicture.asset(
        source,
        fit: fit,
        color: color,
        width: width,
        height: height,
      );
    }
    return Image.asset(
      source,
      fit: fit,
      width: width,
      height: height,
    );
  }
}

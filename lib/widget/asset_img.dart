


import 'package:flutter/material.dart';

import '../utils/app_locale.dart';

class Asset_imge_show{
  Image Img_asset(String image_path,
      {double? height,
        double? width,
        Color? color_code,
        BoxFit? boxFit,
        BlendMode? blendMode}) {
    return Image.asset(
      image_path,
      height: height,
      width: width,
      color: color_code,
      colorBlendMode: blendMode,
      fit: boxFit,
    );
  }

  fadeInImage_network({required String image_path,BoxFit? boxFit,double? width}) {
    return image_path!=''?FadeInImage(
      placeholder: const NetworkImage('http://via.placeholder.com/200x150'),
      image: NetworkImage(
        image_path,
      ),
      imageErrorBuilder: (context, error, stackTrace) => Image.asset(
        AppImages.no_image,
        fit: boxFit,
        // width: double.infinity,
      ),
      width: width ?? double.infinity,
      fit: boxFit,
    ):Image.asset(
      AppImages.no_image,
      fit: boxFit,
      // width: double.infinity,
    );
  }


}
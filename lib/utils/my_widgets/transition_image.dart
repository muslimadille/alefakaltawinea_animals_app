


import 'dart:io';

import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:shimmer/shimmer.dart';


class TransitionImage extends StatefulWidget {
  TransitionImage(this.url,
      {this.file,
        this.width,
        this.height,
        this.fit,
        this.asset,
        this.padding,
        this.radius = 0,
        this.strokeColor,
        this.strokeWidth,
        this.backgroundColor,
        this.placeHolder,
        this.placeWidget,
        this.placeHolderImage,
        this.fillColor,
        this.placeHolderColor,
        this.isGreyScaled = false,
        this.onErrorLoading,
        Key? key})
      : super(key: key);

  String url = "";
  File? file;
  double? width;
  double? height;
  BoxFit? fit;
  Asset? asset;
  EdgeInsets? padding;
  double radius = 0;
  Color? strokeColor;
  double? strokeWidth;
  Color? backgroundColor;
  IconData? placeHolder;
  Widget? placeWidget;
  String? placeHolderImage;
  Color? fillColor;
  Color? placeHolderColor;
  bool isGreyScaled = false;
  Function(String)? onErrorLoading;

  @override
  _TransitionImageState createState() => _TransitionImageState();
}

class _TransitionImageState extends State<TransitionImage> {
  ColorFilter greyscale = ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      margin: EdgeInsets.zero,
      color: widget.backgroundColor == null
          ? Colors.transparent
          : widget.backgroundColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: widget.strokeColor ?? Colors.transparent,
              width: widget.strokeWidth ?? 2),
          borderRadius: BorderRadius.all(Radius.circular(widget.radius))),
      child: widget.isGreyScaled
          ? ColorFiltered(colorFilter: greyscale, child: child())
          : child(),
    );
  }

  Widget child() {
    return widget.file != null
        ? Container(
      padding: widget.padding,
      child: Image.file(
        widget.file!,
        fit: widget.fit ?? BoxFit.contain,
      ),
      height: widget.height,
      width: widget.width,
    )
        : widget.asset != null
        ? Container(
      padding: widget.padding,
      height: widget.height,
      width: widget.width,
      child:
      AssetThumb(asset: widget.asset!, height: 1000, width: 1000),
    )
        : widget.url.isEmpty
        ? Image.asset(
      Res.DEFAULT_IMAGE,
      fit: widget.fit ?? BoxFit.cover,
      color: widget.fillColor,
    )
        : widget.url.contains("assets")
        ? Container(
      padding: widget.padding,
      child: widget.url.contains(".svg")
          ? SvgPicture.asset(
        widget.url,
        fit: widget.fit ?? BoxFit.contain,
      )
          : Image.asset(
        widget.url,
        fit: widget.fit ?? BoxFit.contain,
        color: widget.fillColor,
      ),
      height: widget.height,
      width: widget.width,
    )
        : widget.url.contains("/data/user/")
        ? Container(
      padding: widget.padding,
      child: Image.file(
        File(widget.url),
        fit: widget.fit ?? BoxFit.contain,
      ),
      height: widget.height,
      width: widget.width,
    )
        : Container(
      padding: widget.padding,
      child: widget.url.contains(".svg")
          ? SvgPicture.network(widget.url)
          : CachedNetworkImage(
          imageUrl: widget.url,
          fit: widget.fit ?? BoxFit.contain,
          progressIndicatorBuilder:
              (context, url, progress) {
            return
              Container();

          },
          /*placeholder: (context, url) {
                                      return widget.placeHolderImage != null
                                          ? Image.asset(
                                              widget.placeHolderImage!,
                                              fit: BoxFit.cover,
                                            )
                                          : Icon(
                                              widget.placeHolder == null
                                                  ? Icons.image
                                                  : widget.placeHolder,
                                              color: widget.placeHolderColor,
                                              size: BaseD.default_30);
                                    },*/
          errorWidget: (context, url, error) {
            print("TransitionImage : Error : $error");
            if(widget.onErrorLoading != null) widget.onErrorLoading!(error != null ? error.toString() : "");

            return Container(
                child: widget.placeWidget == null
                    ? Icon(widget.placeHolder ??
                    Icons.image)
                    : widget.placeWidget);
          }),
      width: widget.width,
      height: widget.height,
    );
  }
}


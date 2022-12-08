import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'appConfig.dart';

class D {
  ///**** Font Sizes */
  static final h1 = 20.sp*(Constants.DEVICE_RATIO>1.6?1:0.7);
  static final h2 = 18.sp*(Constants.DEVICE_RATIO>1.6?1:0.7);
  static final h3 = 16.sp*(Constants.DEVICE_RATIO>1.6?1:0.7);
  static final h4 = 15.sp*(Constants.DEVICE_RATIO>1.6?1:0.7);
  static final h5 = 13.sp*(Constants.DEVICE_RATIO>1.6?1:0.7);
  static final h6 = 11.sp*(Constants.DEVICE_RATIO>1.6?1:0.7);
  static double size(double value){
    return value*Constants.DEVICE_RATIO*(Constants.DEVICE_RATIO>1.6?1:2.5);
  }

  static final default_1 = size(0.4);
  static final default_2 = size(0.8);
  static final default_5 = size(1);
  static final default_7 = size(2.4);
  static final default_8 = size(3.2);
  static final default_10 = size(4);
  static final default_12 = size(4.8);
  static final default_14 = size(5.6);
  static final default_15 = size(6);
  static final default_16 = size(6.4);
  static final default_18 = size(7.2);
  static final default_20 = size(8);
  static final default_24 = size(9.6);
  static final default_25 = size(10);
  static final default_27 = size(10.8);
  static final default_30 = size(12);
  static final default_35 = size(14);
  static final default_40 = size(16);
  static final default_45 = size(18);
  static final default_50 = size(20);
  static final default_55 = size(22);
  static final default_60 = size(24);
  static final default_65 = size(26);
  static final default_70 = size(28);
  static final default_80 = size(32);
  static final default_90 = size(36);
  static final default_100 = size(40);
  static final default_110 = size(44);
  static final default_120 = size(48);
  static final default_130 = size(52);
  static final default_140 = size(56);
  static final default_150 = size(60);
  static final default_160 = size(64);
  static final default_170 = size(68);
  static final default_180 = size(72);
  static final default_200 = size(80);
  static final default_230 = size(92);
  static final default_250 = size(100);
  static final default_260 = size(104);
  static final default_300 = size(120);
  static final default_350 = size(140);
  static final default_400 = size(160);
  static final default_450 = size(180);
  static final default_500 = size(200);
  static final default_barcodeLineWidth = dimension(1.3);

  static double _comparedDimension = 0.0;

  static double dimension(double originalDimension) {
    if(BaseConfig.DEVICE_HEIGHT<BaseConfig.DEVICE_WIDTH)
      _comparedDimension = BaseConfig.DEVICE_HEIGHT;
    else
      _comparedDimension = BaseConfig.DEVICE_WIDTH;

    return BaseConfig.IS_LANDSCAPE
        ? _comparedDimension < 380.0
        ? originalDimension * 0.6
        : _comparedDimension < 600.0
        ? originalDimension * 0.8
        : originalDimension
        : _comparedDimension< 380.0
        ? originalDimension * 0.8
        : _comparedDimension < 600.0
        ? originalDimension
        : originalDimension * 1.2;
  }
  static double width(double originalDimension) {
    return originalDimension.w;
  }
  static double height(double originalDimension) {
    return originalDimension.h;
  }
  static double textSize(double originalDimension) {
    return originalDimension.w;
  }
}
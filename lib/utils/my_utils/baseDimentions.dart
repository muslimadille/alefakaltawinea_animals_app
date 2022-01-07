import 'appConfig.dart';

class D {
  ///**** Font Sizes */
  static final h1 = default_20;
  static final h2 = default_18;
  static final h3 = default_16;
  static final h4 = default_14;
  static final h5 = default_12;
  static final h6 = default_10;

  static final default_1 = dimension(1.0);
  static final default_2 = dimension(2.0);
  static final default_5 = dimension(5.0);
  static final default_7 = dimension(7.0);
  static final default_8 = dimension(8.0);
  static final default_10 = dimension(10.0);
  static final default_12 = dimension(12.0);
  static final default_14 = dimension(14.0);
  static final default_15 = dimension(15.0);
  static final default_16 = dimension(16.0);
  static final default_18 = dimension(18.0);
  static final default_20 = dimension(20.0);
  static final default_24 = dimension(24.0);
  static final default_25 = dimension(24.0);
  static final default_27 = dimension(27.0);
  static final default_30 = dimension(30.0);
  static final default_35 = dimension(35.0);
  static final default_40 = dimension(40.0);
  static final default_45 = dimension(45.0);
  static final default_50 = dimension(50.0);
  static final default_55 = dimension(55.0);
  static final default_60 = dimension(60.0);
  static final default_65 = dimension(65.0);
  static final default_70 = dimension(70.0);
  static final default_80 = dimension(80.0);
  static final default_90 = dimension(90.0);
  static final default_100 = dimension(100.0);
  static final default_110 = dimension(110.0);
  static final default_120 = dimension(120.0);
  static final default_130 = dimension(130.0);
  static final default_140 = dimension(140.0);
  static final default_150 = dimension(150.0);
  static final default_160 = dimension(160.0);
  static final default_170 = dimension(170.0);
  static final default_180 = dimension(180.0);
  static final default_200 = dimension(200.0);
  static final default_230 = dimension(230.0);
  static final default_250 = dimension(250.0);
  static final default_260 = dimension(260.0);
  static final default_300 = dimension(300.0);
  static final default_350 = dimension(350.0);
  static final default_400 = dimension(400.0);
  static final default_450 = dimension(450.0);
  static final default_500 = dimension(500.0);
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
}
import 'package:flutter/material.dart';

typedef void PushNotificationClick(
    String payload);

class BaseConfig extends Object {
  static String? APP_NAME;

  static void setAppName(String appName) {
    APP_NAME = appName;
  }

  static String? APP_VERSION_NAME;

  static void setAppVersionName(String appVersionName) {
    APP_VERSION_NAME = appVersionName;
  }

  static String BASE_API_URL = "";

  static void setBaseApiUrl(String baseApiUrl) {
    BASE_API_URL = baseApiUrl;
  }

  static String BASE_PATH_URL = "";

  static void setBasePathUrl(String basePathUrl) {
    BASE_PATH_URL = basePathUrl;
  }

  static List<Locale> SUPPORTED_LOCALES = [];

  static void setSupportedLocales(List<Locale> supportedLocales) {
    SUPPORTED_LOCALES = supportedLocales;
  }

  static late Locale SELECTED_LOCALE;

  static void setSelectedLocale(Locale selectedLocale) {
    SELECTED_LOCALE = selectedLocale;
  }

  static late PushNotificationClick ON_PUSH_NOTIFICATION_CLICKED;

  static void setOnPushNotificationClicked(
      PushNotificationClick onPushNotificationClicked) {
    ON_PUSH_NOTIFICATION_CLICKED = onPushNotificationClicked;
  }
  static void onPushNotificationClicked(String payload){
    ON_PUSH_NOTIFICATION_CLICKED(payload);
  }

  static double DEVICE_HEIGHT = 0;

  static void setDeviceHeight(double deviceHeight) {
    DEVICE_HEIGHT = deviceHeight;
  }

  static double DEVICE_WIDTH = 0;

  static void setDeviceWidth(double deviceWidth) {
    DEVICE_WIDTH = deviceWidth;
  }

  static bool IS_LANDSCAPE = false;

  static void setLandscape(bool isLandscape) {
    IS_LANDSCAPE = isLandscape;
  }

  static bool IS_CONNECTED = false;

  static void setIsConnected(bool isConnected) {
    IS_CONNECTED = isConnected;
  }

  static bool IS_GMS_AVAILABLE = false;

  static void setIsGmsAvailable(bool isGmsAvailable) {
    IS_GMS_AVAILABLE = isGmsAvailable;
  }

  static bool IS_HMS_AVAILABLE = false;

  static void setIsHmsAvailable(bool isHmsAvailable) {
    IS_HMS_AVAILABLE = isHmsAvailable;
  }

  static void init(
      {required String appName,
        required String appVersionName,
        required String baseApiUrl,
        required String basePathUrl,
        required List<Locale> supportedLocales,
        required Locale selectedLocale,
        required PushNotificationClick onPushNotificationClicked,
        required double deviceHeight,
        required double deviceWidth,
        required bool isLandscape,
        required bool isConnected,
        bool isGmsAvailable = false,
        bool isHmsAvailable = false}) {
    setAppName(appName);
    setAppVersionName(appVersionName);
    setBaseApiUrl(baseApiUrl);
    setBasePathUrl(basePathUrl);
    setSupportedLocales(supportedLocales);
    setSelectedLocale(selectedLocale);
    setOnPushNotificationClicked(onPushNotificationClicked);
    setDeviceHeight(deviceHeight);
    setDeviceWidth(deviceWidth);
    setLandscape(isLandscape);
    setIsConnected(isConnected);
    setIsHmsAvailable(isHmsAvailable);
    setIsGmsAvailable(isGmsAvailable);
  }
}

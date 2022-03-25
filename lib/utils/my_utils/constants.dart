import 'package:alefakaltawinea_animals_app/modules/login/data/user_data.dart';
import 'package:alefakaltawinea_animals_app/modules/spalshScreen/data/regions_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants extends Object{
  static String? SELECTED_LANGUAGE="ar";
  static String? LANGUAGE_KEY="LANGUAGE_KEY";
  static   SharedPreferences? prefs ;
  static  UserData? currentUser;
  static int OTP_LENGTH=4;
  static String? SAVED_PHONE_KEY="SAVED_PHONE";
  static String? SAVED_PASSWORD_KEY="SAVED_PASSWORD";
  static List<RegionsModel> REGIONS=[];
  static String MAPS_API_KEY="AIzaSyDuvS1cZBr4opbX8FmSRyuuKixykzVY3So";
  static bool show_adoption_alert=false;
  static String APP_LINK="https://drive.google.com/file/d/1MTmSYV6-3lBBffcsyZ_g5whBIT_dio3f/view?usp=sharing";



  ///888888888888888888888888888888888888888888888888888888
  static UtilsProviderModel? utilsProviderModel;







}
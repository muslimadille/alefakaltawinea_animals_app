class Apis{
  static String TOKEN_VALUE="";

  static const REQ_SUCCESS = "success";
  static const CODE_SUCCESS = '200';
  static const CODE_SHOW_MESSAGE = '400';
  static const CODE_ACTIVE_USER = '403';
  static const CODE_ERROR = '500';
  static const REQ_NOT_ALLOWED = "NotAllowed";
  static const REQ_DATA_RETURNED = "DataReturn";
  static const REQ_EMPTY_DATA = "EmptyData";
  static const REQ_FAILED = "failed";
  static const ExCEPTION = "Exception";

  static String BASE_URL="https://alefak.basit-it.com/api/v1";
  static String GET_CATEGORIES_LIST="${BASE_URL}/categories";
  static String GET_SERVICE_PROVIDERS_LIST="${BASE_URL}/shops";
  static String GET_ADS_SLIDER="${BASE_URL}/ads";
  static String GET_REGIONS="${BASE_URL}/regions";
  static String LOGIN="${BASE_URL}/login";
  static String REGISTER="${BASE_URL}/register";
  static String ACTIVE_ACCOUNT="${BASE_URL}/activate";
  static String GET_AUTH_CODE_TO_SET_PASSWORD="${BASE_URL}/get-code";
  static String FORGET_PASSWORD="${BASE_URL}/set-new-password";//used after GET_AUTH_CODE
  static String UPDATE_PROFILE="${BASE_URL}/update-profile";//used after GET_AUTH_CODE

///......... adoption...............................
  static String GET_ADOPTION_CATEGORIES="${BASE_URL}/sub-categories";
  static String GET_ADOPTION_ANIMALS="${BASE_URL}/animals";//?category_id=1
  static String ADD_ADOPTION_ANIMALS="${BASE_URL}/add-animal";


















}

mixin InputValidationMixin {
  bool isFieldNotEmpty(String field) => field.isNotEmpty;
  bool isPhoneValide(String value)=>value.length==9;
  bool isPasswordValide(String value)=>value.length>=8;
  bool isTowFieldsMached(String value,String conf)=>value==conf;

}
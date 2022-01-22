
mixin InputValidationMixin {
  bool isFieldNotEmpty(String field) => field.isNotEmpty;
  bool isPhoneValide(String value)=>value.length<10;
  bool isTowFieldsMached(String value,String conf)=>value==conf;

}
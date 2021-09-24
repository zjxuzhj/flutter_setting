import 'package:azlistview/azlistview.dart';
import 'package:flutter_app/gen/json/base/json_convert_content.dart';

class CityEntity with JsonConvert<CityEntity>, ISuspensionBean {
  String name;
  String cityCode;
  String firstCharacter;

  @override
  String getSuspensionTag() {
    return firstCharacter;
  }
}

import 'package:flutter_app/gen/json/base/json_convert_content.dart';

class Category with JsonConvert<Category> {
	int? errorCode;
	String? msg;
	Data? data;
}

class Data with JsonConvert<Data> {
	List<CategoryList>? categoryList;
}

class CategoryList with JsonConvert<CategoryList> {
	int? categoryId;
	String? categoryName;
}

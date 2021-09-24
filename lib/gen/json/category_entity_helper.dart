import 'dart:convert';
import 'package:flutter_app/layout/models/category_entity.dart';

categoryFromJson(Category data, Map<String, dynamic> json) {
	if (json['errorCode'] != null) {
		data.errorCode = json['errorCode'] is String
				? int.tryParse(json['errorCode'])
				: json['errorCode'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		var _json = json['data'];
		try {
				_json = jsonDecode(json['data']);
		} catch (e) {}
		data.data = Data().fromJson(_json);
	}
	return data;
}

Map<String, dynamic> categoryToJson(Category entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errorCode'] = entity.errorCode;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

dataFromJson(Data data, Map<String, dynamic> json) {
	if (json['categoryList'] != null) {
		var _json = json['categoryList'];
		try {
				_json = jsonDecode(json['categoryList']);
		} catch (e) {}
		data.categoryList = (_json as List).map((v) => CategoryList().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> dataToJson(Data entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['categoryList'] =  entity.categoryList?.map((v) => v.toJson())?.toList();
	return data;
}

categoryListFromJson(CategoryList data, Map<String, dynamic> json) {
	if (json['categoryId'] != null) {
		data.categoryId = json['categoryId'] is String
				? int.tryParse(json['categoryId'])
				: json['categoryId'].toInt();
	}
	if (json['categoryName'] != null) {
		data.categoryName = json['categoryName'].toString();
	}
	return data;
}

Map<String, dynamic> categoryListToJson(CategoryList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['categoryId'] = entity.categoryId;
	data['categoryName'] = entity.categoryName;
	return data;
}
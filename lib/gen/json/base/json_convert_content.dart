// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_app/layout/models/city_entity.dart';
import 'package:flutter_app/gen/json/city_entity_helper.dart';
import 'package:flutter_app/layout/models/category_entity.dart';
import 'package:flutter_app/gen/json/category_entity_helper.dart';
import 'package:flutter_app/layout/models/bank_entity.dart';
import 'package:flutter_app/gen/json/bank_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case CityEntity:
				return cityEntityFromJson(data as CityEntity, json) as T;
			case Category:
				return categoryFromJson(data as Category, json) as T;
			case Data:
				return dataFromJson(data as Data, json) as T;
			case CategoryList:
				return categoryListFromJson(data as CategoryList, json) as T;
			case BankEntity:
				return bankEntityFromJson(data as BankEntity, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case CityEntity:
				return cityEntityToJson(data as CityEntity);
			case Category:
				return categoryToJson(data as Category);
			case Data:
				return dataToJson(data as Data);
			case CategoryList:
				return categoryListToJson(data as CategoryList);
			case BankEntity:
				return bankEntityToJson(data as BankEntity);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (CityEntity).toString()){
			return CityEntity().fromJson(json);
		}	else if(type == (Category).toString()){
			return Category().fromJson(json);
		}	else if(type == (Data).toString()){
			return Data().fromJson(json);
		}	else if(type == (CategoryList).toString()){
			return CategoryList().fromJson(json);
		}	else if(type == (BankEntity).toString()){
			return BankEntity().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<CityEntity>[] is M){
			return data.map<CityEntity>((e) => CityEntity().fromJson(e)).toList() as M;
		}	else if(<Category>[] is M){
			return data.map<Category>((e) => Category().fromJson(e)).toList() as M;
		}	else if(<Data>[] is M){
			return data.map<Data>((e) => Data().fromJson(e)).toList() as M;
		}	else if(<CategoryList>[] is M){
			return data.map<CategoryList>((e) => CategoryList().fromJson(e)).toList() as M;
		}	else if(<BankEntity>[] is M){
			return data.map<BankEntity>((e) => BankEntity().fromJson(e)).toList() as M;
		}
		throw Exception("not fond");
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}
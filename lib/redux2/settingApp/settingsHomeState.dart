import 'package:pruebaTest/data/models/CountryList.dart';
import 'package:pruebaTest/data/models/CurrenciesConverter.dart';
import 'package:pruebaTest/data/models/CurrenciesHistoryModel.dart';
import 'package:pruebaTest/data/models/CurrenciesModel.dart';

import 'package:meta/meta.dart';

@immutable
class PostsStateHome {
  final bool isError;
  final bool isLoading;

  final List<CountryListModel> countryListModel;

  final CurrenciesConverterModel currenciesConverterModel;
  final CurrenciesModel currenciesModel;
  final CurrenciesHistoryModel currenciesHistoryModel;

  // final List<modelFavorites> posts;

  PostsStateHome({
    this.isError,
    this.isLoading,
    this.countryListModel,
    this.currenciesConverterModel,
    this.currenciesModel,
    this.currenciesHistoryModel,

    //this.posts,
  });

  factory PostsStateHome.initial() => PostsStateHome(
        isLoading: false,
        isError: false,
        countryListModel: null,
        currenciesConverterModel: null,
        currenciesModel: null,
        currenciesHistoryModel: null,
      );

  PostsStateHome copyWith({
    @required bool isError,
    @required bool isLoading,
    @required countryListModel,
    @required currenciesConverterModel,
    @required currenciesModel,
    @required currenciesHistoryModel,
  }) {
    return PostsStateHome(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      countryListModel: countryListModel ?? this.countryListModel,
      currenciesConverterModel: currenciesConverterModel ?? this.currenciesConverterModel,
      currenciesModel: currenciesModel ?? this.currenciesModel,
      currenciesHistoryModel: currenciesHistoryModel ?? this.currenciesHistoryModel,
    );
  }
}

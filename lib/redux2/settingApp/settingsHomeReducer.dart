import 'package:pruebaTest/redux2/settingApp/settingsHomeActions.dart';
import 'package:pruebaTest/redux2/settingApp/settingsHomeState.dart';

postsReducerHome(PostsStateHome prevState, SetPostsStateActionHome action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    countryListModel: payload.countryListModel,
    currenciesConverterModel: payload.currenciesConverterModel,
    currenciesModel: payload.currenciesModel,
    currenciesHistoryModel: payload.currenciesHistoryModel,
  );
}

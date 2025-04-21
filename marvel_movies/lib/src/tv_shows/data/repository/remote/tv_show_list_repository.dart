import '../../../../../core/constants/api_constants/api_constants.dart';
import '../../../../../core/constants/api_constants/api_queries.dart';
import '../../../../../core/service/api_service.dart';
import '../../model/tv_show_list_model.dart';

class TvShowListRepository {
  Future<List<TvShowListModel>> fetchTvShowList() async {
    final response = await ApiService.getService(
      url: ApiConstants.serviceDevBaseUrl + ApiQueries.tvShowsListQuery(),
    );
    if (response != null && response.statusCode == 200) {
      var tvshowsList =
          (response.data as List)
              .map((item) => TvShowListModel.fromJson(item))
              .toList();
      return tvshowsList;
    }
    return [];
  }
}

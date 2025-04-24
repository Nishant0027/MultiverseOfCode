import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/api_constants/api_queries.dart';
import '../../../../core/service/api_service.dart';
import '../model/tv_show_list_model.dart';

class TvShowsRepository {
  TvShowsRepository._();
  static Future<TvShowListModel?> fetchTvShowList() async {
    final response = await ApiService.getService(
      url: ApiConstants.serviceDevBaseUrl + ApiQueries.tvShowsListQuery(),
    );
    if (response != null && response.statusCode == 200) {
      final tvshowsList = TvShowListModel.fromJson(response.data);
      return tvshowsList;
    }
    return null;
  }
}

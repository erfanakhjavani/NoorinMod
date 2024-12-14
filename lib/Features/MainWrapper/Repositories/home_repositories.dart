

import '../../../Core/Constants/address_key.dart';
import '../../../Core/Data/Repositories/base_repository.dart';
import '../../../Core/Services/response_model.dart';

class HomeRepositories extends BaseRepository{
  final _queryParams = {
    'consumer_key': KeySecure.consumerKey,
    'consumer_secret': KeySecure.consumerSecret,
  };
  Future<ResponseModel> getProduct() async {
    return await getRequest('https://karawp.com/wp-json/wc/v3/products?consumer_key=ck_a4faf2d14732332c4cdbb47751e2334325bb36c5&consumer_secret=cs_f1faa078e00c23ee060391d5afcf4f22e213d473'
    );
  }
}
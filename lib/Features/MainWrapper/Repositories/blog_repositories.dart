

import '../../../Core/Constants/address_key.dart';
import '../../../Core/Data/Repositories/base_repository.dart';
import '../../../Core/Services/response_model.dart';

class BlogRepositories extends BaseRepository{
  Future<ResponseModel> postSignUp(Map<String, dynamic> data) async {
    return await getRequest(AddressKey.blog,
    ).timeout(const Duration(seconds: 10),

    );
  }
}
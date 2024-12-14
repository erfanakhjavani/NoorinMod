

import '../../../../Core/Constants/address_key.dart';
import '../../../../Core/Services/response_model.dart';
import '../../../Core/Data/Repositories/base_repository.dart';

class RegisterRepositories extends BaseRepository{
  Future<ResponseModel> postSignUp(Map<String, dynamic> data) async {
    return await postRequest(AddressKey.signUp, data
    ).timeout(const Duration(seconds: 10),

    );
  }




  Future<ResponseModel> postSignIn(Map<String, dynamic> data) async {
    return await postRequest(AddressKey.signUp, data).timeout(const Duration(seconds: 10));
  }



}



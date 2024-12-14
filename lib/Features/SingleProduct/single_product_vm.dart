import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:noorin_mod/Features/SingleProduct/single_product_m.dart';

import '../../Core/Services/response_model.dart';

class SingleProductVm extends GetxController {
  final productImages = [
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
  ].obs;
  final productPrice = 16899000.obs;
  final productDiscountPrice = 16499000.obs;
  var state = ResponseModel<SingleProductM>.loading('nothing');
  var productItem = <SingleProductM>{}.obs;





  Future<void> getProducts(int id) async {
    Dio dio = Dio();
    state = ResponseModel.loading('loading...');

      var response = await dio.get(
        'https://karawp.com/wp-json/wc/v3/products/$id?consumer_key=ck_a4faf2d14732332c4cdbb47751e2334325bb36c5&consumer_secret=cs_f1faa078e00c23ee060391d5afcf4f22e213d473',
      );
    final product = SingleProductM.fromJson(response.data);

    if (response.statusCode == 200) {
        state = ResponseModel.completed(product);
      }
      state = ResponseModel.completed(product);

    update();
  }



  final productRating = 4.6.obs;

  final selectedColor = "مشکی".obs;
  final selectedStorage = "128".obs;
  final colors = ["سفید", "قرمز",'سبز','مشکی'].obs;
  final storages = ["XXL", "XL", "L"].obs;






}

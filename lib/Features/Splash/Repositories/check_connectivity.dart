import 'dart:async';
import 'package:get/get.dart';

import '../../../Core/Constants/address_key.dart';

class SplashRepository extends GetConnect {

  Future<bool> checkConnectivity() async {


      try {
        final response = await get(AddressKey.globalDomain, ).timeout(const Duration(seconds: 3));
        if (response.statusCode == 200) {
          //! Internet connection is available.
          return true;
        } else {
          //! Connected to a network but no internet access.
          return false;
        }
      } on TimeoutException catch (_) {
        print(_.toString());
        //! Request timed out (considered as no internet access).
        return false;
      } catch (e) {
        e.toString();
        //! Other errors.
        return false;
      }
    }
  }


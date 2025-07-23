import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/routing/route.dart';
import 'package:pharma_tech_driver/presentation/modules/auth/login/login.dart';
import '../data/model/response/base/api_response.dart';
import 'package:provider/provider.dart';

import '../data/repository/SaveUserData.dart';


class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    print("ooonnnoo____${apiResponse.error.toString()}");
    print("ooooo____${apiResponse.response?.statusCode}");
    // if(apiResponse.error is! String && apiResponse.error.errors[0].message == 'Unauthorized.') {
    if(apiResponse.error.toString() == "Failed to load data - status code: 401") {
    // back to login and remove data
      print("sssssss____${apiResponse.response?.statusCode}");

      pushAndRemoveUntil(Login());
      // Provider.of<SaveUserData>(context,listen: false).clearSharedData();

    }else {
      String _errorMessage;
      if (apiResponse.error is String) {
        _errorMessage = apiResponse.error.toString();
      } else {
        _errorMessage = apiResponse.error.errors[0].message;
      }
      print(_errorMessage);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_errorMessage, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));
    }
  }
}
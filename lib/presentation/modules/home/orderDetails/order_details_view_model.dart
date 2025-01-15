import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/data/repository/home_Repo.dart';
import 'package:pharma_tech_driver/injection.dart';
import 'package:pharma_tech_driver/main.dart';
import 'package:pharma_tech_driver/presentation/modules/home/provider/home_provider.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '../../../../../core/api_checker.dart';
import '../../../../../data/model/response/base/api_response.dart';
import '../../../../../data/repository/SaveUserData.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../../core/utils/showToast.dart';
import '../../../../data/model/response/one_order_model.dart';
import '../../../component/loadings/progress_dialog.dart';

class OrderDetailsViewModel with ChangeNotifier {
  final HomeRepo homeRepo;
  final SaveUserData saveUserData;
  OrderDetailsViewModel({required this.saveUserData, required this.homeRepo});

  ///variables
  bool _isLoading = false;


  OneOrderModel? _oneOrderModel;
  ///getters
  bool get isLoading => _isLoading;
  ///setters


  OneOrderModel? get oneOrderModel => _oneOrderModel;

  ///calling APIs Functions

  Future<ApiResponse> getOrder (orderId) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await homeRepo.oneOrderRepo(orderId);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _oneOrderModel = OneOrderModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_oneOrderModel?.code == 200) {

      } else {
        ToastUtils.showToast(_oneOrderModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(navigator.currentContext!, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> updateOrder (orderId,status) async {
    _isLoading = true;
    notifyListeners();
    ProgressDialog dialog = createProgressDialog(msg: "${LocaleKeys.orderDetails.tr()} ...", context: navigator.currentState!.context);
    await dialog.show();
    ApiResponse responseModel = await homeRepo.updateOrderRepo(orderId,status);
    await dialog.hide();
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _oneOrderModel = OneOrderModel.fromJson(responseModel.response?.data);
      notifyListeners();
      if (_oneOrderModel?.code == 200) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          getOrder(orderId);
        });
        HomeViewModel provider =getIt();
        provider.getAllOrders();
      } else {
        ToastUtils.showToast(_oneOrderModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(navigator.currentContext!, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

void refreshData(){
    notifyListeners();
}
}

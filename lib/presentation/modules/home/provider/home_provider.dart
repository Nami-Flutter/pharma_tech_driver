import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/data/repository/home_Repo.dart';
import 'package:pharma_tech_driver/main.dart';
import '../../../../../core/api_checker.dart';
import '../../../../../data/model/response/base/api_response.dart';
import '../../../../../data/repository/SaveUserData.dart';
import '../../../../core/utils/showToast.dart';
import '../../../../data/model/response/myOrdersModel.dart';

class HomeViewModel with ChangeNotifier {
  final HomeRepo homeRepo;
  final SaveUserData saveUserData;
  HomeViewModel({required this.saveUserData, required this.homeRepo});

  ///variables
  bool _isLoading = false;
  bool _isLoadMore = false;

  OrdersModel? _ordersModel;
  List<OneOrder?> orderList=[];
  String status ='new';
  final ScrollController controller = ScrollController();
  int page = 1;
  CancelToken? cancelToken,cancelTokenLoadMore;
  ///getters
  bool get isLoading => _isLoading;
  bool get isLoadMore => _isLoadMore;
  ///setters

  initMyOrders() {
    page = 1;
    orderList =[];
    // type='new';
    controller.addListener(listener);
    cancelToken = null;
    cancelTokenLoadMore = null;
    _isLoadMore = false;
  }

  OrdersModel? get ordersModel => _ordersModel;

  ///calling APIs Functions

  Future<ApiResponse> getAllOrders() async {
    _isLoading = true;
    orderList=[];
    notifyListeners();
    ApiResponse responseModel = await homeRepo.orderHomeRepo(status,page);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _ordersModel = OrdersModel.fromJson(responseModel.response?.data);
      notifyListeners();
      orderList.clear();
      if (_ordersModel?.code == 200) {
        orderList.addAll(_ordersModel?.data??[]);
      } else {
        ToastUtils.showToast(_ordersModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(navigator.currentContext!, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }


  Future<void> loadMoreOrder(int page) async {
    try{
      print('pageeee=>$page');
      _isLoadMore = true;
      orderList.add(null);
      cancelTokenLoadMore ??= CancelToken();
      notifyListeners();
      ApiResponse responseModel = await homeRepo.orderHomeRepo(status,page);
      if(orderList.last==null){
        orderList.removeLast();
      }
      cancelTokenLoadMore = null;

      if (responseModel.response != null && responseModel.response?.statusCode == 200) {
        OrdersModel orderModel = OrdersModel.fromJson(responseModel.response?.data);
        if (orderModel.code == 200) {

          List<OneOrder> list = [];

          list.addAll(orderModel.data??[]);
          if(list.isNotEmpty){
            orderList.addAll(list);
            this.page = page;
          }

          // scrollDown();
        } else {
          ToastUtils.showToast(orderModel.message ?? '');
        }
      } else {
        ApiChecker.checkApi(navigator.currentContext!,responseModel);
      }
      _isLoadMore = false;
      notifyListeners();
    }catch (e){
      if(orderList.last==null){
        orderList.removeLast();
      }
      _isLoadMore = false;

      cancelTokenLoadMore = null;
      notifyListeners();

      print('getChatMessagesLoadMoreError=>>>$e');
    }
    return;
  }

  void listener() {
    if (controller.position.pixels == controller.position.maxScrollExtent && isLoadMore == false && orderList.length > 9) {
      int p = page + 1;
      loadMoreOrder(p);
    }
  }
}

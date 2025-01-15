import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/data/model/response/notificationModel.dart';
import 'package:pharma_tech_driver/data/repository/home_Repo.dart';
import 'package:pharma_tech_driver/main.dart';
import '../../../../../core/api_checker.dart';
import '../../../../../core/utils/showToast.dart';
import '../../../../../data/model/response/base/api_response.dart';
import '../../../../../data/repository/SaveUserData.dart';

class NotificationViewModel with ChangeNotifier {
  final HomeRepo homeRepo;
  final SaveUserData saveUserData;
  NotificationViewModel({required this.saveUserData, required this.homeRepo});

  ///variables
  bool _isLoading = false;
  bool _isLoadMore = false;

  NotificationModel? _notificationModel;
  List<OneNoti?> notificationList=[];
  final ScrollController controller = ScrollController();
  int page = 1;
  CancelToken? cancelToken,cancelTokenLoadMore;
  ///getters
  bool get isLoading => _isLoading;
  bool get isLoadMore => _isLoadMore;
  ///setters

  initMyNotification() {
    page = 1;
    notificationList =[];
    // type='new';
    controller.addListener(listener);
    cancelToken = null;
    cancelTokenLoadMore = null;
    _isLoadMore = false;
  }

  NotificationModel? get notificationModel => _notificationModel;

  ///calling APIs Functions

  Future<ApiResponse> getAllNotification() async {
    _isLoading = true;
    notificationList=[];
    notifyListeners();
    ApiResponse responseModel = await homeRepo.notificationsRepo(page);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _notificationModel = NotificationModel.fromJson(responseModel.response?.data);
      notifyListeners();
      notificationList.clear();
      if (_notificationModel?.code == 200) {
        notificationList.addAll(_notificationModel?.data??[]);
      } else {
        ToastUtils.showToast(_notificationModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(navigator.currentContext!, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }


  Future<void> loadMoreNotification(int page) async {
    try{
      print('pageeee=>$page');
      _isLoadMore = true;
      notificationList.add(null);
      cancelTokenLoadMore ??= CancelToken();
      notifyListeners();
      ApiResponse responseModel = await homeRepo.notificationsRepo(page);
      if(notificationList.last==null){
        notificationList.removeLast();
      }
      cancelTokenLoadMore = null;

      if (responseModel.response != null && responseModel.response?.statusCode == 200) {
        NotificationModel orderModel = NotificationModel.fromJson(responseModel.response?.data);
        if (orderModel.code == 200) {

          List<OneNoti> list = [];

          list.addAll(orderModel.data??[]);
          if(list.isNotEmpty){
            notificationList.addAll(list);
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
      if(notificationList.last==null){
        notificationList.removeLast();
      }
      _isLoadMore = false;

      cancelTokenLoadMore = null;
      notifyListeners();

      print('getChatMessagesLoadMoreError=>>>$e');
    }
    return;
  }

  void listener() {
    if (controller.position.pixels == controller.position.maxScrollExtent && isLoadMore == false && notificationList.length > 9) {
      int p = page + 1;
      loadMoreNotification(p);
    }
  }
}

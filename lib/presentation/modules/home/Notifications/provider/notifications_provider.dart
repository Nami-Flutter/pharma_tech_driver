import 'dart:async';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/data/model/response/base/emptyDataModel.dart';
import 'package:pharma_tech_driver/data/model/response/notificationModel.dart';
import 'package:pharma_tech_driver/data/repository/home_Repo.dart';
import 'package:pharma_tech_driver/main.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '../../../../../core/api_checker.dart';
import '../../../../../core/resources/locale_keys.g.dart';
import '../../../../../core/utils/showToast.dart';
import '../../../../../data/model/response/base/api_response.dart';
import '../../../../../data/model/response/notificationsCountModel.dart';
import '../../../../../data/repository/SaveUserData.dart';
import '../../../../component/loadings/progress_dialog.dart';

class NotificationViewModel with ChangeNotifier {
  final HomeRepo homeRepo;
  final SaveUserData saveUserData;
  NotificationViewModel({required this.saveUserData, required this.homeRepo});

  ///variables
  bool _isLoading = false;
  bool _isLoadMore = false;

  EmptyDataModel ? _emptyDataModel;
  NotificationModel? _notificationModel;
  NotificationsCountModel? _notificationsCountModel;
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
  NotificationsCountModel? get notificationsCountModel => _notificationsCountModel;

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

  Future<ApiResponse> getNotificationsCount() async {
    ApiResponse responseModel = await homeRepo.getNotificationsCountRepo(page);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _notificationsCountModel = NotificationsCountModel.fromJson(responseModel.response?.data);
      notifyListeners();
    } else {
      ApiChecker.checkApi(navigator.currentContext!, responseModel);
    }
    return responseModel;
  }

  Future<ApiResponse> deleteNotification(BuildContext context,String id) async {
    ApiResponse apiResponse = await homeRepo.deleteNotificationRepo(id);
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _emptyDataModel = EmptyDataModel.fromJson(apiResponse.response?.data);
      if(_emptyDataModel?.code == 200){
        _notificationModel?.data?.removeWhere((element) => element.id.toString() == id);
        notificationList.removeWhere((element) => element?.id.toString() == id);
      }
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }
  Future<ApiResponse> deleteAllNotification(BuildContext context,) async {
    ProgressDialog dialog = createProgressDialog(msg: "${LocaleKeys.delete.tr()} ...", context: context);
    await dialog.show();
    ApiResponse apiResponse = await homeRepo.deleteAllNotificationRepo();
    await dialog.hide();
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _emptyDataModel = EmptyDataModel.fromJson(apiResponse.response?.data);
      if(_emptyDataModel?.code == 200){
        _notificationModel?.data?.clear();
        notificationList.clear();
      }
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
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

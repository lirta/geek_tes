import 'dart:convert';

import 'package:geek_garden/base/BaseFunction.dart';
import 'package:geek_garden/base/BasePresenter.dart';
import 'package:geek_garden/home/pattern/homeView.dart';
import 'package:geek_garden/network/AppDataManager.dart';
import 'package:geek_garden/network/NetworkUtils.dart';

class HomePresenter extends BasePresenter<HomeView> {
  List? data;
  Future getProduct() async {
    // checkViewAttached();
    var response = await appDataManager.apiHelper.getProducts();
    // print(response.body);
    data = json.decode(response.body);
    // print(data);
    if (NetworkUtils.isReqSuccess(response)) {
      getView().onSuccessGetProducts(data!);
    } else {
      getView().onFailedGetProducts(data!);
    }
  }
}

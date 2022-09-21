import 'package:flutter/material.dart';
import 'package:geek_garden/home/pattern/homePresenter.dart';
import 'package:geek_garden/home/pattern/homeView.dart';
import 'package:geek_garden/home/pattern/homeWidget.dart';
import 'package:geek_garden/model/ProductsModel.dart';
import 'package:geek_garden/network/ApiProvider.dart';
import 'package:provider/provider.dart';

import 'ProductForm.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain>
    with TickerProviderStateMixin
    implements HomeView {
  late HomePresenter homePresenter;
  List? dataProdac;
  @override
  void initState() {
    homePresenter = new HomePresenter();
    homePresenter.attachView(this);
    homePresenter.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ProductForm(
                        type: "add",
                        product: "",
                      ),
                  settings: RouteSettings(name: "product Form")));
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: cardProduc(context, dataProdac),
    );
  }

  @override
  onFailedGetProducts(List data) {
    // TODO: implement onFailedGetProducts
    throw UnimplementedError();
  }

  @override
  onSuccessGetProducts(List data) {
    // TODO: implement onSuccessGetProducts
    // throw UnimplementedError();
    if (this.mounted) {
      setState(() {
        dataProdac = data;
        print("dataProdac");
        print(dataProdac);
      });
    }
  }
}

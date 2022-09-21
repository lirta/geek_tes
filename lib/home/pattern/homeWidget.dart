import 'dart:io';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import '../ProductForm.dart';

Widget cardProduc(BuildContext context, List? dataProduct) {
  return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: dataProduct == null ? 0 : dataProduct.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: Material(
            type: MaterialType.card,
            elevation: 2,
            child: InkWell(
              onTap: () async {
                final newproduk = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => ProductForm(
                            type: "edit",
                            product: dataProduct![index].toString()),
                        settings: RouteSettings(name: "product Form")));
              },
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            width: 150,
                            height: 150,
                            child: Stack(
                              children: [
                                Positioned(
                                    child: Image.network(
                                  dataProduct![index]['image'],
                                  fit: BoxFit.fill,
                                )),
                                Positioned(
                                    child: Text(
                                  dataProduct[index]["price"].toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dataProduct[index]["title"],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                dataProduct[index]["category"],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                dataProduct[index]["description"],
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                                maxLines: 4,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.star),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(dataProduct[index]['rating']["rate"]
                                      .toString()),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Widget dysplayForm(
  BuildContext context,
  String kType,
  String? oldPicture,
  TextEditingController title,
  TextEditingController price,
  TextEditingController description,
  TextEditingController category,
  TextEditingController rate,
  final formKey,
  Function _showChoiceDialog,
  Function uploadImage,
  File? _fileImage,
) {
  return SingleChildScrollView(
    child: Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 12, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 8), child: Text("Title")),
                Container(
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    controller: title,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.only(left: 12, top: 12),
                      fillColor: Color.fromRGBO(241, 241, 241, 1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 12, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 8), child: Text("Price")),
                Container(
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    controller: title,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.only(left: 12, top: 12),
                      fillColor: Color.fromRGBO(241, 241, 241, 1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 12, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text("Category")),
                Container(
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    controller: title,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.only(left: 12, top: 12),
                      fillColor: Color.fromRGBO(241, 241, 241, 1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 12, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text("Description")),
                Container(
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    controller: title,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.only(left: 12, top: 12),
                      fillColor: Color.fromRGBO(241, 241, 241, 1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          addPic(
              context, uploadImage, _fileImage, oldPicture, _showChoiceDialog)
        ],
      ),
    ),
  );
}

Widget addPic(
  BuildContext context,
  Function uploadImage,
  File? _fileImage,
  oldPicture,
  Function _showChoiceDialog,
) {
  return Container(
    padding: EdgeInsets.all(16),
//    color: Colors.white,
    //margin: const EdgeInsets.only(bottom: 24.0),
    child: Center(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => _showChoiceDialog(context),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: Color.fromARGB(255, 105, 100, 100), width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                // child: Image(
                //     image: _fileImage != null
                //         ? FileImage(_fileImage)
                //         : oldPicture != ""
                //             ? CachedNetworkImageProvider(oldPicture)
                //             : AssetImage(
                //                 'assets/images/no_image_available.jpg')),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => _showChoiceDialog(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Gambar Product",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

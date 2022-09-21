import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:geek_garden/base/BaseFunction.dart';
import 'package:geek_garden/home/pattern/homeWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProductForm extends StatefulWidget {
  final String type;
  final String product;
  const ProductForm({Key? key, required this.type, required this.product})
      : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final formKey = new GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController rate = TextEditingController();
  File? _fileImage;
  int? _fileLength;
  String? kType, oldPicture;
  void initState() {
    kType = widget.type;
    if (widget.product != "") {
    } else {
      oldPicture = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type == "edit" ? "Edit Product" : "Add Product"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: dysplayForm(
            context,
            kType!,
            oldPicture,
            title,
            price,
            description,
            category,
            rate,
            formKey,
            _showChoiceDialog,
            uploadImage,
            _fileImage),
      ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              "Pilih dari :",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.black, fontSize: 18),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.image),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    onTap: () {
                      uploadImage(context, ImageSource.gallery);
                    },
                    title: Text("Galeri",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12.5, color: Colors.black)),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.camera),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    onTap: () {
                      uploadImage(context, ImageSource.camera);
                    },
                    title: Text("Kamera",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12.5, color: Colors.black)),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future uploadImage(BuildContext context, ImageSource source) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();

    if (statuses[Permission.camera] == PermissionStatus.granted &&
        statuses[Permission.storage] == PermissionStatus.granted) {
      var imageFile = await ImagePicker()
          .getImage(source: source, maxHeight: 480, maxWidth: 640);

      var _image =
          await FlutterExifRotation.rotateAndSaveImage(path: imageFile!.path);

      final length = await _image.length();
      setState(() {
        _fileImage = _image;
        _fileLength = length;
      });
      Navigator.of(context).pop();
    } else if (statuses[Permission.camera] != PermissionStatus.granted &&
        statuses[Permission.storage] != PermissionStatus.granted) {
      BaseFunction().displayToast('Akses kamera dan penyimpanan diperlukan');
      Navigator.of(context).pop();
    } else if (statuses[Permission.camera] != PermissionStatus.granted) {
      BaseFunction().displayToast('Akses kamera diperlukan untuk fitur ini');
      Navigator.of(context).pop();
    } else if (statuses[Permission.storage] != PermissionStatus.granted) {
      BaseFunction().displayToast('Akses penyimpanan diperlukan');
      Navigator.of(context).pop();
    }
  }
}

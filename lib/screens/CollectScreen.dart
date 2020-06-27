import 'package:epicontrol/screens/DataCollectFormScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:epicontrol/constant.dart';
import 'package:epicontrol/component/AppBarWidget.dart';
import 'package:epicontrol/component/Cards.dart';
import 'package:epicontrol/component/MenuDrawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:epicontrol/actions/UploadFile.dart';
import 'dart:io';

UploadFile uploadFile = UploadFile();

class CollectScreen extends StatefulWidget {
  static String id = 'collectScreen';

  @override
  _CollectScreenState createState() => _CollectScreenState();
}

class _CollectScreenState extends State<CollectScreen> {

  List<File> imageList = [];
  File image;
  final picker = ImagePicker();

  // get file from gallery
  openImage() async {
    final imageFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(imageFile.path);
      imageList.add(image);
    });
  }

  // get image from camera
  openCamera() async {
    final imageFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(imageFile.path);
      imageList.add(image);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarWidget(title: 'Collect')
      ),
      drawer: MenuDrawer(),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: MediaQuery.of(context).size.height / 200,
          crossAxisSpacing: 5.0,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
          mainAxisSpacing: 5.0,
          children: <Widget>[
            Cards(
              text: 'Fill form',
              icon: Icons.format_align_justify,
              color: kBlueColor,
              onTap: () {Navigator.pushNamed(context, DataCollectForm.id);},
            ),
            Cards(
              text: 'Upload file',
              icon: Icons.file_upload,
              color: kGreenColor,
              onTap: () {
                openImage();
              },
            ),
            Cards(
              text: 'Snap Capture',
              icon: Icons.camera,
              color: kRedColor,
              onTap: () {
                openCamera();
              },
            ),
            ListView(
              children: <Widget>[
                Container(
                  height: 800,
                  child: imageList.length == 0 ?
                  Text('no image seleted',style: TextStyle(color: kGreenColor)) :
                  GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: false,
                      primary: false,
                      children: imageList.map((File file) {
                        return Card(
                          child: Image.file(
                            file,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList()
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

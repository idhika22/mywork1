import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Multitext extends StatefulWidget {
  const Multitext({super.key});

  @override
  State<Multitext> createState() => _MultitextState();
}

class _MultitextState extends State<Multitext> {
  String imageURL='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(
              minLines: 2,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: 'Enter Message Here',
                  hintStyle: TextStyle(
                      color:Colors.black38
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
              ),
            ),
            // ElevatedButton(onPressed:(){}, child: Text("SEND")),
            IconButton(onPressed:() async{
              ImagePicker imagePicker=ImagePicker();
              XFile? file= await imagePicker.pickImage(source:ImageSource.camera);
              print('${file?.path}');
              if(file==null) return;
              String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();
              //Reference referenceRoot=FirebaseStorage.instance.ref();
              //Reference referenceDirImages=referenceRoot.child('images');
              //Reference referenceImageToUpload=referenceDirImages.child(uniqueFileName);



            }, icon: Icon(Icons.camera_alt),iconSize:50.0),
            ElevatedButton(onPressed: (){}, child: Text("SUBMIT"))
          ],
        ),
      ),
    );

  }
}
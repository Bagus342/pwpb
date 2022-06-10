import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar (

      // ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  // Pick an image
  // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  XFile? image;
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 100, 30, 50),
      child: Column(
        children: <Widget>[
          Text('Judul'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(25.0))),
              labelText: 'Judul',
            ),
          ),
          Text('Deksripsi'),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Deksripsi',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(25.0))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              final pickedImage =
                  await _picker.pickImage(source: ImageSource.gallery);

              if (pickedImage != null) {
                setState(() {
                  image = pickedImage;
                  imageFile = File(image!.path);
                });
              }
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(
                        20) //                 <--- border radius here
                    ),
              ),
              child: image != null
                  ? Image.file(imageFile!, fit: BoxFit.cover)
                  : Center(
                      child: Text('Tap to upload image'),
                    ),
            ),
          ),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: ElevatedButton(
              onPressed: () {},
              child: Text('Cancel'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
            )),
            SizedBox(width: 20),
            Expanded(
                child: ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
            ))
          ])
        ],
      ),
    );
  }
}

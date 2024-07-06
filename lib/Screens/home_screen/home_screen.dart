import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:re_exam_core_flutter/utils/list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

ImagePicker imagePicker = ImagePicker();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController txtname = TextEditingController();
          TextEditingController txtstd = TextEditingController();
          TextEditingController txtid = TextEditingController();
          setState(() {
            controllerList.add(controllerModel(
              name: txtname,
              std: txtstd,
              grid: txtid,
            ));
          });
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(
                controllerList.length,
                (index) => Container(
                  margin: EdgeInsets.all(15),
                  height: 420,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: (fileImage!=null)?FileImage(fileImage!):null,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(onPressed: () async {

                              XFile? xFileImage = await imagePicker.pickImage(source: ImageSource.gallery);
                              setState(() {
                                fileImage = File(xFileImage!.path);
                              });

                            }, icon: Icon(Icons.image,size: 40,)),
                            IconButton(onPressed: () async {

                              XFile? xFileImage = await imagePicker.pickImage(source: ImageSource.camera);
                              setState(() {
                                fileImage = File(xFileImage!.path);
                              });

                            }, icon: Icon(Icons.camera_alt,size: 40,))
                          ],
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: controllerList[index].name,
                            decoration: InputDecoration(
                              label: Text('name'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: controllerList[index].std,
                            decoration: InputDecoration(
                              label: Text('std'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: controllerList[index].grid,
                            decoration: InputDecoration(
                              label: Text('grid'),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextButton(
                            onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Text(
                                      'Remove',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Colors.lightBlue),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              controllerList.removeAt(index);
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Ok',
                                            style: TextStyle(
                                                color: Colors.lightBlue),
                                          ))
                                    ],
                                  ),
                                ),
                            child: Text(
                              'Remove',
                              style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail');
                },
                child: Container(
                  height: 70,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'See the details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
File? fileImage;

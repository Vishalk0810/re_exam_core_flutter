import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:re_exam_core_flutter/utils/list.dart';

import '../home_screen/home_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(controllerList.length, (index)=> Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: 200,
                      width: 380,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2,color:
                          Colors.black)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: (fileImage!=null)?FileImage(fileImage!):null,
                          ),
                          ListTile(
                            title: Text('Name : ${controllerList[index].name.text}'),
                            leading: Text('std : ${controllerList[index].std.text}',style: TextStyle(
                              fontSize: 15,
                            ),),
                            subtitle: Text('Grid : ${controllerList[index].grid.text}',style: TextStyle(
                              fontSize: 17,
                            ),),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(context: context, builder: (context) => SingleChildScrollView(
                                      child: AlertDialog(
                                        title: Text('Update'),
                                        actions: [
                                          Column(
                                            children: [
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
                                              TextFormField(
                                                controller : controllerList[index].name,
                                                decoration: InputDecoration(
                                                  labelText: 'Name',
                                                  hintText: 'Name',
                                                ),
                                              ),
                                              TextFormField(
                                                controller : controllerList[index].std,
                                                decoration: InputDecoration(
                                                  labelText: 'Std',
                                                  hintText: 'Std',
                                                ),
                                              ),
                                              TextFormField(
                                                controller : controllerList[index].grid,
                                                decoration: InputDecoration(
                                                  labelText: 'Grid',
                                                  hintText: 'Grid',
                                                ),
                                              ),
                                              SizedBox(height: 20,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  TextButton(onPressed: () {
                                      
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                      
                                                  }, child: Text('Cancel')),
                                                  TextButton(onPressed: () {
                                      
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                      
                                                  }, child: Text('Ohk')),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),);
                                  },
                                    child: Icon(Icons.edit)
                                ),
                                SizedBox(width: 30,),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(context: context, builder: (context) => AlertDialog(
                                      title: Text('Delete'),
                                      actions: [
                                        TextButton(onPressed: () {

                                          setState(() {
                                            Navigator.pop(context);
                                          });

                                        }, child: Text('cancel')),

                                        TextButton(onPressed: () {

                                          setState(() {
                                            controllerList.removeAt(index);
                                            Navigator.pop(context);
                                          });

                                        }, child: Text('Ohk')),
                                      ],
                                    ),);
                                  },
                                    child: Icon(Icons.delete)),
                              ],
                            ),
                          ),
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
  }
}

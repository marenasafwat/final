// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_single_cascade_in_expression_statements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/youth.dart';
import 'package:flutter_application_1/widgets/youth_widget.dart';

class YouthPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  YouthPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('events'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Events").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: [
              ...snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return YouthWidget(
                  youth: Youth.fromMap(data),
                ); // 👈 Your valid data here
              }).toList()
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController nameController = TextEditingController();
              TextEditingController aboutController = TextEditingController();
              TextEditingController descriptionController =TextEditingController();
              TextEditingController imageController = TextEditingController();

              return Dialog(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Name
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            nameController.text = value!;
                          },
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(hintText: "Name"),
                        ),
                      ),

                      //about
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: aboutController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            aboutController.text = value!;
                          },
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(hintText: "about"),
                        ),
                      ),

                      //description
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: descriptionController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some description';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            descriptionController.text = value!;
                          },
                          keyboardType: TextInputType.text,
                          decoration:
                              const InputDecoration(hintText: "description"),
                        ),
                      ),

                      //image
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: imageController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter URL';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            imageController.text = value!;
                          },
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(hintText: "image"),
                        ),
                      ),

                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(const Size(330, 50)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          //Prees to
                          onPressed: () async {
                            String name = nameController.text;
                            String about = aboutController.text;
                            String description = descriptionController.text;
                            String image = imageController.text;
                            //nameController.clear();
                            //aboutController.clear();
                            //descriptionController.clear();
                            //imageController.clear();

                            var y = FirebaseFirestore.instance;

                            Youth youth = Youth(
                                name: name,
                                about: about,
                                description: description,
                                image: image);
                            await y
                                .collection('Events')
                                .doc(name)
                                .set(youth.toMap());

                            Navigator.pop(context);
                          },
                          child: const Text('Submit')),

                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(360, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () async {
                          String name = nameController.text;
                          String about = aboutController.text;
                          String description = descriptionController.text;
                          String image = imageController.text;

                          //if (_formKey.currentState!.validate())
                           {
                            //var y = FirebaseFirestore.instance;

                            // Use the event name as the document ID for updating
                            updateFirestore(name, name, about, description, image);

                            

                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Update'),
                      ),

                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(360, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () async {
                          String name = nameController.text;

                          // Call the delete function with the event name (document ID) to delete the document
                          deleteFirestore(name);

                          nameController.clear();
                          
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Future<void> updateFirestore(String eventName, String newName, String newAbout,
    String newDescription, String newImage) async {
  try {
    var y = FirebaseFirestore.instance;

    // Update specific fields within the document
    await y.collection('events').doc(eventName).update({
      'name': newName,
      'about': newAbout,
      'description': newDescription,
      'image': newImage,
      // Add more fields to update as needed
    });

    print('Document updated successfully!');
  } catch (e) {
    print('Error updating document: $e');
  }
}

Future<void> deleteFirestore(String eventName) async {
  try {
    var y = FirebaseFirestore.instance;

    // Delete the document based on activityName (assuming it's the document ID)
    await y.collection('events').doc(eventName).delete();

    print('Document deleted successfully!');
  } catch (e) {
    print('Error deleting document: $e');
  }
}

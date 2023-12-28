// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_single_cascade_in_expression_statements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/activities.dart';
import 'package:flutter_application_1/widgets/activites_widget.dart';

class StudentActPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  StudentActPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Activites'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("activites").snapshots(),
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

                return ActivitiesWidget(
                  activities: Activities.fromMap(data),
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
              TextEditingController imageController = TextEditingController();
              TextEditingController descriptionController =
                  TextEditingController();
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
                      //Description
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: descriptionController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
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
                      //Image
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: imageController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter url';
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
                            String image = imageController.text;
                            String description = descriptionController.text;
                            nameController.clear();
                            imageController.clear();
                            descriptionController.clear();

                            var db = FirebaseFirestore.instance;

                            Activities activites = Activities(
                                name: name,
                                image: image,
                                description: description);
                            await db
                                .collection('activites')
                                .doc(name)
                                .set(activites.toMap());

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
                          String image = imageController.text;
                          String description = descriptionController.text;

                          // Assuming 'name' holds the existing activity name/document ID
                          updateFirestore(name, name, image, description);
                          Navigator.pop(context);
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

                          // Call the delete function with the activity name (document ID) to delete the document
                          deleteFirestore(name);
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

  Future<void> updateFirestore(String activityName, String newName,
      String newImage, String newDescription) async {
    try {
      var db = FirebaseFirestore.instance;

      // Update specific fields within the document
      await db.collection('activites').doc(activityName).update({
        'name': newName,
        'image': newImage,
        'description': newDescription,
        // Add more fields to update as needed
      });

      print('Document updated successfully!');
    } catch (e) {
      print('Error updating document: $e');
    }
  }
}

Future<void> deleteFirestore(String activityName) async {
  try {
    var db = FirebaseFirestore.instance;

    // Delete the document based on activityName (assuming it's the document ID)
    await db.collection('activites').doc(activityName).delete();

    print('Document deleted successfully!');
  } catch (e) {
    print('Error deleting document: $e');
  }
}

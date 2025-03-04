import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb, Uint8List;

class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  File? _imageFile;
  Uint8List? _webImage;
  String? imageUrl;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    String userId = _auth.currentUser!.uid;
    DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();

    if (userDoc.exists) {
      setState(() {
        nameController.text = userDoc['name'] ?? '';
        roleController.text = userDoc['role'] ?? '';
        mobileController.text = userDoc['mobile'] ?? '';
        imageUrl = userDoc['profileImage'];
      });
    }
  }

  Future<void> pickImage() async {
    print("pickImage() called"); // Debugging statement
    final ImagePicker picker = ImagePicker();
    if (kIsWeb) {
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final Uint8List bytes = await pickedFile.readAsBytes();
        setState(() {
          _webImage = bytes;
        });
        print("Image picked for web");
        uploadImage();
      } else {
        print("No image selected for web");
      }
    } else {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
        print("Image picked: ${pickedFile.path}");
        uploadImage();
      } else {
        print("No image selected");
      }
    }
  }


  Future<void> uploadImage() async {
    print("uploadImage() called"); // Debugging statement
    if (_imageFile == null && _webImage == null) {
      print("No image to upload");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      Reference storageRef = FirebaseStorage.instance.ref().child("profile_images/$userId.jpg");

      UploadTask uploadTask;
      if (kIsWeb) {
        print("Uploading web image...");
        uploadTask = storageRef.putData(_webImage!);
      } else {
        print("Uploading file: ${_imageFile!.path}");
        uploadTask = storageRef.putFile(_imageFile!);
      }

      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();

      print("Image uploaded successfully: $downloadURL");

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'profileImage': downloadURL,
      }).then((_) {
        print("Firestore updated successfully.");
      }).catchError((error) {
        print("Firestore update failed: $error");
      });

      setState(() {
        imageUrl = downloadURL;
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile Image Updated")));
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error updating image: $e")));
    }
  }




  Future<void> updateProfile() async {
    String userId = _auth.currentUser!.uid;
    await _firestore.collection('users').doc(userId).update({
      'name': nameController.text,
      'role': roleController.text,
      'mobile': mobileController.text,
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile Updated")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   scrolledUnderElevation: 0,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back, color: Colors.white),
      //   ),
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [Colors.blueGrey.shade100, Colors.blueGrey.shade100],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //       ),
      //     ),
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade100, Colors.blueGrey.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Update Profile",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: pickImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: _webImage != null
                            ? MemoryImage(_webImage!)
                            : (_imageFile != null
                            ? FileImage(_imageFile!)
                            : (imageUrl != null && imageUrl!.isNotEmpty)
                            ? NetworkImage(imageUrl!)
                            : null),
                        child: (_imageFile == null && _webImage == null && (imageUrl == null || imageUrl!.isEmpty))
                            ? Icon(Icons.camera_alt, size: 30, color: Colors.grey)
                            : null,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.blue),
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: roleController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.work, color: Colors.blue),
                        labelText: "Role",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: mobileController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone, color: Colors.blue),
                        labelText: "Mobile",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: updateProfile,
                      child: Text("Update Profile"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

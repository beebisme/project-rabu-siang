import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/app/widget/bottom_nav.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class UserProfile {
  String name;
  String imageUrl;
  String location;
  String bio;

  UserProfile({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.bio,
  });
}

class _ProfileViewState extends State<ProfileView> {
  List<UserProfile> profiles = [];

  Future<void> _addProfile() async {
    final picker = ImagePicker();
    XFile? pickedFile;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () async {
                    Navigator.pop(context);
                    try {
                      pickedFile =
                          await picker.pickImage(source: ImageSource.camera);
                      if (pickedFile == null) {
                        return;
                      }
                      final userProfile =
                          await _getUserProfileDetails(pickedFile!.path);
                      if (userProfile != null) {
                        setState(() {
                          profiles.add(userProfile);
                        });
                      }
                    } catch (e) {
                      print('Error picking image from camera: $e');
                    }
                  },
                ),
                Padding(padding: EdgeInsets.all(20.0)),
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () async {
                    Navigator.pop(context);
                    try {
                      pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile == null) {
                        return;
                      }
                      final userProfile =
                          await _getUserProfileDetails(pickedFile!.path);
                      if (userProfile != null) {
                        setState(() {
                          profiles.add(userProfile);
                        });
                      }
                    } catch (e) {
                      print('Error picking image from gallery: $e');
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<UserProfile?> _getUserProfileDetails(String imagePath) async {
    return showDialog<UserProfile>(
      context: context,
      builder: (context) {
        String name = '';
        String location = '';
        String bio = '';

        return AlertDialog(
          title: Text('Create Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  onChanged: (value) {
                    location = value;
                  },
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                TextField(
                  onChanged: (value) {
                    bio = value;
                  },
                  decoration: InputDecoration(labelText: 'Bio'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                      UserProfile(
                        name: name,
                        imageUrl: imagePath,
                        location: location,
                        bio: bio,
                      ),
                    );
                  },
                  child: Text('Create Profile'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profiles'),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Color.fromARGB(255, 60, 56, 122),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return Container(
            // Mengganti warna latar belakang kontainer
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 219, 166, 255),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Color.fromARGB(255, 60, 56, 122),
                width: 1.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                        File(profiles[index].imageUrl),
                        width: double.infinity,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  profiles[index].name,
                  style: TextStyle(
                    color: Colors.white, // Mengganti warna teks
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  profiles[index].location,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white, // Mengganti warna teks
                  ),
                ),
                Text(
                  profiles[index].bio,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white, // Mengganti warna teks
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProfile,
        tooltip: 'Add Profile',
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 60, 56, 122),
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
        onItemTapped: (index) {
          // Define what should happen when a tab is tapped here
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_ui/common/theme/app_colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_app_bar.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';

class UserInfoScreen extends StatelessWidget {
  static const String routeName = '/user-info';
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: 'User Information',
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: AppColors.authButton),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    //pick image
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text("Select Profile Picture"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text("Take a picture"),
                              onTap: () async {
                                //pick image from camera
                                Navigator.of(context).pop();
                                // Implement camera image picking logic here
                                final pickedFile =
                                    await ImagePicker().pickImage(
                                  source: ImageSource.camera,
                                );
                                if (pickedFile != null) {
                                  // Use the picked image
                                }
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.image),
                              title: const Text("Select from gallery"),
                              onTap: () async {
                                //pick image from gallery
                                Navigator.of(context).pop();
                                // Implement gallery image picking logic here
                                final pickedFile =
                                    await ImagePicker().pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (pickedFile != null) {
                                  // Use the picked image
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter your name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'This is how you will appear in ChatApp',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Spacer(),
                CustomButton(text:'NEXT', onPressed: () {
                  // Navigate to the next screen
                }),
                const SizedBox(height: 10),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

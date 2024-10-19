import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart'; // Add this for image picking functionality
import 'package:my_website/controllers/auth_controller.dart';
import 'package:my_website/controllers/write_blogs_controller.dart';
import 'package:my_website/models/register_model.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';
import 'package:my_website/web_services/url_constant.dart';
import 'package:my_website/web_services/web_services.dart';
import 'package:my_website/widgets/botton_widget.dart';
import 'package:provider/provider.dart';

class SignupDialog extends StatefulWidget {
  const SignupDialog({super.key});

  @override
  _SignupDialogState createState() => _SignupDialogState();
}

class _SignupDialogState extends State<SignupDialog> {
  Uint8List? _imageBytes;
  final ImagePicker _picker = ImagePicker();

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }


 

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Container(
        width: displayWidth(context) / 3.2,
        child: SingleChildScrollView(
          child: Consumer<AuthController>(
              builder: (context, authController, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile image selection container

               authController.isSignin ? signinWidget() : signupWidget(),
                const SizedBox(height: 30),
                // Continue button
             authController.isRequesting?Container(
              width: displayHeight(context) /1,
              alignment: Alignment.center,
               child: Container(
                decoration: BoxDecoration(
                  color: ColorConstant.lightRedColor,
                  shape: BoxShape.circle
                ),
                       padding: const EdgeInsets.all(10),
                       width: displayHeight(context) / 15,
                        height: displayHeight(context) / 15,
                       child: const CircularProgressIndicator(
                           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                       ),
                   ),
             ):
                InkWell(
                  onTap: () {
                    if (authController.isSignin == false) {
                      RegisterModel registerModel = RegisterModel(
                          fullName: _fullNameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          profilePic: _imageBytes!);
                      authController.callForRegister(registerModel:registerModel,
                      context: context
                      );
                    }
                  },
                  child: BottonWidgets.getContinueBotton(
                    context: context,
                    title: 'Continue',
                  ),
                ),
                const SizedBox(height: 20),
                // Already have an account? Sign In text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      authController.isSignin == false
                          ? "Already have an account? "
                          : "Don't haave any account?",
                      style: GoogleFonts.barlow(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        authController.switchSigninSignUp();
                      },
                      child: Text(
                        authController.isSignin ? "Sign Up" : "Sign In",
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                            color: ColorConstant.lightRedColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget signupWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: InkWell(
            onTap: _pickImage, // Tapping this will open the gallery
            child: CircleAvatar(
              radius: 50, // Profile image size
              backgroundImage:
                  _imageBytes != null ? MemoryImage(_imageBytes!) : null,
              child: _imageBytes == null
                  ? Icon(Icons.add_a_photo, color: Colors.white, size: 50)
                  : null,
              backgroundColor: Colors.grey.shade800,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Full Name field
        Text(
          "What's your full name?",
          style: GoogleFonts.barlow(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: _fullNameController,
            decoration: const InputDecoration(
              hintText: 'Enter full name',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12.0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Email field
        Text(
          "What's your email?",
          style: GoogleFonts.barlow(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'Enter email',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12.0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Password field
        Text(
          "Enter password",
          style: GoogleFonts.barlow(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: _passwordController,
            obscureText: true, // Hide password input
            decoration: InputDecoration(
              hintText: 'Enter password',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget signinWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email field
        Text(
          "What's your email?",
          style: GoogleFonts.barlow(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'Enter email',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12.0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Password field
        Text(
          "Enter password",
          style: GoogleFonts.barlow(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: _passwordController,
            obscureText: true, // Hide password input
            decoration: const InputDecoration(
              hintText: 'Enter password',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12.0),
            ),
          ),
        ),
      ],
    );
  }
}

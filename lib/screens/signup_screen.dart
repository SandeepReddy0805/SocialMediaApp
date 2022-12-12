import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/resources/authentication.dart';
import 'package:social_media_app/utils/colors.dart';

import '../utils/utils.dart';
import '../widgets/text_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  Uint8List? file;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    bioController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      file = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: Colors.white,
              ),
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  file != null
                      ? CircleAvatar(
                          radius: 54, backgroundImage: MemoryImage(file!))
                      : const CircleAvatar(
                          radius: 54,
                          backgroundImage:
                              AssetImage('assets/blank-profile-picture.png')),
                  Positioned(
                      bottom: -10,
                      right: -10,
                      child: IconButton(
                        focusColor: Colors.grey,
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo),
                        color: Colors.white,
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextInputField(
                  hintText: 'Enter your email',
                  controller: emailController,
                  inputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              TextInputField(
                hintText: 'Enter your password',
                controller: passwordController,
                inputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 16,
              ),
              TextInputField(
                hintText: 'Enter username',
                controller: usernameController,
                inputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              TextInputField(
                hintText: 'Enter your bio',
                controller: bioController,
                inputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(blueColor)),
                  onPressed: () async {
                    String response = await Authentication().signupUser(
                        email: emailController.text,
                        password: passwordController.text,
                        bio: bioController.text,
                        username: usernameController.text,
                        file: file!);
                    if (response != 'success') {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(response)));
                    }
                    ;
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(child: Container(), flex: 2),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Color.fromARGB(255, 107, 107, 107))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: const Text("Have an account already?")),
                  GestureDetector(
                    onTap: (() {}),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

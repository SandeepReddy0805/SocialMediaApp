import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/utils/colors.dart';

import '../widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
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
            TextInputField(
                hintText: 'Enter your email',
                controller: emailController,
                inputType: TextInputType.emailAddress),
            const SizedBox(
              height: 24,
            ),
            TextInputField(
              hintText: 'Enter your password',
              controller: passwordController,
              inputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(blueColor)),
                onPressed: () {},
                child: const Text(
                  'Log in',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Flexible(child: Container(), flex: 2),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Color.fromARGB(255, 107, 107, 107))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: const Text("Don't have an account?")),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

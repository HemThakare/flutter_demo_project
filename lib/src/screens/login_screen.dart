import 'package:first_first_project/res/routes/routes_name.dart';
import 'package:first_first_project/src/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final Color _borderColor = Colors.purple; // Border color
  final Color _errorColor = Colors.red; // Error text color

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          child: Form(
            key: loginController.formField,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/avtar.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: loginController.emailController.value,
                  focusNode: loginController.emailFocusNode.value,
                  decoration: InputDecoration(
                      labelText: "Enter Email Id",
                      labelStyle: TextStyle(color: _borderColor),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: _borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _borderColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _errorColor),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _errorColor),
                      ),
                      errorStyle: TextStyle(color: _errorColor),
                      prefixIcon: Icon(Icons.email, color: _borderColor,)),
                  validator: (email) => loginController.validateEmail(email),
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: loginController.passWordController.value,
                    focusNode: loginController.passwordFocusNode.value,
                    decoration: InputDecoration(
                        labelText: "Enter Password",
                        labelStyle: TextStyle(color: _borderColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: _borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _borderColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _errorColor),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _errorColor),
                        ),
                        errorStyle: TextStyle(color: _errorColor),
                        prefixIcon: Icon(Icons.lock, color: _borderColor,),
                        suffix: InkWell(
                          onTap: () {
                            loginController.togglePassword();
                          },
                          child: Icon(loginController.passwordToggle.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    obscureText: !loginController.passwordToggle.value,
                    validator: (password) =>
                        loginController.validatePassword(password),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Background color
                  ),
                  onPressed: () {
                    // Action to perform when the button is pressed
                    /*if (loginController.formField.currentState!.validate()) {
                      Get.toNamed(RoutesName.USER_SCREEN);
                      loginController.emailController.value.clear();
                      loginController.passWordController.value.clear();
                    }*/
                    Get.toNamed(RoutesName.USER_SCREEN);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15),
                    child: Container(
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Get.snackbar(
                          'Sign up',                // Title of the Snackbar
                          'You have successfully signed up.', // Message of the
                          // Snackbar
                          snackPosition: SnackPosition.BOTTOM, // Position of the
                          // Snackbar
                          backgroundColor: const Color(0xFF478523), //
                          // Background color of the
                          // Snackbar
                          colorText: Colors.white, // Text color of the Snackbar
                          borderRadius: 10, // Border radius of the Snackbar
                          margin: EdgeInsets.all(16), // Margin around the Snackbar
                          animationDuration: Duration(milliseconds: 300), // Animation duration
                          duration: Duration(seconds: 2), // Duration the Snackbar is visible
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

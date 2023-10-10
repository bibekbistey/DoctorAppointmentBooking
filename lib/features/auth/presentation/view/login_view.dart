import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/config/router/app_route.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../viewmodel/auth_view_model.dart';

class LogInView extends ConsumerStatefulWidget {
  const LogInView({super.key});

  @override
  ConsumerState<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends ConsumerState<LogInView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Save a reference to the ancestor widget here if needed
  }

  @override
  void dispose() {
    // Dispose of any resources here
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set transparent background
        elevation: 0, // Remove the shadow
        title: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the text bold
            fontSize: 30, // Increase the text size
          ),
        ),

      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white], // Add your gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // AssetImage(assets / images / Login.png),
                    children: [
                      // Image.asset(assets / images / login.webp),
                      // AssetImage(assets/images/LogIn)
      
                      Image.network(
                        "https://cdn.pixabay.com/photo/2020/07/14/13/07/icon-5404125_1280.png",
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(height: 50),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          iconColor: Colors.red,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        // suffixIcon: GestureDetector(ontap(){
                        //   setState(() {
                        //     _showPassword = !_showPassword;
                        //   },);
      
                        // },
                        // child: const Icon(Icons.visibility_off : Icons.Visibility,
                        // color: Colors.grey,),)
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        // onPressed: () {
                        //   Navigator.pushNamed(
                        //     context,
                        //     AppRoute.homeRoute,
                        //   );
                        // },
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await ref
                                .read(authViewModelProvider.notifier)
                                .loginStudent(
                                  context,
                                  _emailController.text,
                                  _passwordController.text,
                                );
      
                            //     Navigator.pushNamed(
                            //       context,
                            //       '/homepage',
                            //     );
      
                            // if (_formKey.currentState!.validate()) {
                            //   Navigator.pushNamed(context, AppRoute.homeRoute);
                            // }
      
                            //     // We don't use Navigator and Snackbar here, but for
                            //     // time being, we will use it.
                            //     // if (isLogin) {
                            //     //   Navigator.pushNamed(context, AppRoute.homeRoute);
                            //     // } else {
                            //     //   showSnackBar(
                            //     //     message:
                            //     //         'Either username or password is incorrect',
                            //     //     context: context,
                            //     //     color: Colors.red,
                            //     //   );
                            //     // }
                          }
                          if (_formKey.currentState!.validate()) {
                                  // ignore: unrelated_type_equality_checks
                                  if (_emailController.text.trim() ==
                                          "admin1@gmail.com" &&
                                      // ignore: unrelated_type_equality_checks
                                      _passwordController.text.trim() ==
                                          "admin") {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushNamed(
                                        context, AppRoute.adminRoute);
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushNamed(
                                        context, AppRoute.homeRoute);
                                  }
                                }
                        },
      
      
      
                      //                       onPressed: () async {
                      //   if (_formKey.currentState!.validate()) {
                      //     await ref
                      //         .read(authViewModelProvider.notifier)
                      //         .loginStudent(
                      //           context,
                      //           _emailController.text,
                      //           _passwordController.text,
                      //         );
      
                      //     // Check if the login is successful and the user is an admin
                      //     final authViewModel = ref.read(authViewModelProvider);
                      //     if (authViewModel.isLoggedIn && authViewModel.isAdmin) {
                      //       // Navigate to the admin homepage
                      //       Navigator.pushNamed(context, AppRoute.ad);
                      //     } else {
                      //       // Show a snackbar for unsuccessful admin login
                      //       showSnackBar(
                      //         message: 'Invalid credentials or not an admin',
                      //         context: context,
                      //         color: Colors.red,
                      //       );
                      //     }
                      //   }
                      // },
                        style: ElevatedButton.styleFrom(
                            // minimumSize: const Size(double.infinity, 45)
                            minimumSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?,",
                            style: TextStyle(fontSize: 17),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoute.registerRoute,
                                );
                              },
                              child: const Text(
                                "Signup",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}






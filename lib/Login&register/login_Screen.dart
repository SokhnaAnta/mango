import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Home.dart';
import 'Fade_Animation.dart';
import 'Forgot_Password_Screen.dart';
import 'signUp_Screen.dart';

enum FormData {
  Email,
  password,
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color enabled = const Color.fromARGB(255, 255, 216, 59);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);
  bool ispasswordev = true;
  FormData? selected;
  int selectedIndex = 1;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.yellow.shade800,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            height: 150,
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Text("Febaru Mango yi",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(width: 50),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(.1)),
                child: const IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: _fall,
                  color: Colors.white,
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            decoration: const BoxDecoration(
              //color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.contain,
                // colorFilter: ColorFilter.mode(
                //   HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage(
                  "assets/images/mango_.jpg",
                ),
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 5,
                      color: const Color.fromARGB(255, 238, 250, 171)
                          .withOpacity(0.4),
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.all(40.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FadeAnimation(
                              delay: 0.8,
                              child: Image.asset(
                                "assets/images/mango.jpg",
                                width: 100,
                                height: 100,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const FadeAnimation(
                              delay: 1,
                              child: Text(
                                "Connectez vous",
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 0.5),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: selected == FormData.Email
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: emailController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.Email;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Email
                                            ? enabledtxt
                                            : deaible,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : deaible,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: selected == FormData.password
                                        ? enabled
                                        : backgroundColor),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: passwordController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.password;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: selected == FormData.password
                                            ? enabledtxt
                                            : deaible,
                                        size: 20,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: ispasswordev
                                            ? Icon(
                                                Icons.visibility_off,
                                                color: selected ==
                                                        FormData.password
                                                    ? enabledtxt
                                                    : deaible,
                                                size: 20,
                                              )
                                            : Icon(
                                                Icons.visibility,
                                                color: selected ==
                                                        FormData.password
                                                    ? enabledtxt
                                                    : deaible,
                                                size: 20,
                                              ),
                                        onPressed: () => setState(
                                            () => ispasswordev = !ispasswordev),
                                      ),
                                      hintText: 'Mot de passe',
                                      hintStyle: TextStyle(
                                          color: selected == FormData.password
                                              ? enabledtxt
                                              : deaible,
                                          fontSize: 12)),
                                  obscureText: ispasswordev,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.password
                                          ? enabledtxt
                                          : deaible,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: TextButton(
                                  onPressed: () {
                                    // Navigator.pop(context);
                                    // Navigator.of(context)
                                    //     .push(MaterialPageRoute(builder: (context) {
                                    //   return MyApp(isLogin: true);
                                    // }));
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 204, 38),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14.0, horizontal: 80),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0))),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 0.5,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //End of Center Card
                    //Start of outer card
                    const SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: GestureDetector(
                        onTap: (() {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ForgotPasswordScreen();
                          }));
                        }),
                        child: Text("Mot de passe oublié?",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.9),
                                letterSpacing: 0.5,
                                fontSize: 20)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeAnimation(
                      delay: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const SignupScreen();
                              }));
                            },
                            child: Text("INSCRIPTION",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.9),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1)
        ]),
        child: FloatingActionButton(
          backgroundColor: Colors.yellow.shade800,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
          child: const Icon(
            CupertinoIcons.camera,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
              if (selectedIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }
            });
          },
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 255, 216, 59),
                icon: Icon(CupertinoIcons.home),
                label: "weather"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled), label: "weather")
          ]),
    );
  }
}

_fall() {}

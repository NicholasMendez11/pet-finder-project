import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import './home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = true;
  bool validInput = false;

  final myEmailController = TextEditingController();
  final myPassCodeController = TextEditingController();

//Setting listeners
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myEmailController.addListener(validateInputs);
    myPassCodeController.addListener(validateInputs);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myEmailController.dispose();
    myPassCodeController.dispose();
    super.dispose();
  }

  void validateInputs() {
    setState(() {
      if (EmailValidator.validate(myEmailController.text) &&
          (myPassCodeController.text).length > 6) {
        validInput = true;
      } else {
        validInput = false;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 140, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Image.asset(
                  "images/branding.png",
                ),
              ),
              const SizedBox(height: 60),
              TextField(
                controller: myEmailController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Username',
                  suffixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: myPassCodeController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(showPassword
                          ? Icons.lock_outline
                          : Icons.lock_open_outlined)),
                ),
                obscureText: showPassword,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text("Cancel",
                          style: TextStyle(color: Color(0xFF147EFF)))),
                  IgnorePointer(
                    ignoring: validInput ? false : true,
                    child: ElevatedButton(
                        onPressed: NavigateToSecond,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: validInput
                                ? const Color(0xFF147EFF)
                                : Colors.grey),
                        child: const Text("Next")),
                  )
                ],
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () {},
                      child: const Text("Don't have an account yet?"),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  void NavigateToSecond() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
  }
}

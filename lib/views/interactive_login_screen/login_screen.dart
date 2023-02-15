import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mailController = TextEditingController();

  final passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();

  var animationLink = 'assets/loginScreen.riv';
  late SMITrigger failTriger, successTriger;
  late SMIBool lookBool, passBool;
  Artboard? artboard;
  late StateMachineController stateMachineController;

  @override
  void initState() {
    super.initState();
    initArtBoard();
  }

  initArtBoard() {
    rootBundle.load(animationLink).then(
      (data) async {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        final stateMachineController = StateMachineController.fromArtboard(
          art,
          'login',
        )!;
        art.addController(stateMachineController);
        setState(() {
          artboard = art;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (artboard != null)
            SizedBox(
                width: 400,
                height: 350,
                child: Rive(
                  artboard: artboard!,
                )),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (val) {
              if (val!.isEmpty) {
                return 'email is required';
              }
              if (!val.contains('@')) {
                return 'please provide valid email address';
              }
              return null;
            },
            controller: mailController,
            decoration: const InputDecoration(hintText: 'email'),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            validator: (val) {
              if (val!.isEmpty) {
                return 'password is required';
              }
              if (val.length > 20) {
                return 'maximum password length is 20';
              }
              return null;
            },
            obscureText: true,
            decoration: const InputDecoration(hintText: 'password'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

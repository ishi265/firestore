import 'package:firestore/helpers/biometric_helper.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool showBiometrics = false;
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    isBiometricAvailble();
  }

  isBiometricAvailble() async {
    showBiometrics = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showBiometrics)
              ElevatedButton(
                  onPressed: () async {
                    isAuthenticated = await BiometricHelper().authenticate();
                    setState(() {});
                  },
                  child: const Text("Biometric login")),
            const SizedBox(
              height: 20,
            ),
            if (isAuthenticated) const Text("Well done authenticated")
          ],
        ),
      ),
    );
  }
}

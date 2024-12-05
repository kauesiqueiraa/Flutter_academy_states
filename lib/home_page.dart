import 'package:flutter/material.dart';
import 'package:flutter_default_state_manager/bloc_pattern/imc_bloc_pattern_page.dart';
import 'package:flutter_default_state_manager/change_notifier/imc_change_notifier_page.dart';
import 'package:flutter_default_state_manager/setState/imc_setstate_page.dart';
import 'package:flutter_default_state_manager/value_notifier/imc_value_notifier_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({ super.key });

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
    ));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
              onPressed: () => _goToPage(context, const ImcSetstatePage()),
              child: const Text("SetState")
            ),
            ElevatedButton(
              onPressed: () => _goToPage(context, const ImcValueNotifierPage()), 
              child: const Text("ValueNotifier")
            ),
            ElevatedButton(
              onPressed: () => _goToPage(context, const ImcChangeNotifierPage()), 
              child: const Text("ChangeNotifier")
            ),
            ElevatedButton(
              onPressed: () => _goToPage(context, const ImcBlocPatternPage()),
              child: const Text("Bloc Pattern (Streams)")
            ),
          ],
        ),
      ),
    );
  }
}
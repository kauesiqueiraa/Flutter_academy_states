import 'package:flutter/material.dart';
import 'package:flutter_default_state_manager/setState/imc_setstate_page.dart';

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
              child: Text("SetState")
            ),
            ElevatedButton(
              onPressed: () {}, 
              child: Text("ValueNotifier")
            ),
            ElevatedButton(
              onPressed: () {}, 
              child: Text("ChangeNotifier")
            ),
            ElevatedButton(
              onPressed: () {}, 
              child: Text("Bloc Pattern (Streams)")
            ),
          ],
        ),
      ),
    );
  }
}
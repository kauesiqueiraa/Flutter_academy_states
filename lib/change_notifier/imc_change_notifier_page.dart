import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_default_state_manager/change_notifier/imc_change_notifier_controller.dart';
import 'package:flutter_default_state_manager/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';

class ImcChangeNotifierPage extends StatefulWidget {
const ImcChangeNotifierPage({ super.key });

  @override
  State<ImcChangeNotifierPage> createState() => _ImcChangeNotifierPageState();
}

class _ImcChangeNotifierPageState extends State<ImcChangeNotifierPage> {
  final controller = ImcChangeNotifierController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    print('BUILD TELA');
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Change Notifier'),
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    print('AnimationBuilder');
                    return ImcGauge(imc: controller.imc);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Peso"),
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      locale: 'pt_BR',
                      symbol: '' ,
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    )
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Peso é obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: alturaEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Altura"),
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      locale: 'pt_BR',
                      symbol: '' ,
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    )
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Altura é obrigatório';
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    var formValid = formKey.currentState?.validate() ?? false;

                    if (formValid) {
                      var formatter = NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);
                      double peso = formatter.parse(pesoEC.text) as double;
                      double altura = formatter.parse(alturaEC.text) as double;

                      // _calcularImc(peso: peso, altura: altura);
                      controller.calcularIMC(peso: peso, altura: altura);
                    }
                  }, 
                  child: const Text("Calcular IMC")
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
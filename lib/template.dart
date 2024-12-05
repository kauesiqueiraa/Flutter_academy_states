import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter_default_state_manager/widgets/imc_gauge.dart';

class Template extends StatefulWidget {
const Template({ super.key });

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();


  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC SetState'),
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ImcGauge(imc: 0),
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
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {}, 
                child: const Text("Calcular IMC")
              ),
            ],
          ),
        ),
      )
    );
  }
}
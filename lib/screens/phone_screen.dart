import 'package:app2/models/phone_model.dart';
import 'package:app2/services/mongo_service.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  List<PhoneModel> phones = [];

@override
void initState(){
  super.initState();
  _fecthPhones();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario de telefonos'),
      ),
      body: ListView.builder(itemBuilder: itemBuilder),
    );
  }

  void _fecthPhones() async {
    phones = await MongoService().getPhones();
  }
}
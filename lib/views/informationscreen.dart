import 'package:api_binding/model/usermodel.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  final   Address address;

final  String name;
   InfoScreen({super.key,  required this.name, required this.address,}
  );

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Row(
            children: [
              const Text('Street :'),
              const Spacer(),
              Text(widget.address.street.toString()),
            ],
          ),
          Row(
            children: [
              const Text('city :'),
              Spacer(),
              Text(widget.name),
              
            ],
          ),
          ]
        ),
      ),
    ));
  }
}

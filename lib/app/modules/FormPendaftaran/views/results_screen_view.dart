import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ResultsScreenView extends GetView {
  const ResultsScreenView({
    super.key,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.phone,
  });

  final String name;
  final String gender;
  final DateTime dateOfBirth;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Pendaftaran'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Nama"),
                subtitle: Text(name),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.wc),
                title: const Text("Jenis Kelamin"),
                subtitle: Text(gender),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text("Tanggal Lahir"),
                subtitle: Text(DateFormat('dd-MM-yyyy').format(dateOfBirth)),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("No. Telepon"),
                subtitle: Text(phone),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

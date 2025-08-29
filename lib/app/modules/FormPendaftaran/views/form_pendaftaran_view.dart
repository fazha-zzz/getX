import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_pendaftaran_controller.dart';
import 'package:intl/intl.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
   FormPendaftaranView({
    super.key,
    
  });
  final FormPendaftaranController controller = Get.put(FormPendaftaranController());
  @override
  Widget build(BuildContext context) {
    final FormPendaftaranController controller = Get.put(
      FormPendaftaranController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormPendaftaranView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'nama lengkap',
                    errorText: controller.nameError.value.isNotEmpty
                        ? controller.nameError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty
                      ? null
                      : controller.gender.value,
                  hint: Text('pilih jenis kelamin'),
                  items: ['laki laki', 'perempuan', 'lgbt']
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.gender.value = value ?? '';
                  },
                  decoration: InputDecoration(
                    labelText: 'jenis Kelamin',
                    errorText: controller.genderError.value.isNotEmpty
                        ? controller.genderError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => ListTile(
                  title: Text(
                    controller.dateOfBirth.value == null
                        ? 'pilih tanggal lahir'
                        : DateFormat(
                            'dd-MM-yyyy',
                          ).format(controller.dateOfBirth.value!),
                  ),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      controller.dateOfBirth.value = selectedDate;
                      controller.validatedateOfBirth(
                        tanggalLahir: selectedDate,
                      );
                    }
                  },
                  subtitle: controller.dateOfBirthError.value.isNotEmpty
                      ? Text(
                          controller.dateOfBirthError.value,
                          style: TextStyle(color: Colors.red),
                        )
                      : null,
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.phone.value = value;
                    controller.validatephone(phone: value);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'nomor telepon',
                    errorText: controller.phoneError.value.isNotEmpty
                        ? controller.nameError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.submitFrom();
                },
                child: Text('submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

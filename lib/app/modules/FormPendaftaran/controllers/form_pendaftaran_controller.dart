import 'package:get/get.dart';
import 'package:latihan_getx/app/modules/FormPendaftaran/views/results_screen_view.dart';

class FormPendaftaranController extends GetxController {
  //TODO: Implement FormPendaftaranController
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateOfBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateOfBirthError = ''.obs;
  RxString phoneError = ''.obs;

  void validateName({required String name}) {
    if (name.length < 3) {
      nameError.value = 'nama minimal 3 karakter';
    } else {
      nameError.value = '';
    }
  }

  void validateGender({required String gender}) {
    if (gender == null || gender.isEmpty) {
      genderError.value = 'pilih jenis kelamin';
    } else {
      genderError.value = '';
    }
  }

  void validatedateOfBirth({required DateTime? tanggalLahir}) {
    if (tanggalLahir == null) {
      dateOfBirthError.value = 'pilih tanggal lahir';
    } else {
      final now = DateTime.now();
      final age = now.year - tanggalLahir.year;
      if (age < 2) {
        dateOfBirthError.value = 'umur minimal dua tahun';
      } else {
        dateOfBirthError.value = '';
      }
    }
  }

  void validatephone({required String phone}) {
    if (!GetUtils.isPhoneNumber(phone)) {
      phoneError.value = 'nomor telepon tidak valid';
    } else {
      phoneError.value = '';
    }
  }

  void submitFrom() {
    validateName(name: name.value);
    validateGender(gender: gender.value);
    validatedateOfBirth(tanggalLahir: dateOfBirth.value);
    validatephone(phone: phone.value);

    if (nameError.value.isEmpty &&
        genderError.value.isEmpty &&
        dateOfBirthError.value.isEmpty &&
        phoneError.value.isEmpty) {
      //get create view:Resultscreen on FromPendaftaran
      Get.to(() => ResultsScreenView(
        name: name.value,
        gender: gender.value,
        dateOfBirth: dateOfBirth.value!,
        phone: phone.value,

      )
      
      );
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

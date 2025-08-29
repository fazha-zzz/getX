import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/app/modules/alqulan/views/surat_detail_view_view.dart';
import '../controllers/alqulan_controller.dart';

class AlqulanView extends GetView<AlqulanController> {
  const AlqulanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Al-Qur\'an')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchAlqulan,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final surahList = controller.alqulan;
        if (surahList.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }

        return ListView.separated(
          itemCount: surahList.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (ctx, i) {
            final surah = surahList[i];
            return ListTile(

              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Column(
                  children: [
                Text(
                  "${surah.nomor}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
          
                ]
              ),
             ),
              title: Text("${surah.nama} (${surah.asma})"),
              subtitle: Text(
                "Arti: ${surah.arti}\ Jumlah ayat: ${surah.ayat} \ ${surah.type}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Get.to(() => SuratDetailViewView(alqulan: surah)),
            );
          },
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:latihan_getx/app/data/models/qulan.dart';

class SuratDetailViewView extends StatelessWidget {
  final QulanModel alqulan;

  const SuratDetailViewView({Key? key, required this.alqulan})
    : super(key: key);

  Widget buildRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? '-' : value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Surat ${alqulan.nama ?? ''}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Gambar placeholder
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/id/${(alqulan.nomor != null ? int.tryParse(alqulan.nomor!) ?? 1 : 1) % 1000}/400/250',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Nama & Asma
            Center(
              child: Text(
                "${alqulan.nama ?? ''} (${alqulan.asma ?? ''})",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),

            // Semua field
            buildRow(context, "Arti", alqulan.arti ?? ""),
            buildRow(context, "Jumlah Ayat", "${alqulan.ayat ?? '-'}"),
            buildRow(context, "Tipe", alqulan.type?.displayName ?? ""),
            buildRow(context, "Urut", alqulan.urut ?? ""),
            buildRow(context, "Nomor", alqulan.nomor ?? ""),
            buildRow(context, "Rukuk", alqulan.rukuk ?? ""),
            buildRow(context, "Keterangan", alqulan.keterangan ?? ""),
            buildRow(context, "Audio", alqulan.audio ?? ""),
          ],
        ),
      ),
    );
  }
}

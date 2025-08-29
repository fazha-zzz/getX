import 'package:flutter/material.dart';
import 'package:latihan_getx/app/data/models/posts.dart';

class PostsDetailView extends StatelessWidget {
  final DataPost dataPost;

  const PostsDetailView({Key? key, required this.dataPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Post #${dataPost.id ?? ''}")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Foto
            if (dataPost.foto != null && dataPost.foto!.isNotEmpty)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "http://127.0.0.1:8000/storage/${dataPost.foto}",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 80),
                  ),
                ),
              )
            else
              const Center(child: Icon(Icons.image_not_supported, size: 80)),

            const SizedBox(height: 16),

            /// Judul
            Text(
              dataPost.title ?? "Tanpa Judul",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            /// Konten
            Text(
              dataPost.content ?? "Tidak ada konten",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),

            /// Slug & Status
            if (dataPost.slug != null)
              Text(
                "Slug: ${dataPost.slug}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
           if (dataPost.status != null)
              Text(
                "Status: ${dataPost.status ?? '0'}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            const SizedBox(height: 20),

            /// Created & Updated
            if (dataPost.createdAt != null)
              Text(
                "Dibuat: ${dataPost.createdAt}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            if (dataPost.updatedAt != null)
              Text(
                "Diupdate: ${dataPost.updatedAt}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }
}

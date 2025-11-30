import 'package:flutter/material.dart';

class DrawerPreviewResume extends StatefulWidget {
  const DrawerPreviewResume({super.key});

  @override
  State<DrawerPreviewResume> createState() => _DrawerPreviewResumeState();
}

class _DrawerPreviewResumeState extends State<DrawerPreviewResume> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + kToolbarHeight,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Drawer Phải", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 500),
                TextField(decoration: const InputDecoration(labelText: "Nhập gì đó")),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop("Trung");
                  },
                  child: const Text("Đóng & trả 'Trung'"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

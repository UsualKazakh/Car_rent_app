import 'package:flutter/material.dart';
import '../providers/app_text_provider.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.watch<AppTextProvider>().texts.adminPanel)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: null,
              child: Text(context.watch<AppTextProvider>().texts.manageCars),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: null,
              child: Text(context.watch<AppTextProvider>().texts.manageBookings),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: null,
              child: Text(context.watch<AppTextProvider>().texts.manageProfiles),
            ),
          ],
        ),
      ),
    );
  }
}

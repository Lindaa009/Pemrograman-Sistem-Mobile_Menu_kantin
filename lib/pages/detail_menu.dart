import 'package:flutter/material.dart';
import 'package:kantinmenu/app_colors.dart';
import 'package:kantinmenu/models/item_menu.dart';
import 'package:kantinmenu/widgets/kantin_text.dart';

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({required this.menu, super.key});

  final MenuItem menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kantinPink,
        foregroundColor: kantinGreen,
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const KantinText(
          'Detail Menu',
          color: kantinGreen,
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Center(
                  child: Icon(Icons.local_drink, size: 132, color: kantinGreen),
                ),
              ),
              const SizedBox(height: 20),
              KantinText(
                menu.name,
                size: 25,
                color: kantinGreen,
                weight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 8),
              KantinText(
                'Rp ${menu.price}',
                size: 20,
                color: kantinGreen,
                weight: FontWeight.w700,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

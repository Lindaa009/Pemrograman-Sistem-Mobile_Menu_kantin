import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kantinmenu/app_colors.dart';
import 'package:kantinmenu/models/item_menu.dart';
import 'package:kantinmenu/pages/tambah_menu.dart';
import 'package:kantinmenu/pages/detail_menu.dart';
import 'package:kantinmenu/widgets/kantin_text.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});
  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  final List<MenuItem> _menus = [
    const MenuItem(name: 'Matcha Cream', price: 35000),
    const MenuItem(name: 'Matcha Latte', price: 18000),
    const MenuItem(name: 'Matcha Lemon', price: 20000),
    const MenuItem(name: 'Matcha Ice Cream', price: 36000),
    const MenuItem(name: 'Matcha Frappe', price: 56000),
    const MenuItem(name: 'Matcha Float', price: 15000),
    const MenuItem(name: 'Matcha Tea', price: 6000),
  ];

  Future<void> _openAddMenu() async {
    final MenuItem? newMenu = await Get.to<MenuItem>(() => const AddMenuPage());

    if (!mounted || newMenu == null) {
      return;
    }

    setState(() {
      _menus.add(newMenu);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: kantinPink,
        foregroundColor: kantinGreen,
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const KantinText(
          'Kedai Matcha',
          size: 50,
          color: kantinGreen,
          weight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: const KantinText(
              'Satu Kedai, Sejuta Cerita Hijau: Menghadirkan Harmoni Rasa Matcha Autentik di Setiap Sudut',
              size: 18,
              color: kantinGreen,
              weight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              itemCount: _menus.length,
              itemBuilder: (context, index) {
                final MenuItem menu = _menus[index];
                return Card(
                  color: const Color.fromARGB(255, 247, 244, 244),
                  child: ListTile(
                    leading: const Icon(
                      Icons.local_drink,
                      color: kantinGreen,
                      size: 30,
                    ),
                    title: KantinText(menu.name, weight: FontWeight.w700),
                    subtitle: KantinText('Rp ${menu.price}'),
                    trailing: const Icon(
                      Icons.arrow_forward_rounded,
                      color: kantinGreen,
                    ),
                    onTap: () {
                      Get.to<void>(() => MenuDetailPage(menu: menu));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}

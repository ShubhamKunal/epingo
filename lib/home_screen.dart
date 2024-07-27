import 'package:epingo/auth/provider/auth_provider.dart';
import 'package:epingo/product/ui/product_grid.dart';
import 'package:epingo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0C54BE),
        title: const CustomText(text: "e-Shop", size: 22, color: "#FFFFFF"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              authProvider.signOut(context);
            },
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const ProductGrid(),
      ),

      // Container(
      //   padding: const EdgeInsets.all(12),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         CustomText(text: 'Hello $displayName', size: 18, color: ""),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

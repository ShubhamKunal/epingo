import 'package:epingo/product/model/product.dart';
import 'package:epingo/product/ui/product_tile.dart';
import 'package:epingo/remote_config/remote_service.dart';
import 'package:epingo/utils/useful_functions.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  ProductGridState createState() => ProductGridState();
}

class ProductGridState extends State<ProductGrid> {
  late Future<List<Product>> _productsFuture;
  String apiUrl = "https://dummyjson.com/products";
  final RemoteConfigService _remoteConfigService = RemoteConfigService();

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts(apiUrl);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _remoteConfigService.initialize(),
      builder: (context, snapshot) {
        return FutureBuilder<List<Product>>(
          future: _productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No products found'));
            } else {
              log("CONFIG: ${_remoteConfigService.showDiscountedPrice} ");
              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return ProductTile(
                    product: product,
                    showDiscountedPrice:
                        _remoteConfigService.showDiscountedPrice,
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}

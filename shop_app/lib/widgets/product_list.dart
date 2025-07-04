import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/pages/product_details_page.dart';
import 'package:shop_app/widgets/products_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shoes \nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      backgroundColor:
                          selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromRGBO(245, 247, 249, 1),
                      label: Text(filter),
                      labelStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: LayoutBuilder(builder: (context,Constraints){
              if(Constraints.maxWidth > 650){
                return GridView.builder(
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2, 
                            ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetailsPage(product: product);
                                  },
                                ),
                              );
                            },
                            child: ProductCard(
                              title: product['title'] as String,
                              price: product['price'] as double,
                              image: product['imageUrl'] as String,
                              backgroundColor:
                                  index.isEven
                                      ? const Color.fromRGBO(216, 240, 253, 1)
                                      : const Color.fromRGBO(245, 247, 249, 1),
                            ),
                          );
                        },
                      );
              }else{
                return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetailsPage(product: product);
                                  },
                                ),
                              );
                            },
                            child: ProductCard(
                              title: product['title'] as String,
                              price: product['price'] as double,
                              image: product['imageUrl'] as String,
                              backgroundColor:
                                  index.isEven
                                      ? const Color.fromRGBO(216, 240, 253, 1)
                                      : const Color.fromRGBO(245, 247, 249, 1),
                            ),
                          );
                        },
                      );
              }
            }),
          ),

          // Expanded(
          //   child:
          //       size.width > 550
          //           ?GridView.builder(
          //             itemCount: products.length,
          //             gridDelegate:
          //                 const SliverGridDelegateWithFixedCrossAxisCount(
          //                   crossAxisCount: 2,
          //                   childAspectRatio: 2, 
          //                 ),
          //             itemBuilder: (context, index) {
          //               final product = products[index];
          //               return GestureDetector(
          //                 onTap: () {
          //                   Navigator.of(context).push(
          //                     MaterialPageRoute(
          //                       builder: (context) {
          //                         return ProductDetailsPage(product: product);
          //                       },
          //                     ),
          //                   );
          //                 },
          //                 child: ProductCard(
          //                   title: product['title'] as String,
          //                   price: product['price'] as double,
          //                   image: product['imageUrl'] as String,
          //                   backgroundColor:
          //                       index.isEven
          //                           ? const Color.fromRGBO(216, 240, 253, 1)
          //                           : const Color.fromRGBO(245, 247, 249, 1),
          //                 ),
          //               );
          //             },
          //           )
          //            :ListView.builder(
          //             itemCount: products.length,
          //             itemBuilder: (context, index) {
          //               final product = products[index];
          //               return GestureDetector(
          //                 onTap: () {
          //                   Navigator.of(context).push(
          //                     MaterialPageRoute(
          //                       builder: (context) {
          //                         return ProductDetailsPage(product: product);
          //                       },
          //                     ),
          //                   );
          //                 },
          //                 child: ProductCard(
          //                   title: product['title'] as String,
          //                   price: product['price'] as double,
          //                   image: product['imageUrl'] as String,
          //                   backgroundColor:
          //                       index.isEven
          //                           ? const Color.fromRGBO(216, 240, 253, 1)
          //                           : const Color.fromRGBO(245, 247, 249, 1),
          //                 ),
          //               );
          //             },
          //           )
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tienda_ropa/src/Widgets/flayers.dart';
import 'package:tienda_ropa/src/services/api_services.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices().bestSeller(),
      builder: (context, AsyncSnapshot snap) {
        if (snap.hasData) {
          final bSList = List<Map<String, dynamic>>.from(snap.data["products"]);
          return Flayers(
            title: "Lo más Vendido",
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: bSList.length,
              itemBuilder: (context, i) {
                return SizedBox(
                  child: Image.network(bSList[i]["thumbnail"]),
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

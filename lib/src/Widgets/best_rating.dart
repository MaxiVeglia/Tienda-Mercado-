import 'package:flutter/material.dart';
import 'package:tienda_ropa/src/Widgets/flayers.dart';
import 'package:tienda_ropa/src/services/api_services.dart';

class BestRating extends StatelessWidget {
  const BestRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices().bestRating(),
      builder: (context, AsyncSnapshot snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snap.hasError) {
          return Center(child: Text('Error: ${snap.error}'));
        } else if (snap.hasData) {
          List bRList = snap.data["products"] as List;
          bRList = bRList.where((e) => e["rating"] >= 4.7).toList();

          return Flayers(
            title: "Mejor Calificado",
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bRList.length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(bRList[i]["thumbnail"]),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            color: Colors.black,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              "⭐ ${bRList[i]["rating"].toString()}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(bRList[i]["description"]),
                      ),
                    ),
                  ],
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

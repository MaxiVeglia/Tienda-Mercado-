import "package:flutter/material.dart";
import "package:tienda_ropa/src/services/api_services.dart";

class PromoBanner extends StatefulWidget {
  const PromoBanner({Key? key}) : super(key: key);

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiServices().productsBanner(),
        builder: (context, AsyncSnapshot snap) {
          if (snap.hasData) {
            final prodList = snap.data["products"] as List;
            return SizedBox(
              height: 270.0,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                padEnds: false,
                itemCount: prodList.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  snap.data["products"][i]["thumbnail"]))),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

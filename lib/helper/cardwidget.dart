import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CardGrid extends StatelessWidget {
  final String title;
  final String rating;
  final String logo;
  final Function()? onPress;

  CardGrid(
      {required this.title,
      required this.rating,
      required this.logo,
      this.onPress});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  logo,
                ),
                fit: BoxFit.cover),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1.5, -1.5),
                            color: Colors.black),
                        Shadow(
                            // bottomRight
                            offset: Offset(1.5, -1.5),
                            color: Colors.black),
                        Shadow(
                            // topRight
                            offset: Offset(1.5, 1.5),
                            color: Colors.black),
                        Shadow(
                            // topLeft
                            offset: Offset(-1.5, 1.5),
                            color: Colors.black),
                      ]),
                ),
              ),
              Container(
                height: 40,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        const Icon(LineIcons.star),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          rating,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

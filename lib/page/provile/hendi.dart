import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileHendiGunawan extends StatelessWidget {
  const ProfileHendiGunawan({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xfffdc2430), Color(0xfff7b4397)])),
                child: Container(
                  width: double.infinity,
                  height: 350.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://lh3.googleusercontent.com/pw/AJFCJaUuZys9H6_SeMzdjhoVQEiU0U9xIV4xXw0K1Ov0lGiEA9H4S9Gn_fRjlH-n9_zHL4-YVh317iKkpuiK0Y0AlcAWdych4izxMRPCOamoGqI3r87FBZz7xgQm4yzQhyIb3ov93Xl7hnKcpHbWwSQOKYnM66zXVkYdaEfEbE1l9ftQxgTYKABPejCGQoZKAxlBwA_qPwQESgOKjYXzQ7iXYHR8YjuyaFLOc6zE8BzyPZOdR2yWr-ZbBfMaJEOIgN8yrcDGsCt3BlfaHhwB7ERrlaI_xu1MAId0brGC4KCY7uUc3SHB4oJS3Ijd6KPWDvjeedfLfdgL76d_lHxS3NYYxhZ7shXgnsf9zJVbApUOxsSoX0HBjDhC8mtP4tk8cOpEdrCOuv7Fm_WD86NBlituVb6Fczwvmvwh_-xfv5RHU0iOU9Va0_v_G4cwLUZsC2qDK04T0EwoLmCTWbZHQA9RVCpCM4wliuu-ZNxXKsRqLLyHYDjreIn6pRsfSFdNswwgBWg7HTnvqIqbsV4Qd0SPJeshhVlOR5OSPDsTLJZIc7B-XaVnN7bMYwTOcjWchMQqE_mMgUKAisqp7o-9P1QJ9O1EUYS5mLSlhgDyd_OuZBvEjgwuzZt4EofUeT646BwHUiULseBV4ixZvo69zGxKHdSuLSyVMSiHsXQpeIalP1u2u_dbmOP328pMb3ON1QY2mj_2Nz6E8stURuymWnWEn2Jtv78oT_ChNsx_Wgoo-iQK6wPC4RooqLPfhEjlRhOPNM4mghRLP03S3mwgJlJWG776wtJZqUdgnT39xnlHM5ezBGihx9oF5Uj7x03t0QUrWaScHOVuNcDBwXpGEczC0R3k6FIaJCDLOy3oJrO6u78upf1xdB73eLuFbh3JnlDaO_FNuczi0bKAqlzWIIo61w=w442-h663-s-no?authuser=0',
                          ),
                          radius: 70.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "M Hendi Gunawan",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "hendigunawan233456@gmail.com",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 22.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      child: const Icon(
                                        LineIcons.github,
                                        size: 50,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    onTap: () async {
                                      final Uri url = Uri.parse(
                                          'https://github.com/hendigunawan');
                                      if (!await launchUrl(url)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      child: const Icon(
                                        LineIcons.at,
                                        size: 50,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    onTap: () async {
                                      final url = Uri(
                                        scheme: 'mailto',
                                        path: 'hendigunawan233456@gmail.com',
                                      );
                                      if (await canLaunchUrl(url)) {
                                        launchUrl(url);
                                      } else {
                                        // ignore: avoid_print
                                        print("Can't launch $url");
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      child: const Icon(
                                        LineIcons.phone,
                                        size: 50,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    onTap: () async {
                                      final Uri url =
                                          Uri.parse('tel:+62 82119269808');
                                      if (!await launchUrl(url)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      child: const Icon(
                                        LineIcons.linkedin,
                                        size: 50,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    onTap: () async {
                                      final Uri url = Uri.parse(
                                          'https://www.linkedin.com/in/hendi-gunawan-a8b4b3216/');
                                      if (!await launchUrl(url)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

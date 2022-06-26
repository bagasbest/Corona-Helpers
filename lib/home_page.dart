import 'package:corona_helpers/feature_healthy.dart';
import 'package:corona_helpers/feature_zone.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxHeight(120.0),
            const Center(
              child: Text(
                'Statistik Kasus Indonesia',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            sizedBoxHeight(20.0),
            covidInfo('Sembuh', '5.836.310', Colors.green),
            sizedBoxHeight(10.0),
            covidInfo('Terkonfirmasi', '6.041.269', Colors.yellow[300]!),
            sizedBoxHeight(10.0),
            covidInfo('Dalam Perawatan', '49.022', Colors.redAccent[100]!),
            sizedBoxHeight(10.0),
            covidInfo('Meninggal', '155.937', Colors.red),
            sizedBoxHeight(50.0),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: Color(0xffE1EBF1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    left: 30,
                  ),
                  child: Text(
                    'Apa yang kamu butuhkan ?',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      menu('assets/images/chat.png', 'Notifikasi'),
                      InkWell(
                        child: menu('assets/images/sytringe.png', 'Kesehatan'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeatureHealthy()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 270),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(child: menu('assets/images/chart.png', 'Zona Corona'),onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeatureZone()),
                        );
                      }, ),
                      menu('assets/images/shield.png', 'Pencegahan'),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget covidInfo(String parameter, String totalCount, Color colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            parameter,
            style: const TextStyle(
              fontFamily: 'Nunito',
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Text(
                totalCount,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: colors,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menu(String assetImage, String menuTitle) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                assetImage,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              sizedBoxHeight(16.0),
              Text(
                menuTitle,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sizedBoxHeight(double height) {
    return SizedBox(height: height);
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const ArabaApp());
}

class ArabaApp extends StatelessWidget {
  const ArabaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Araba Uygulaması',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  AnaSayfa({super.key});

  final Map<String, List<Map<String, String>>> arabaListesi = {
    'Sedan': [
      {
        'model': 'Toyota Corolla',
        'fiyat': '1.600.000 TL',
        'resim': 'https://resim.epey.com/409706/m_2020-toyota-corolla-1-8-hybrid-122-ps-e-cvt-dream-5.jpg',
        'motor': '1.8L',
        'beygir': '160 HP',
        'yakit': 'Hibrit',
      },
      {
        'model': 'Fiat Egea',
        'fiyat': '1.100.000 TL',
        'resim': 'https://resim.epey.com/70397/m_2017-fiat-egea-hb-1-6-mjet-120-hp-dct-urban-plus-2.jpg',
        'motor': '1.6L',
        'beygir': '130 HP',
        'yakit': 'Dizel',
      },
      {
        'model': 'Volkswagen Passat',
        'fiyat': '1.800.000 TL',
        'resim': 'https://resim.epey.com/71034/m_2017-volkswagen-passat-2-0-tdi-scr-bmt-240-ps-4m-dsg-highline-4x4-1.jpg',
        'motor': '2.0L',
        'beygir': '240 HP',
        'yakit': 'Dizel',
      },
    ],
    'SUV': [
      {
        'model': 'Kia Sportage',
        'fiyat': '1.500.000 TL',
        'resim': 'https://resim.epey.com/2656/m_kia-sportage-20l-dizel-184-ps-otomatik-premium-21.jpg',
        'motor': '2.0L',
        'beygir': '184 HP',
        'yakit': 'Dizel',
      },
      {
        'model': 'Chery Tiggo 8 Pro',
        'fiyat': '1.800.000 TL',
        'resim': 'https://resim.epey.com/935812/m_2024-chery-tiggo8-pro-1-6-183-hp-dct-avantgarde-4x2-3.jpg',
        'motor': '1.6L',
        'beygir': '183 HP',
        'yakit': 'Benzin',
      },
      {
        'model': 'Nissan Qashqai',
        'fiyat': '1.350.000 TL',
        'resim': 'https://resim.epey.com/3921/m_2015-nissan-qashqai-1-6-dci-130-bg-platinum-premium-pack-all-mode-4x4-1.jpg',
        'motor': '1.6L',
        'beygir': '130 HP',
        'yakit': 'Dizel',
      },
    ],
    'Ticari': [
      {
        'model': 'Ford Transit',
        'fiyat': '1.200.000 TL',
        'resim': 'https://resim.epey.com/91211/m_2017-ford-transit-custom-kombi-310s-2-2-tdci-155-ps-trend-5plus1-2.png',
        'motor': '2.0L',
        'beygir': '170 HP',
        'yakit': 'Dizel',
      },
       {
        'model': 'Volkswagen Caddy',
        'fiyat': '1.100.000 TL',
        'resim': 'https://resim.epey.com/77689/m_2017-volkswagen-caddy-2-0-tdi-scr-bmt-102-ps-dsg-comfortline-17.jpg',
        'motor': '2.0L',
        'beygir': '102 HP',
        'yakit': 'Dizel',
      },
       {
        'model': 'Fiat Doblo',
        'fiyat': '800.000 TL',
        'resim': 'https://resim.epey.com/26842/m_2015-fiat-doblo-panorama-1-6-multijet-105-hp-premio-plus-1.jpg',
        'motor': '1.3L',
        'beygir': '90 HP',
        'yakit': 'Dizel',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Araba Uygulaması'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: arabaListesi.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                    const Divider(),
                    ...entry.value.map((araba) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArabaDetaySayfasi(araba: araba),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: SizedBox(
                            height: 100,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      araba['resim']!,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, progress) {
                                        if (progress == null) return child;
                                        return const Center(
                                            child:
                                                CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        araba['model']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        araba['fiyat']!,
                                        style: const TextStyle(
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ArabaDetaySayfasi extends StatelessWidget {
  final Map<String, String> araba;

  const ArabaDetaySayfasi({super.key, required this.araba});

  Widget ozellikKutusu(IconData icon, String baslik, String deger) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
            )
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.indigo),
            const SizedBox(height: 6),
            Text(
              baslik,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              deger,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(araba['model']!),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  araba['resim']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              araba['model']!,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              araba['fiyat']!,
              style: const TextStyle(
                  fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),

           
            Row(
              children: [
                ozellikKutusu(Icons.settings, "Motor",
                    araba['motor'] ?? "-"),
                ozellikKutusu(Icons.speed, "HP",
                    araba['beygir'] ?? "-"),
                ozellikKutusu(Icons.local_gas_station, "Yakıt",
                    araba['yakit'] ?? "-"),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


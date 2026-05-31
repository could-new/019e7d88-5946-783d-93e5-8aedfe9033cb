import 'package:flutter/material.dart';

void main() {
  runApp(const WatrobaApp());
}

class WatrobaApp extends StatelessWidget {
  const WatrobaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zdrowa Wątroba (NAFLD)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[50],
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade700),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zdrowa Wątroba'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              Container(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                child: const TabBar(
                  isScrollable: true,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.green,
                  tabs: [
                    Tab(icon: Icon(Icons.info_outline), text: 'O NAFLD'),
                    Tab(icon: Icon(Icons.healing), text: 'Leczenie'),
                    Tab(icon: Icon(Icons.restaurant), text: 'Dieta'),
                    Tab(icon: Icon(Icons.local_florist), text: 'Zioła'),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    InfoTab(),
                    TreatmentTab(),
                    DietTab(),
                    HerbsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Niealkoholowe stłuszczenie wątroby (NAFLD)',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'NAFLD to stan, w którym w komórkach wątroby gromadzi się zbyt dużo tłuszczu, pomimo braku nadmiernego spożycia alkoholu. Jest to najczęstsza choroba wątroby na świecie, często powiązana z otyłością, insulinoopornością i zespołem metabolicznym.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              const Text(
                'Główne przyczyny:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              _buildBullet('Nadwaga i otyłość (szczególnie brzuszna)'),
              _buildBullet('Insulinooporność i cukrzyca typu 2'),
              _buildBullet('Wysoki poziom cholesterolu i trójglicerydów'),
              _buildBullet('Nieodpowiednia dieta (bogata w cukry proste, fruktozę i tłuszcze nasycone)'),
              _buildBullet('Brak aktywności fizycznej'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}

class TreatmentTab extends StatelessWidget {
  const TreatmentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jak wyleczyć NAFLD?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'Podstawą leczenia niealkoholowego stłuszczenia wątroby nie są leki, lecz zmiana stylu życia. Wątroba ma ogromne zdolności regeneracyjne, więc odwrócenie zmian jest możliwe.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('1. Redukcja masy ciała'),
              const Text('Stopniowa utrata wagi (ok. 0.5 - 1 kg tygodniowo) jest kluczowa. Utrata 7-10% masy ciała znacznie zmniejsza stłuszczenie i stan zapalny wątroby.'),
              const SizedBox(height: 12),
              _buildSectionTitle('2. Aktywność fizyczna'),
              const Text('Zaleca się minimum 150 minut umiarkowanej aktywności fizycznej w tygodniu (np. szybki marsz, jazda na rowerze, pływanie). Ćwiczenia pomagają spalać tłuszcz i poprawiają wrażliwość na insulinę.'),
              const SizedBox(height: 12),
              _buildSectionTitle('3. Kontrola chorób współistniejących'),
              const Text('Ważne jest uregulowanie poziomu cukru we krwi (przy cukrzycy), ciśnienia tętniczego oraz poziomu cholesterolu i trójglicerydów.'),
              const SizedBox(height: 12),
              _buildSectionTitle('4. Unikanie hepatotoksyn'),
              const Text('Całkowity zakaz spożywania alkoholu (nawet małe ilości obciążają chorą wątrobę). Należy również unikać niepotrzebnych leków i suplementów bez konsultacji z lekarzem.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}

class DietTab extends StatelessWidget {
  const DietTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dieta dla wątroby',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Najbardziej polecanym modelem żywienia w NAFLD jest dieta śródziemnomorska.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),
              _buildCategory('Zalecane produkty:', Colors.green.shade100, [
                'Warzywa (zwłaszcza zielone, liściaste)',
                'Owoce (w umiarkowanych ilościach, bogate w antyoksydanty np. jagody)',
                'Pełnoziarniste produkty zbożowe (brązowy ryż, kasza gryczana, pieczywo pełnoziarniste)',
                'Zdrowe tłuszcze (oliwa z oliwek, awokado, orzechy)',
                'Chude białko (ryby, drób, nasiona roślin strączkowych)',
                'Kawa (badania wykazują, że regularne picie kawy, czarnej bez cukru, chroni wątrobę)'
              ]),
              const SizedBox(height: 16),
              _buildCategory('Czego unikać:', Colors.red.shade100, [
                'Cukier i słodycze (szczególnie syrop glukozowo-fruktozowy - fruktoza jest metabolizowana głównie w wątrobie i łatwo zamienia się w tłuszcz)',
                'Słodzone napoje gazowane i soki owocowe',
                'Wysokoprzetworzona żywność (fast food, gotowe dania)',
                'Tłuszcze nasycone i trans (smalec, margaryny twarde, tłuste mięso)',
                'Białe pieczywo i oczyszczone zboża',
                'Alkohol'
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String title, Color bgColor, List<String> items) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          for (var item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text(item)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class HerbsTab extends StatelessWidget {
  const HerbsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Zioła na regenerację wątroby',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Fitosubstancje mogą wspaniale wspomagać proces leczenia, jednak pamiętaj, by skonsultować ich przyjmowanie z lekarzem, szczególnie jeśli przyjmujesz na stałe leki.',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 16),
          _buildHerbCard(
            context,
            'Ostropest plamisty',
            'Królowa ziół wątrobowych',
            'Zawiera sylimarynę, która chroni komórki wątroby przed uszkodzeniami, wspomaga ich regenerację, ma silne działanie antyoksydacyjne i przeciwzapalne. Można stosować w formie zmielonych ziaren (np. do jogurtu, sałatek) lub wyciągów (kapsułki/tabletki).',
          ),
          _buildHerbCard(
            context,
            'Karczoch zwyczajny',
            'Wsparcie trawienia i żółci',
            'Wyciąg z liści karczocha (cynaryna) pobudza produkcję i przepływ żółci, ułatwia trawienie tłuszczów, obniża poziom cholesterolu i trójglicerydów oraz chroni miąższ wątroby.',
          ),
          _buildHerbCard(
            context,
            'Mniszek lekarski',
            'Działanie oczyszczające',
            'Korzeń mniszka stymuluje wytwarzanie żółci, działa moczopędnie i oczyszczająco na organizm. Pomaga w usuwaniu toksyn odciążając wątrobę. Popularny w formie naparów.',
          ),
          _buildHerbCard(
            context,
            'Kurkuma (Ostryż długi)',
            'Silny przeciwutleniacz',
            'Kurkumina działa silnie przeciwzapalnie i antyoksydacyjnie. Zapobiega odkładaniu się tłuszczu w wątrobie i poprawia profile lipidowe. Najlepiej przyswaja się z odrobiną czarnego pieprzu i tłuszczu.',
          ),
          _buildHerbCard(
            context,
            'Zielona herbata',
            'Na metabolizm',
            'Bogata w katechiny (zwłaszcza EGCG), które wspomagają spalanie tłuszczu i zmniejszają stany zapalne w wątrobie. Pij 2-3 filiżanki dziennie (najlepiej bez cukru).',
          ),
        ],
      ),
    );
  }

  Widget _buildHerbCard(BuildContext context, String name, String subtitle, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ExpansionTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.green.shade700)),
        leading: const Icon(Icons.eco, color: Colors.green),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}

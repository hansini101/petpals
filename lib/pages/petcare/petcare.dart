import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'appointment.dart';
void main() {
  runApp(PetCareApp());
}

class PetCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PetCareScreen(),
    );
  }
}

class PetCareScreen extends StatefulWidget {
  @override
  _PetCareScreenState createState() => _PetCareScreenState();
}

class _PetCareScreenState extends State<PetCareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFD1B574),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white),
        title: Text("Pet Care", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            sectionHeader("Vaccinations", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            }),
            Row(
              children: [
                Flexible(child: vaccineCard("Rabies vaccination", "24th Jan 2022", "Dr. Minekshi")),
                SizedBox(width: 10),
                Flexible(child: vaccineCard("Calicivirus", "12th Feb 2022", "Dr. Kalhara")),
              ],
            ),
            SizedBox(height: 10),
            sectionHeader("Allergies", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            }),
            Row(
              children: [
                Flexible(child: allergyCard("Skin Allergies", "May be accompanied by gastrointestinal symptoms.", "Dr. Hasara")),
                SizedBox(width: 10),
                Flexible(child: allergyCard("Food Allergies", "Vomiting and diarrhea, or dermatologic signs.", "Dr. Samadhi")),
              ],
            ),
            SizedBox(height: 20),
            appointmentsSection(),
            SizedBox(height: 20),
            startButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
  selectedIndex: 1,
  onTabChange: (index) {
    
    print("Selected Tab: $index");
  },
),

    );
  }

  Widget sectionHeader(String title, GestureTapCallback? onSeeAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: onSeeAll,
            child: Row(
              children: [
                Text("See all", style: TextStyle(fontSize: 14, color: Colors.blue)),
                Icon(Icons.arrow_forward_ios, size: 14, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget vaccineCard(String title, String date, String doctor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(date, style: TextStyle(color: Colors.black54)),
          SizedBox(height: 4),
          Text(doctor, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget allergyCard(String title, String description, String doctor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(description, style: TextStyle(fontSize: 12, color: Colors.black54)),
          SizedBox(height: 4),
          Text(doctor, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget appointmentsSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Appointments", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            "When you schedule an appointment, you’ll see it here. Let’s set your first appointment.",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget startButton() {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppointmentPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFD1B574),
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text("Start", style: TextStyle(fontSize: 16, color: Colors.white)),
    ),
  );
}

  }


class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _showVaccinations = false;
  bool _showTreatments = false;
  List<Widget> additionalVaccinationCards = [];
  List<Widget> additionalTreatmentCards = [];

  void _toggleVaccinations() {
    setState(() {
      _showVaccinations = !_showVaccinations;
      if (_showVaccinations) {
        additionalVaccinationCards = [
          buildCard('Feline Leukemia', 'Fri 5 Mar', 'Dr. Samadhi'),
          buildCard('Distemper', 'Sat 6 Apr', 'Dr. Hirushi'),
          buildCard('Parvovirus', 'Mon 8 May', 'Dr. Rajitha'),
          buildCard('Bordetella', 'Wed 10 Jun', 'Dr. Kalpana'),
          buildCard('Feline Infectious Peritonitis', 'Sun 15 Jul', 'Dr. Kalpana'),
          buildCard('Leptospirosis', 'Fri 20 Aug', 'Dr. Nadeel'),
          buildCard('Corona Virus', 'Wed 12 Sep', 'Dr. Minekshi'),
        ];
      } else {
        additionalVaccinationCards = [];
      }
    });
  }

  void _toggleTreatments() {
    setState(() {
      _showTreatments = !_showTreatments;
      if (_showTreatments) {
        additionalTreatmentCards = [
          buildCard('Ear Infection', 'Fri 20 Aug', 'Dr. Hasara'),
          buildCard('Flea Treatment', 'Sat 30 Oct', 'Dr. Samadhi'),
          buildCard('Heartworm Treatment', 'Mon 25 Nov', 'Dr. Kalpana'),
          buildCard('Worming', 'Wed 5 Dec', 'Dr. Rajitha'),
          buildCard('Kennel Cough', 'Wed 15 May', 'Dr. Minekshi'),
          buildCard('Canine Cough', 'Wed 16 Jun', 'Dr. Nadeel'),
          buildCard('Lyme Disease Treatment', 'Mon 18 Jul', 'Dr. Hirushi'),
        ];
      } else {
        additionalTreatmentCards = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD1B574),
        title: Text("Pet Care", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSectionHeader('Past Vaccinations', _toggleVaccinations),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCard('Rabies vaccination', 'Mon 24 Jan', 'Dr. Nadeel'),
                buildCard('Calicivirus', 'Fri 2 Feb', 'Dr. Kalpana'),
              ],
            ),
            ...additionalVaccinationCards,
            buildSectionHeader('Past Treatments', _toggleTreatments),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCard('Ear Infection', 'Tue 12 Mar', 'Dr. Rajitha'),
                buildCard('Flea Treatment', 'Thu 18 Apr', 'Dr. Hasara'),
              ],
            ),
            ...additionalTreatmentCards,
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String date, String doctor) {
    return Container(
      padding: EdgeInsets.all(12),
      width: (MediaQuery.of(context).size.width - 32) / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(date, style: TextStyle(color: Colors.black54)),
          SizedBox(height: 4),
          Text(doctor, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget buildSectionHeader(String title, GestureTapCallback? toggleFunction) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: toggleFunction,
            child: Row(
              children: [
                Text(
                  toggleFunction != null ? (_showVaccinations || _showTreatments ? "Show less" : "Show more") : "See all",
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                ),
                Icon(Icons.arrow_forward_ios, size: 14, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
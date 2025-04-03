import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appointment Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppointmentPage(), // Set AppointmentPage as the home screen
    );
  }
}

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime _selectedDay = DateTime.now();
  TimeOfDay? _selectedTime;
  
  List<String> timeSlots = ["9:30", "10:30", "11:30", "3:30", "4:30", "5:30"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Dr. Nambuvan", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFC1A263),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Pop the current screen to go back to PetCareScreen
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose a Date", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            _buildCalendar(),
            SizedBox(height: 20),
            Text("Pick a Time", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            _buildTimeSlots(),
            SizedBox(height: 20),
            _buildBookButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 01, 01),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _selectedDay,
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
        });
      },
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Color(0xFFC1A263),
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildTimeSlots() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: timeSlots.map((time) {
        return GestureDetector(
          onTap: () {
            setState(() {
              List<String> timeParts = time.split(":");
              _selectedTime = TimeOfDay(
                hour: int.parse(timeParts[0]),
                minute: int.parse(timeParts[1]),
              );
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: _selectedTime?.format(context) == time ? Color(0xFFC1A263) : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(time, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBookButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle booking logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFC1A263),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text("Book an Appointment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(MinimumAppointmentDuration());

class MinimumAppointmentDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          child: SfCalendar(
                  view: CalendarView.day,
                  dataSource: getCalendarDataSource(),
                  timeSlotViewSettings: TimeSlotViewSettings(
                      minimumAppointmentDuration: Duration(minutes: 30)),
                ),

        )));
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 1)),
      endTime: DateTime.now().add(const Duration(hours: 2)),
      subject: 'Release Meeting',
      color: Colors.lightBlueAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime(2021, 1, 6, 9, 30, 0),
      endTime: DateTime(2021, 1, 6, 9, 35, 0),
      subject: 'Performance check',
      color: Colors.amber,
    ));

    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}

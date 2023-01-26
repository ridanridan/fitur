import 'package:tugas_fitur/event/models/event.dart';

class MakananVM {
  List<Event> get eventList => _eventList;
  static final List<Event> _eventList = [
    Event(
        name: "Gulai Ayam",
        startDate: "22 Nov 2022",
        endDate: "15 Jan 2022",
        location: "Bogor",
        floor: "GF",
        mall: "Botani Square",
        descriptions: "deskripsi 1"),
    Event(
        name: "Kepiting Saos Tiram",
        startDate: "1 Nov 2022",
        endDate: "1 Jan 2022",
        location: "Bogor",
        floor: "GF",
        mall: "AEON sentul",
        descriptions: "deskripsi 2"),
    Event(
        name: "Ayam Bakar",
        startDate: "10 Okt 2022",
        endDate: "24 Des 2022",
        location: "Bogor",
        floor: "GF",
        mall: "IKEA",
        descriptions: "deskripsi 3"),
  ];

  List<Event> _eventDisplay = List.from(_eventList);

  List<Event> get eventListDisplay => _eventDisplay;

  void updateEvent(String value) {
    print('search berjalan');
    print(value);
    print(_eventDisplay);
    _eventDisplay = eventList
        .where((element) =>
            element.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}

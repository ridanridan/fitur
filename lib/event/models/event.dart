class Event {
  final String? name;
  final String? startDate;
  final String? endDate;
  final String? location; 
  final String? floor;
  final String? mall;
  final String? descriptions;

  Event(
    {this.name,
     this.startDate,
     this.endDate,
     this.location,
     this.floor,
     this.mall,
     this.descriptions,
  });
}
  List<Event> eventList = [
    Event(
        name: "Festival bogor",
        startDate: "22 Nov 2022",
        endDate: "15 Jan 2022",
        location: "Bogor",
        floor: "GF",
        mall: "Botani Square",
        descriptions: "deskripsi 1"),
    Event(
        name: "Mandi Bola",
        startDate: "1 Nov 2022",
        endDate: "1 Jan 2022",
        location: "Bogor",
        floor: "GF",
        mall: "AEON sentul",
        descriptions: "deskripsi 2"),
    Event(
        name: "Bazaar furniture",
        startDate: "10 Okt 2022",
        endDate: "24 Des 2022",
        location: "Bogor",
        floor: "GF",
        mall: "IKEA",
        descriptions: "deskripsi 3"),
];

List<Event> displayEvent = List.from(eventList);

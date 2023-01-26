import 'package:flutter/material.dart';
import 'package:tugas_fitur/event/models/event.dart';
import 'package:tugas_fitur/event/viewmodels/event_viewmodel.dart';

class EventListView extends StatefulWidget {
  const EventListView({super.key});

  @override
  State<EventListView> createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  EventVM eventVm = EventVM();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: eventVm.eventListDisplay.length,
                itemBuilder: (context, index) {
                  Event event = eventVm.eventListDisplay[index];
                  return Column(
                    children: [
                      GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              event.name!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 10),
                                Text("${event.startDate!}-${event.endDate!}"),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.amberAccent,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                    "${event.location!}, ${event.floor!}, ${event.mall!}"),
                              ],
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ],
    );
  }
}

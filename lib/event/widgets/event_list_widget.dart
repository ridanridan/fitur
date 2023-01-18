import 'package:flutter/material.dart';
import 'package:tugas_fitur/event/models/event.dart';

class EventListView extends StatelessWidget {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: displayEvent.length,
                itemBuilder: (context, index) {
                  Event event = displayEvent[index];
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
                            SizedBox(height: 10),
                            Text(
                              event.name!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 10),
                                Text("${event.startDate!}-${event.endDate!}"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.amberAccent,
                                ),
                                SizedBox(width: 10),
                                Text(
                                    "${event.location!}, ${event.floor!}, ${event.mall!}"),
                              ],
                            ),
                            SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ],
    );
  }
}

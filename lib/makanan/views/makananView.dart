import 'package:flutter/material.dart';
import 'package:tugas_fitur/event/viewmodels/event_viewmodel.dart';
import 'package:tugas_fitur/makanan/viewmodels/event_viewmodel.dart';

class MakananView extends StatefulWidget {
  const MakananView({super.key});

  @override
  State<MakananView> createState() => _MakananViewState();
}

class _MakananViewState extends State<MakananView> with TickerProviderStateMixin {
  late TabController? _tabController;
  MakananVM makananVM = MakananVM();
  final _searchController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void refresh(String value) {
    setState(() {
      makananVM.updateEvent(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("makanan"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.blue,
                          onPressed: () {
                            refresh(_searchController.text);
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                        ),
                        hintText: ("cari"),
                      )),
                  const SizedBox(height: 20),
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.w300),
                    tabs: const [
                      Tab(
                        text: ("berlangsung"),
                      ),
                      Tab(
                        text: ("akan datang"),
                      ),
                    ],
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    child: TabBarView(controller: _tabController, children: [
                      (makananVM.eventList.isEmpty)
                          ? Text(
                              'No Data',
                              style: TextStyle(fontSize: 16),
                            )
                          : ((makananVM.eventListDisplay.length == 0)
                              ? Text(
                                  '`${_searchController.text}` Tidak Ditemukan',
                                  style: TextStyle(fontSize: 20),
                                )
                              : _tabBerlangsung(context)),
                      (makananVM.eventList.isEmpty)
                          ? Text(
                              'No Data',
                              style: TextStyle(fontSize: 16),
                            )
                          : ((makananVM.eventListDisplay.length == 0)
                              ? Text(
                                  '`${_searchController.text}` Tidak Ditemukan',
                                  style: TextStyle(fontSize: 20),
                                )
                              : _tabBerlangsung(context)),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _tabBerlangsung(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: makananVM.eventListDisplay.length,
                itemBuilder: (context, index) {
                  final event = makananVM.eventListDisplay[index];
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

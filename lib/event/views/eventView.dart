import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugas_fitur/event/widgets/event_list_widget.dart';
import 'package:tugas_fitur/event/widgets/search_bar.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> with TickerProviderStateMixin {
  
  late TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("acara"),
      ),
      body: Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              SearchBar(),
              SizedBox(height: 20),
              Container(
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300),
                  tabs: [
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
              ),
              SizedBox(height: 20),
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return const EventListView();
                      }),
                  ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return const EventListView();
                      })
                ]),
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
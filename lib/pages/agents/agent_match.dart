import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'agent_journee.dart';
import 'agents_controller.dart';

class AgentMatch extends StatefulWidget {
  String idAgent;
  AgentMatch(this.idAgent);

  @override
  State<StatefulWidget> createState() {
    return _AgentMatch();
  }
}

class _AgentMatch extends State<AgentMatch> {
  //
  AgentsController agentsController = Get.find();

  @override
  void initState() {
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: FutureBuilder(
        future: agentsController.getCalendrier(),
        builder: (c, t) {
          //
          if (t.hasData) {
            var id = t.data as int;
            print("id: $id");
            return Container(
              child: AgentJournee('$id', widget.idAgent),
            );
          } else if (t.hasError) {
            return Container();
          }
          return Center(
            child: Container(
              height: 40,
              width: 40,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:game_app/models/tournament_model.dart';
import 'package:game_app/views/tournament_page/gatnashyanlar.dart';
import '../constants/index.dart';

class TabPage3 extends StatefulWidget {
  final TournamentModel model;
  final int tournamentType;
  final bool finised;
  final TeamUsers teams;
  final int tournamentId;

  const TabPage3({
    required this.model,
    required this.finised,
    required this.tournamentType,
    required this.teams,
    required this.tournamentId,
    Key? key,
  }) : super(key: key);

  @override
  State<TabPage3> createState() => _TabPage3State();
}

class _TabPage3State extends State<TabPage3> {
  List<Teams> team_users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var e in widget.model.teams!) {
      if (e.teamUsers!.length > 0) team_users.add(e);
    }
    print(team_users);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: team_users.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Gatnashyanlatr(
              teams: team_users[index],
              usersCount: widget.model.type! == "solo"
                  ? 1
                  : widget.model.type! == "duo"
                      ? 2
                      : widget.model.type! == "squad"
                          ? 4
                          : 0),
        );

        // if (model.type == "solo") {
        //   return tab3PageTypeSolo(
        //     finised: finised,
        //     index: index,
        //     model: model,
        //   );
        // } else if (tournamentType == "duo") {
        //   return type3PageTypeDuo(
        //     finised: finised,
        //     index: index,
        //     model: model,
        //     teams: model.teams![index],
        //     usersCount : 2
        //   );
        // } else {
        //   return type3PageSquad(
        //     finised: finised,
        //     index: index,
        //     model: model,
        //      teams: model.teams![index],
        //      usersCount: 4
        //   );
        // }
      },
    );
  }
}

import 'package:game_app/views/cards/empty_users_card.dart';
import 'package:game_app/views/cards/team_user_card.dart';
import 'package:game_app/views/constants/index.dart';

import '../../models/tournament_model.dart';

class CardTeansAll extends StatefulWidget {
  late Teams team;
  late int selectedTeam;
  late Function(int id) selectTeam;
  late TeamUsers teamUsers;
  late int usersCount;
  CardTeansAll({required this.team, required this.selectedTeam, required this.selectTeam, required this.usersCount});

  @override
  State<CardTeansAll> createState() => _CardTeansAllState();
}

class _CardTeansAllState extends State<CardTeansAll> {
  late int index = 0;
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.selectTeam(widget.team.id!);
      },
      child: Card(
        // color: _selectedIndex == widget.team.id!.toInt() ? Colors.white : Colors.grey,
        color: widget.selectedTeam == widget.team.id ? Colors.white : Colors.grey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Team Id: ',
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.team.id.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  // height: 310,
                  width: double.infinity,
                  child: Column(
                    children: [for (var i = 0; i < widget.usersCount; i++) widget.team.teamUsers!.length >= i + 1 ? TeamUserCard(teamUsers: widget.team.teamUsers![i]) : EmptyUsersCard()],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

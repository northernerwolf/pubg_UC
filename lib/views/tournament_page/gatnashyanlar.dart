import '../../models/tournament_model.dart';
import '../cards/empty_users_card.dart';
import '../cards/gatnashyanlar_card.dart';
import '../constants/index.dart';

class Gatnashyanlatr extends StatefulWidget {
  late Teams teams;
  ParticipatedUsers participatedUsers;
  late Teams teamUsers;
  late int usersCount;

  Gatnashyanlatr({
    required this.participatedUsers,
    required this.teams,
    required this.usersCount,
  });

  @override
  State<Gatnashyanlatr> createState() => _GatnashyanlatrState();
}

class _GatnashyanlatrState extends State<Gatnashyanlatr> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: _selectedIndex == widget.team.id!.toInt() ? Colors.white : Colors.grey,
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)), side: BorderSide(width: 1, color: Colors.black26)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Team: ',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.participatedUsers.team == widget.teams.id ? widget.teams.number.toString() : widget.teams.number.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
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
                  children: [for (var i = 0; i < widget.usersCount; i++) widget.teams.teamUsers!.length >= i + 1 ? GatnashyanlarCard(teamUsers: widget.teams.teamUsers![i]) : EmptyUsersCard()],
                )),
          )
        ],
      ),
    );
  }
}

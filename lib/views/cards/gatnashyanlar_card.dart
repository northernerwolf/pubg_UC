import 'package:game_app/views/constants/index.dart';

import '../../models/tournament_model.dart';

class GatnashyanlarCard extends StatefulWidget {
  // late Teams team;
  late TeamUsers teamUsers;
  late String turnirType;
  GatnashyanlarCard({required this.teamUsers});

  @override
  State<GatnashyanlarCard> createState() => _GatnashyanlarCardState();
}

class _GatnashyanlarCardState extends State<GatnashyanlarCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColorBlack,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)), side: BorderSide(width: 1, color: Colors.black26)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox(
                width: 60,
                height: 60,
                child: widget.teamUsers.user!.image == null ? Image.asset('assets/image/no_image.png', fit: BoxFit.cover) : Image.network('$serverURL/${widget.teamUsers.user!.image}', fit: BoxFit.cover),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(widget.teamUsers.user!.nickname.toString()),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   children: [
              //     Text('Pubg id:'),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Text(widget.teamUsers.user!.pubgId.toString()),
              //   ],
              // )
            ],
          )
        ],
      ),
    );
  }
}

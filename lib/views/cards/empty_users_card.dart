import '../constants/index.dart';

class EmptyUsersCard extends StatelessWidget {
  const EmptyUsersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Expanded(
        //   child: Container(
        //     height: Get.size.height,
        //     decoration: BoxDecoration(
        //       color: kPrimaryColorBlack.withOpacity(0.4),
        //       borderRadius: borderRadius10,
        //     ),
        //     margin: const EdgeInsets.only(left: 8, top: 4, bottom: 12, right: 12),
        //     padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 4),
        //     child: Icon(
        //       CupertinoIcons.person_alt_circle,
        //       color: Colors.grey,
        //     ),
        //   ),
        // );
        Card(
      color: kPrimaryColorBlack,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)), side: BorderSide(width: 1, color: Colors.black26)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: Container(
                width: 60,
                height: 60,
                color: Colors.grey,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Elýeterli!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
              // Row(
              //   children: [
              //     Text('Pubg user name: '),
              //     Text('----'),
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   children: [
              //     Text('PUBG ID:'),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Text("---"),
              //   ],
              // )
            ],
          )
        ],
      ),
    );
  }
}

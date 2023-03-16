import '../constants/index.dart';

class EmptyUsersCard extends StatelessWidget {
  const EmptyUsersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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

import 'package:game_app/provider/getkonkur.dart';
import 'package:game_app/views/constants/index.dart';
import 'package:provider/provider.dart';

import 'concurs_by_id.dart';

class GetConcursScreen extends StatefulWidget {
  const GetConcursScreen({super.key});

  @override
  State<GetConcursScreen> createState() => _GetConcursScreenState();
}

class _GetConcursScreenState extends State<GetConcursScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Provider.of<getConcursProvider>(context, listen: false).getConcursCart(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorBlack,
      appBar: const MyAppBarNew(
        backArrow: true,
        iconRemove: true,
        elevationWhite: true,
        name: 'Concurs',
        fontSize: 0.0,
      ),
      body: Consumer<getConcursProvider>(builder: (_, concurs, __) {
        return ListView.builder(
            itemCount: concurs.concursCart.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ConcursByID(
                              id: concurs.concursCart[index].id.toString(),
                            )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
                              child: Image.network(
                                "http://216.250.11.240" + concurs.concursCart[index].image,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            concurs.concursCart[index].nameTm,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}

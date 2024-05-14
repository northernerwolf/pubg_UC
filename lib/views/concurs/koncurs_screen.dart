import 'package:game_app/views/concurs/get_concurs.dart';
import 'package:game_app/views/concurs/get_gifts.dart';
import 'package:game_app/views/constants/index.dart';
import 'package:provider/provider.dart';

import '../../provider/getkonkur.dart';

class KonkursScreen extends StatefulWidget {
  const KonkursScreen({super.key});

  @override
  State<KonkursScreen> createState() => _KonkursScreenState();
}

class _KonkursScreenState extends State<KonkursScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Provider.of<ConCatigoryProvider>(context, listen: false).getConCatigory(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorBlack,
      appBar: MyAppBarNew(
        fontSize: 0,
        backArrow: false,
        iconRemove: false,
        name: 'Konkurs',
        elevationWhite: true,
      ),
      body: Consumer<ConCatigoryProvider>(builder: (_, concurs, __) {
        return ListView.builder(
            itemCount: concurs.conCatigory.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    if (index == 0) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetConcursScreen()));
                    } else if (index == 1) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetGiftsScreen()));
                    }
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
                                "http://216.250.11.240" + concurs.conCatigory[index].image,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            concurs.conCatigory[index].nameTm,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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

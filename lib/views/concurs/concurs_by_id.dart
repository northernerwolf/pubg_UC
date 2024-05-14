import 'package:game_app/provider/getkonkur.dart';
import 'package:game_app/views/constants/index.dart';
import 'package:provider/provider.dart';

class ConcursByID extends StatefulWidget {
  final String id;
  ConcursByID({super.key, required this.id});

  @override
  State<ConcursByID> createState() => _ConcursByIDState();
}

class _ConcursByIDState extends State<ConcursByID> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Provider.of<getConcursByIDProvider>(context, listen: false).getConcursCartById(context, widget.id);
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
        body: Consumer<getConcursByIDProvider>(builder: (_, concurs, __) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const GetGiftsScreen();
                //     },
                //   ),
                // );
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
                            "http://216.250.11.240${concurs.concursCartById?.image}",
                            fit: BoxFit.cover,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        concurs.concursCartById?.nameTm ?? "",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

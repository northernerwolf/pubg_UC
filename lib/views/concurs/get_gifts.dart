import 'package:game_app/provider/getkonkur.dart';
import 'package:game_app/views/constants/index.dart';
import 'package:provider/provider.dart';

class GetGiftsScreen extends StatefulWidget {
  const GetGiftsScreen({super.key});

  @override
  State<GetGiftsScreen> createState() => _GetGiftsScreenState();
}

class _GetGiftsScreenState extends State<GetGiftsScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Provider.of<getGiftsProvider>(context, listen: false).getGiftsCart(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorBlack,
      appBar: const MyAppBarNew(
        backArrow: true,
        iconRemove: false,
        elevationWhite: true,
        name: '',
        fontSize: 0.0,
      ),
      body: Consumer<getGiftsProvider>(builder: (_, gifts, __) {
        return ListView.builder(
            itemCount: gifts.giftsCart.length,
            itemBuilder: (BuildContext context, int index) {
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
                                "http://216.250.11.240" + gifts.giftsCart[index].image,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            gifts.giftsCart[index].nameTm,
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

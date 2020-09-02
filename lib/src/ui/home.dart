import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_sample_app/src/model/character.dart';
import 'package:mobx_sample_app/src/model/characters_list.dart';
import 'package:mobx_sample_app/src/model/result.dart';
import 'package:mobx_sample_app/src/ui/modal_character_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _charList = CharactersList();
  ModalCharacterDetails modal = new ModalCharacterDetails();

  @override
  void initState() {
    super.initState();
    _charList.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'MARVEL',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {},
              tooltip: 'Search',
            ),
          ],
        ),
        body: Observer(
          builder: (_) => (_charList.characters != null)
              ? FutureBuilder<Character>(
                  future: _charList.characters,
                  builder: (context, snapshot) {
                    print("snapshot is $snapshot");
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.data.results.length,
                            itemBuilder: (context, index) {
                              return _buildCharacter(
                                  snapshot.data.data.results[index]);
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                )
              : Center(child: CircularProgressIndicator()),
        ));
  }

  Widget _buildCharacter(Result result) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          modal.mainBottomSheet(context, result);
        },
        child: Container(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.99),
                    blurRadius: 20,
                    spreadRadius: 3.5,
                    offset: Offset(0, 13),
                  )
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 4,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                          ),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(''
                                  'https://sm.ign.com/ign_pt/screenshot/default/iron-man_derz.jpg'))),
                    )),
                Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${result.name}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${result.name}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff8A8A8A),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '${result.description}',
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff8A8A8A)),
                                )
                              ],
                            ))
                      ],
                    )),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

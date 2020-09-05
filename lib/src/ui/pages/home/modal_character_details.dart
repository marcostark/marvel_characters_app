import 'package:flutter/material.dart';
import 'package:mobx_sample_app/src/model/character.dart';

class ModalCharacterDetails {
  mainBottomSheet(BuildContext context, Character result) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return _body(context, result);
        });
  }

  Widget _body(BuildContext context, Character article) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerCharacter(context, article),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  article.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF05A8F3),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      article.name,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.black.withOpacity(0.4),
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                ),
                Text(
                  article.description,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerCharacter(BuildContext context, Character character) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(character.getImage()))),
        ),
      ],
    );
  }
}

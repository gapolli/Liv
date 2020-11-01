import 'package:flutter/material.dart';

class BookListingCard extends StatelessWidget {
  const BookListingCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 175,
                width: 125,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: const Text("Book cover"),
                ),
              ),
            ],
          ),
          Container(
            height: 175,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      "Título do Livro",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "By nome do autor",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Ano",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "data em que foi adicionado a lista",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text("as estrelinha"),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FavouritePicture extends StatefulWidget {
  const FavouritePicture({super.key});

  @override
  State<FavouritePicture> createState() => _FavouritePictureState();
}

class _FavouritePictureState extends State<FavouritePicture> {
  bool _isFavourited = true;
  int _favouriteCount = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              "Understanding Interactive UI",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/nature.jpg",
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Creator: GettyTim82",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "Credit: Getty Images/iStockphoto",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isFavourited) {
                                _isFavourited = false;
                                _favouriteCount -= 1;
                              } else {
                                _isFavourited = true;
                                _favouriteCount += 1;
                              }
                            });
                          },
                          icon: Icon(
                              _isFavourited ? Icons.star : Icons.star_border),
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        "$_favouriteCount",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.blue[400],
                    ),
                    Text(
                      "Call",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue[200],
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.near_me,
                      color: Colors.blue[400],
                    ),
                    Text(
                      "Route",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue[200],
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.blue[400],
                    ),
                    Text(
                      "Share",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue[200],
                          decoration: TextDecoration.none),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "A beautiful nature picture. Nature is everything, including plants, animals and the physical world around us. It is our moral duty to preserve the nature.",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            )
          ],
        ));
  }
}

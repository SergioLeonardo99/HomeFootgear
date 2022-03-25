import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:product_rain/temas/color.dart';
import 'package:product_rain/util/pagina_inicio_json.dart';

class InicioShoes extends StatefulWidget {
  

  @override
  _InicioShoesState createState() => _InicioShoesState();
}

class _InicioShoesState extends State<InicioShoes> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightGrey,
      body: getBody(size),
      
    );
  }

  getBody(size) {
    return ListView(
      children: [
        SizedBox(height: 20),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 240,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(banner),
                fit: BoxFit.cover
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
      
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nuevos Modelos",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              Text(
                "Ver Todo",
                style: TextStyle(
                  fontSize: 13,
                  color: blue
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
              child: Row(
            children: List.generate(newArrivals.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 15 : 10,
                  right: index == (newArrivals.length) - 1 ? 15 : 0
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
   
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 110,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(newArrivals[index]['imageUrl']),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                          ),
                          color: white
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newArrivals[index]['name'],
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                              Text(
                                newArrivals[index]['description'],
                                style: TextStyle(fontSize: 12, color: Colors.purple[900]),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "\$${newArrivals[index]['price']}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              RatingBarIndicator(
                                rating: newArrivals[index]['rating'],
                                itemCount: 5,
                                itemSize: 12.0,
                                direction: Axis.horizontal,
                                itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );

  }
}
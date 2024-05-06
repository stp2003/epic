import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epic/services/database.dart';
import 'package:epic/widgets/widget_support.dart';
import 'package:flutter/material.dart';

import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool iceCream = false, pizza = false, salad = false, burger = false;

  Stream? foodItemStream;

  onTheLoad() async {
    foodItemStream = await DatabaseMethods().getFoodItem('Tools');
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
      stream: foodItemStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Details(
                            image: 'images/food.jpg',
                            name: 'Veggie Taco Hash',
                            detail:
                                'Veggie Taco HashVeggie Taco HashVeggie Taco HashVeggie Taco HashVeggie Taco HashVeggie Taco HashVeggie Taco HashVeggie Taco Hash',
                            price: '25',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  ds['Image'],
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                ds['Name'],
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "Fresh and Healthy",
                                style: AppWidget.lightTextFieldStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "\$" + ds['Price'],
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const CircularProgressIndicator();
      },
    );
  }

  Widget allItemsVertical() {
    return StreamBuilder(
      stream: foodItemStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Details(
                            image: 'images/food.jpg',
                            name: 'Veggie Taco Hash',
                            detail:
                                'Veggie Taco HashVeggie Taco HashVeggie Taco HashVeggie Taco HashVeggie Taco HashVeggie Taco HashVeggie Taco HashVeggie Taco Hash',
                            price: '25',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  ds['Image'],
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      ds['Name'],
                                      style: AppWidget.semiBoldTextFieldStyle(),
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "Honey goot cheese",
                                      style: AppWidget.lightTextFieldStyle(),
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "\$" + ds['Price'],
                                      style: AppWidget.semiBoldTextFieldStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Shashwat,",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text("Delicious Food", style: AppWidget.headlineTextFieldStyle()),
              Text(
                "Discover and Get Great Food",
                style: AppWidget.lightTextFieldStyle(),
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: showItem(),
              ),
              const SizedBox(height: 30.0),
              Container(height: 270, child: allItems()),
              const SizedBox(height: 30.0),
              allItemsVertical(),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            iceCream = true;
            pizza = false;
            salad = false;
            burger = false;
            foodItemStream = await DatabaseMethods().getFoodItem('Tools');
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: iceCream ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/ice-cream.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: iceCream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            iceCream = false;
            pizza = true;
            salad = false;
            burger = false;
            foodItemStream = await DatabaseMethods().getFoodItem('Seeds');
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: pizza ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/pizza.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            iceCream = false;
            pizza = false;
            salad = true;
            burger = false;
            foodItemStream = await DatabaseMethods().getFoodItem('Pests');
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: salad ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/salad.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            iceCream = false;
            pizza = false;
            salad = false;
            burger = true;
            foodItemStream = await DatabaseMethods().getFoodItem('Land');
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: burger ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/burger.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

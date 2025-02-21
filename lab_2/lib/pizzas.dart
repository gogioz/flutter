import 'package:flutter/material.dart';
import 'package:lab_2/Models/pizza.dart';

class Pizzas extends StatefulWidget {
  const Pizzas({super.key});

  @override
  State<Pizzas> createState() => _PizzasState();
}

class _PizzasState extends State<Pizzas> {
  List<Pizza> pizzas = [
    Pizza(product: "Vegetable Pizza", url: "imgs/vegeis.jpg"),
    Pizza(product: "Cheese Pizza", url: "imgs/cheese.jpg"),
    Pizza(product: "Fries", url: "imgs/fries.jpg"),
    Pizza(product: "Noodles", url: "imgs/noodels.jpg"),
    Pizza(product: "Burger", url: "imgs/burger.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 40),
          title: Text(
            "WOW Pizza",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange[100],
        ),
        backgroundColor: Colors.orange[100],
        body: ListView(
          padding: EdgeInsets.all(10), // Adds padding to the whole list
          children: pizzas
              .map((pizza) => Padding(
                    padding:
                        EdgeInsets.only(bottom: 10), // Adds space between tiles
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      tileColor: Colors.orange[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onTap: () {
                        Navigator.of(context).pushNamed("pizza", arguments: {
                          "url": pizza.url,
                          "name": pizza.product
                        });
                      },
                      title: Text(
                        pizza.product,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      leading: Image.asset(pizza.url),
                    ),
                  ))
              .toList(),
        ));
  }
}

import 'package:e_commerce/provider/product_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutSingleProduct extends StatefulWidget {
  final String name;
  final String image;
  final int index;
  final String color;
  final String size;
  final quentity;
  final double price;
  final String description;
  CheckOutSingleProduct({
    this.index,
    this.color,
    this.size,
    this.quentity,
    this.image,
    this.name,
    this.price,
    this.description,
  });
  @override
  _CheckOutSingleProductState createState() => _CheckOutSingleProductState();
}

TextStyle myStyle = TextStyle(fontSize: 18);
ProductProvider productProvider;

class _CheckOutSingleProductState extends State<CheckOutSingleProduct> {
  double height, width;
  Widget _buildImage() {
    return Container(
      height: height * 0.1 + 50,
      width: width * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.image),
        ),
      ),
    );
  }

  Widget _buildNameAndClosePart() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: new Text(
            widget.name,
            style: myStyle,
            softWrap: true,
            overflow: TextOverflow.fade,
          )),
        ],
      ),
    );
  }

  Widget _buildColorAndSizePart() {
    return Container(
      width: width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.color,
            style: myStyle,
          ),
          Text(
            widget.size,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _buildCountOrNot() {
    return Container(
      height: 35,
      width: width * 0.2 + 100,
      color: Color(0xfff2f2f2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Quantity"),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              widget.quentity.toString(),
              style: TextStyle(fontSize: 18),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            constraints: BoxConstraints(
              minHeight: 20.0,
              minWidth: 30.0,
            ),
            color: Colors.red,
            onPressed: () {
              productProvider.deleteCheckoutProduct(widget.index);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildImage(),
                Container(
                  height: height * 0.1 + 71,
                  width: width * 0.6,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildNameAndClosePart(),
                        _buildColorAndSizePart(),
                        Text(
                          "\$${widget.price.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Color(0xff9b96d6),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        _buildCountOrNot(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

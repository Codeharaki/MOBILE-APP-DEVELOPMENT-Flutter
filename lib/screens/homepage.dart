import 'package:e_commerce/model/categoryicon.dart';
import 'package:e_commerce/model/usermodel.dart';
import 'package:e_commerce/screens/about.dart';
import 'package:e_commerce/screens/checkout.dart';

import 'package:e_commerce/screens/contactus.dart';

import 'package:e_commerce/screens/profilescreen.dart';

import '../provider/product_provider.dart';
import '../provider/category_provider.dart';
import 'package:e_commerce/screens/detailscreen.dart';
import 'package:e_commerce/screens/listproduct.dart';
import 'package:e_commerce/widgets/singeproduct.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';
import '../widgets/notification_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Product menData;
CategoryProvider categoryProvider;
ProductProvider productProvider;

Product womenData;

Product bulbData;

Product smartPhoneData;

class _HomePageState extends State<HomePage> {
  Widget _buildCategoryProduct({String image, int color}) {
    return CircleAvatar(
      maxRadius: height * 0.1 / 2.1,
      backgroundColor: Color(color),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: NetworkImage(image),
        ),
      ),
    );
  }

  double height, width;
  bool homeColor = true;

  bool checkoutColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;
  bool profileColor = false;
  MediaQueryData mediaQuery;
  Widget _buildUserAccountsDrawerHeader() {
    List<UserModel> userModel = productProvider.userModelList;
    return Column(
        children: userModel.map((e) {
      return UserAccountsDrawerHeader(
        accountName: Text(
          e.userName,
          style: TextStyle(color: Colors.black),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: e.userImage == null
              ? AssetImage("images/userImage.png")
              : NetworkImage(e.userImage),
        ),
        decoration: BoxDecoration(color: Color(0xfff2f2f2)),
        accountEmail: Text(e.userEmail, style: TextStyle(color: Colors.black)),
      );
    }).toList());
  }

  Widget _buildMyDrawer() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MIAGED",
          style:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        actions: <Widget>[
          NotificationButton(),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildImageSlider(),
                  //_buildCategory(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildFeature(),
                  _buildNewAchives()
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //currentIndex: this.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.euro),
            title: ListTile(
              selected: contactUsColor,
              onTap: () {
                setState(() {
                  contactUsColor = true;
                  checkoutColor = false;
                  profileColor = false;
                  homeColor = false;
                  aboutColor = false;
                });
                /* Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => CheckOut()));*/
              },
              title: Text("Acheter"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: ListTile(
              selected: contactUsColor,
              onTap: () {
                setState(() {
                  contactUsColor = true;
                  checkoutColor = false;
                  profileColor = false;
                  homeColor = false;
                  aboutColor = false;
                });
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => CheckOut()));
              },
              title: Text("Panier"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_help_rounded),
            title: ListTile(
              selected: contactUsColor,
              onTap: () {
                setState(() {
                  contactUsColor = true;
                  checkoutColor = false;
                  profileColor = false;
                  homeColor = false;
                  aboutColor = false;
                });
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => ContactUs()));
              },
              title: Text("Nous contacter"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: ListTile(
              selected: contactUsColor,
              onTap: () {
                setState(() {
                  contactUsColor = true;
                  checkoutColor = false;
                  profileColor = false;
                  homeColor = false;
                  aboutColor = false;
                });
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => ProfileScreen()));
              },
              title: Text("Profile"),
            ),
          ),
        ],
        onTap: (int index) {
          //  this.onTapHandler(index);
        },
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: height * 0.25,
      child: Carousel(
        autoplay: true,
        showIndicator: false,
        images: [
          AssetImage("images/1.jpg"),
          AssetImage("images/3.jpg"),
          AssetImage("images/6.jpg"),
        ],
      ),
    );
  }

  Widget _buildDressIcon() {
    List<CategoryIcon> dressIcon = categoryProvider.getDressIcon;
    List<Product> dress = categoryProvider.getDressList;
    return Row(
        children: dressIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Dress",
                snapShot: dress,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(image: e.image, color: 0xff33dcfd),
      );
    }).toList());
  }

  Widget _buildShirtIcon() {
    List<Product> shirts = categoryProvider.getShirtList;
    List<CategoryIcon> shirtIcon = categoryProvider.getShirtIconData;
    return Row(
        children: shirtIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Shirt",
                snapShot: shirts,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(image: e.image, color: 0xfff38cdd),
      );
    }).toList());
  }

  Widget _buildShoeIcon() {
    List<CategoryIcon> shoeIcon = categoryProvider.getShoeIcon;
    List<Product> shoes = categoryProvider.getshoesList;
    return Row(
        children: shoeIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Shoes",
                snapShot: shoes,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(
          image: e.image,
          color: 0xff4ff2af,
        ),
      );
    }).toList());
  }

  Widget _buildFeature() {
    List<Product> featureProduct;

    featureProduct = productProvider.getFeatureList;

    return Column(
      children: <Widget>[
        Text(
          "Vétements",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Vétements",
                      isCategory: false,
                      snapShot: featureProduct,
                    ),
                  ),
                );
              },
              /*child: Text(
                "View",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),*/
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            Container(
                                width: 70.0,
                                height: 150.0,
                                color: Colors.grey[100]),
                            new Container(
                              child: new Image.asset(
                                'images/9.jpg',
                                height: 150.0,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                                width: 70.0,
                                height: 150.0,
                                color: Colors.grey[100]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          children: productProvider.getHomeFeatureList.map((e) {
            return Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              image: e.image,
                              price: e.price,
                              name: e.name,
                              description: e.description,
                            ),
                          ),
                        );
                      },
                      child: SingleProduct(
                        image: e.image,
                        price: e.price,
                        name: e.name,
                        description: e.description,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                              image: e.image,
                              price: e.price,
                              name: e.name,
                              description: e.description),
                        ),
                      );
                    },
                    child: SingleProduct(
                      image: e.image,
                      price: e.price,
                      name: e.name,
                      description: e.description,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildNewAchives() {
    List<Product> newAchivesProduct = productProvider.getNewAchiesList;
    return Column(
      children: <Widget>[
        Container(
          height: height * 0.25 - 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Accessoires",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => ListProduct(
                            name: "Accessoires",
                            isCategory: false,
                            snapShot: newAchivesProduct,
                          ),
                        ),
                      );
                    },
                    /*child: Text(
                      "View",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),*/
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  Container(
                                      width: 70.0,
                                      height: 140.0,
                                      color: Colors.grey[100]),
                                  new Container(
                                    child: new Image.asset(
                                      'images/7.jpg',
                                      height: 140.0,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                      width: 70.0,
                                      height: 140.0,
                                      color: Colors.grey[100]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
            children: productProvider.getHomeAchiveList.map((e) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx) => DetailScreen(
                                      image: e.image,
                                      price: e.price,
                                      name: e.name,
                                      description: e.description,
                                    ),
                                  ),
                                );
                              },
                              child: SingleProduct(
                                  image: e.image,
                                  price: e.price,
                                  name: e.name,
                                  description: e.description),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => DetailScreen(
                                    image: e.image,
                                    price: e.price,
                                    name: e.name,
                                    description: e.description,
                                  ),
                                ),
                              );
                            },
                            child: SingleProduct(
                                image: e.image,
                                price: e.price,
                                name: e.name,
                                description: e.description),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }).toList()),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  void getCallAllFunction() {
    categoryProvider.getShirtData();
    categoryProvider.getDressData();
    categoryProvider.getShoesData();
    categoryProvider.getPantData();
    categoryProvider.getTieData();
    categoryProvider.getDressIconData();
    productProvider.getNewAchiveData();
    productProvider.getFeatureData();
    productProvider.getHomeFeatureData();
    productProvider.getHomeAchiveData();
    categoryProvider.getShirtIcon();
    categoryProvider.getshoesIconData();
    categoryProvider.getPantIconData();
    categoryProvider.getTieIconData();
    productProvider.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return MaterialApp(key: _key, home: _buildMyDrawer());
  }
}

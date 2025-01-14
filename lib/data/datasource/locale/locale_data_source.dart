import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import '../../../core/resources/locale_keys.g.dart';
import '../../../core/utils/showToast.dart';
import '../../model/body/calculate_order_cost_body.dart';
import 'dart:io';
/// provider

class ProductProvider with ChangeNotifier {
  bool isLoading = false;

  ///variables
  List<Product> _products = [];
  List<Detail> _detail = [];

  // double totalPrice = 0;
  ///getters
  List<Product> get products => _products;

  List<Detail> get detail => _detail;

  ///setters
  set addProductQuantity(int index) {
    _products[index].quantity = (_products[index].quantity! + 1)!;

    updateProduct(Product(
      id: _products[index].id,
      salesLimit: _products[index].salesLimit,
      image: _products[index].image,
      totalPrice: _products[index].totalPrice,
      price: _products[index].price,
      quantity: _products[index].quantity,
      name: _products[index].name,
      unit: _products[index].unit,
      weightUnit: _products[index].weightUnit,
      priceWeightUnit: _products[index].priceWeightUnit,
    ));
    notifyListeners();
  }

  set minceProductQuantity(int index) {
    if (_products[index].quantity! <= 1) {
      return;
    }
    _products[index].quantity = (_products[index].quantity! - 1);
    updateProduct(Product(
      id: _products[index].id,
      salesLimit: _products[index].salesLimit,
      image: _products[index].image,
      totalPrice: _products[index].totalPrice,
      price: _products[index].price,
      quantity: _products[index].quantity,
      name: _products[index].name,
      unit: _products[index].unit,
      weightUnit: _products[index].weightUnit,
      priceWeightUnit: _products[index].priceWeightUnit,
    ));
    notifyListeners();
  }

  ///function
  Future<void> fetchProducts() async {
    _detail = await DatabaseHelper.instance.getDetail();
    fetchDetail();
    notifyListeners();
  }

  Future<void> fetchDetail() async {
    _products = await DatabaseHelper.instance.getProducts();
    notifyListeners();
  }

  double totalProductsPrice() {
    double x = 0;
    for (int i = _products.length - 1; i >= 0; i--) {
      if (_products[i].priceWeightUnit != null && _products[i].quantity != null) {
        x = x +
            (_products[i].priceWeightUnit)! *
                (int.parse(_products[i].quantity.toString()));
      }
    }
    // totalPrice = x;
    // notifyListeners();
    return x;
  }

  int totalAmounts() {
    int x = 0;
    for (int i = _products.length - 1; i >= 0; i--) {
      if (_products[i].price != null && _products[i].quantity != null) {
        x = x + (int.parse(_products[i].quantity.toString()));
      }
    }
    return x;
  }

  Future<void> addProductFromProductDetails(
      Product product, BuildContext context) async {
    int? searchItem = product.id;
    int? quantityItem;
    bool personExists = _products.any((person) {
      quantityItem = person.quantity;
      return person.id == searchItem;
    });
    isLoading = true;
    notifyListeners();
    if (personExists) {
      Product Product0 = Product(
        id: product.id,
        salesLimit: product.salesLimit,
        image: product.image,
        price: product.price?.toDouble(),
        name: product.name,
        // quantity: (product.quantity ?? 0) + (quantityItem ?? 0),
        quantity: (product.quantity ?? 0),
        totalPrice: product.price ?? 0,
        weightUnit: product.weightUnit ?? 0,
        priceWeightUnit: product.priceWeightUnit ?? 0,
      );
      await DatabaseHelper.instance.updateProduct(Product0);
      // updateProductQuantity(product.id??0,product.quantity??0);
      await fetchProducts();

      print('$searchItem exists in the list');
    } else {
      await DatabaseHelper.instance.insertProduct(product);
      await fetchProducts();
      print('$searchItem does not exist in the list');
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addProduct(Product product, BuildContext context) async {
    int? searchItem = product.id;
    bool personExists = _products.any((person) => person.id == searchItem);
    if (personExists) {
      ToastUtils.showToast(LocaleKeys.productAlreadyInCart.tr());
      //print('$searchItem exists in the list');
    } else {
      await DatabaseHelper.instance.insertProduct(product);
      await fetchProducts();
      // print('$searchItem does not exist in the list');
      // enmation(context);
    }
  }

  Future<void> updateProduct(Product product) async {
    await DatabaseHelper.instance.updateProduct(product);
    await fetchProducts();
    notifyListeners();
  }

  Future<void> deleteAllDatabase() async {
    await DatabaseHelper.instance.deleteAllDatabase();
    await fetchProducts();
    // _products.clear();
    // _detail.clear();
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    await DatabaseHelper.instance.deleteProduct(id);
    await fetchProducts();
    // _products.removeWhere((element) => element.id==id);
    notifyListeners();
  }
}

/// DatabaseHelper

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'myCart.db');
    final _databaseVersion = 4;

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDb,
    );
  }

  Future<String> deleteDbWhenChangeVersion() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "myCart.db");
    if (await Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        // ignore: avoid_print
        // print(e);
      }
    }
    // print("path: $path");
    _database = await _initDatabase();
    return path;
  }

// productId INTEGER PRIMARY KEY AUTOINCREMENT,
  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products (
        image TEXT,
        id INTEGER PRIMARY KEY,
        name TEXT,
        price REAL,
        weightUnit REAL,
        priceWeightUnit REAL,
        totalPrice REAL,
        quantity INTEGER,
        salesLimit INTEGER,
        unit TEXT
      )
    ''');
  }

  Future<List<Detail>> getDetail() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (index) {
      return Detail(
          productId: maps[index]['id'],
          qty: maps[index]['quantity'],
          netCost: maps[index]['price']);
    });
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (index) {
      return Product(
        id: maps[index]['id'],
        salesLimit: maps[index]['salesLimit'],
        image: maps[index]['image'].toString(),
        name: maps[index]['name'],
        price: maps[index]['price'],
        totalPrice: maps[index]['totalPrice'],
        quantity: maps[index]['quantity'],
        weightUnit: maps[index]['weightUnit'],
        priceWeightUnit: maps[index]['priceWeightUnit'],
        unit: maps[index]['unit'],
      );
    });
  }

  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert(
      'products',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('######## product id${product.id}');
  }

  Future<void> updateProduct(Product product) async {
    final db = await database;
    await db.update(
      'products',
      product.toJson(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
    print('######## product quantity${product.quantity}');
    print('######## product id${product.id}');
  }

  Future<void> deleteProduct(String id) async {
    final db = await database;
    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
    print('######## product id deleted$id');
  }

  deleteAllDatabase() async {
    ///one way to delete all DB want a package name foundation
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, "myCart.db");
    // await deleteDatabase(path);
    ///one way to delete all DB best way in this app

    await _database?.delete('products');

    ///one way to delete all DB

    // String databasePath = await getDatabasesPath();
    // String path = join(databasePath, 'myCart.db');
    // await deleteDatabase(path);
  }
}

/// model
class Product {
  int? id;
  String? image;
  String? name;
  double? price;
  num? totalPrice;
  int? quantity;
  int? salesLimit;
  num? weightUnit;
  num? priceWeightUnit;
  String? unit;

  Product({
    this.id,
    this.image,
    this.name,
    this.price,
    this.totalPrice,
    this.quantity,
    this.salesLimit,
    this.weightUnit,
    this.priceWeightUnit,
    this.unit,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        totalPrice: json["totalPrice"],
        quantity: json["quantity"],
        salesLimit: json["salesLimit"],
        weightUnit: json["weightUnit"],
        priceWeightUnit: json["priceWeightUnit"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "totalPrice": totalPrice,
        "quantity": quantity,
        "salesLimit": salesLimit,
        "weightUnit": weightUnit,
        "priceWeightUnit": priceWeightUnit,
        "unit": unit,
      };
}

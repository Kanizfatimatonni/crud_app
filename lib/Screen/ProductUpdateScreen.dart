import 'package:crud_app/RestApi/RestClicent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Style/Style.dart';
import 'ProductGrideViewScreen.dart';

//import '../RestAPI/RestClient.dart';
//import 'ProductGridViewScreen.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map productItem;

  const ProductUpdateScreen(this.productItem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String, String> FormValues = {"image": "", "product_code": "", "title": "",  "price": "", "special_price": ""};

  bool Loading = false;

  @override
  void initState() {
    setState(() {
      FormValues.update("image", (value) => widget.productItem['image']);
      FormValues.update("product_code", (value) => widget.productItem['product_code']);
      FormValues.update("title", (value) => widget.productItem['title']);
      FormValues.update("price", (value) => widget.productItem['price']);
      FormValues.update("special_price", (value) => widget.productItem['special_price']);
    });
  }

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['image']!.length == 0) {
      ErrorToast('Image Link Required !');
    } else if (FormValues['product_code']!.length == 0) {
      ErrorToast('Product Code Required !');
    } else if (FormValues['title']!.length == 0) {
      ErrorToast('Product Name Required !');
    }else if (FormValues['price']!.length == 0) {
      ErrorToast('Total Price Required !');
    } else if (FormValues['special_price']!.length == 0) {
      ErrorToast('Unit Price Required !');
    } else {
      setState(() {
        Loading = true;
      });
      await ProductUpdateRequest(FormValues, widget.productItem['-id']);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProductGridViewScreen()), (Route route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
              child: Loading
                  ? (Center(
                      child: CircularProgressIndicator(),
                    ))
                  : ((SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: FormValues['title'],
                            onChanged: (Textvalue) {
                              InputOnChange("title", Textvalue);
                            },
                            decoration: AppInputDecoration('Product Name'),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: FormValues['product_code'],
                            onChanged: (Textvalue) {
                              InputOnChange("product_code", Textvalue);
                            },
                            decoration: AppInputDecoration('Product Code'),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: FormValues['image'],
                            onChanged: (Textvalue) {
                              InputOnChange("image", Textvalue);
                            },
                            decoration: AppInputDecoration('Product Image'),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: FormValues['special_price'],
                            onChanged: (Textvalue) {
                              InputOnChange("special_price", Textvalue);
                            },
                            decoration: AppInputDecoration('Unit Price'),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: FormValues['price'],
                            onChanged: (Textvalue) {
                              InputOnChange("price", Textvalue);
                            },
                            decoration: AppInputDecoration('Total Price'),
                          ),

                          SizedBox(height: 20),
                          Container(
                              child: ElevatedButton(
                                  style: AppButtonStyle(),
                                  onPressed: () {
                                    FormOnSubmit();
                                  },
                                  child: SuccessButtonChild('Submit')))
                        ],
                      ),
                    ))))
        ],
      ),
    );
  }
}

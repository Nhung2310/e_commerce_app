import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/start_rating_widget.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    required this.product,
    this.textLabel = '',
    required this.colorTextLabel,
    this.colorLabel = Colors.transparent,
    this.onTap,
    this.onDoubleTap,
    super.key,
  });

  final Product product;
  final String textLabel;
  final Color colorTextLabel;
  final Color colorLabel;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteBackgroundColor,
      elevation: 0.0,
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      child: SizedBox(
        height: 280,
        width: 150,
        child: Stack(
          children: [
            InkWell(
              onTap: widget.onTap,
              onDoubleTap: widget.onDoubleTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 184,
                        width: 148,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.product.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: widget.colorLabel,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            widget.textLabel,
                            style: TextStyle(
                              color: widget.colorTextLabel,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StartRatingWidget(
                          startCount: 5,
                          rating: widget.product.rating,
                        ),
                        TextBrandName(text: widget.product.brandName),
                        TextItemProduct(text: widget.product.itemName),
                        TextPrice(
                          oldPrice: widget.product.oldPrice,
                          newPrice: widget.product.newPrice,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 86,
              right: 1,
              child: Material(
                color: Colors.white,
                elevation: 4,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      color: _isLiked ? Colors.red : Colors.grey,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardList extends StatefulWidget {
  final Product product;
  final String textLabel;
  final Color colorTextLabel;
  final Color colorLabel;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  const ProductCardList({
    required this.product,
    required this.textLabel,
    required this.colorTextLabel,
    required this.colorLabel,
    this.onTap,
    this.onDoubleTap,
    super.key,
  });

  @override
  State<ProductCardList> createState() => _ProductCardListState();
}

class _ProductCardListState extends State<ProductCardList> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: SizedBox(
        height: 132,

        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,

              height: 120,

              child: Card(
                color: AppColor.whiteColor,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: InkWell(
                  onTap: widget.onTap,
                  onDoubleTap: widget.onDoubleTap,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        widget.product.imageUrl,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 104,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextBrandName(text: widget.product.brandName),
                              TextItemProduct(text: widget.product.itemName),
                              StartRatingWidget(
                                startCount: 5,
                                rating: widget.product.rating,
                              ),
                              TextPrice(
                                oldPrice: widget.product.oldPrice,
                                newPrice: widget.product.newPrice,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              right: 8,
              child: Material(
                color: Colors.white,
                elevation: 4,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      color: _isLiked ? Colors.red : Colors.grey,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

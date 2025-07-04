import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';

class MyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    // Vẽ phần giữa và trên (màu đen)
    Path pathBlack = Path();
    pathBlack.moveTo(0, size.height * 0.3); // Bắt đầu từ điểm giữa bên trái
    pathBlack.cubicTo(
      size.width / 4,
      3 * size.height / 3,
      3 * size.width / 4,
      size.height / 4,
      size.width * 0.8,
      size.height,
    );
    pathBlack.lineTo(
      size.width * 0.7,
      0,
    ); // Di chuyển đến điểm bắt đầu của góc trên bên phải
    pathBlack.lineTo(0, 0); // Kết nối đến góc trái trên
    pathBlack.close();

    paint.color = Colors.black;
    canvas.drawPath(pathBlack, paint);

    // Vẽ phần dưới bên trái (màu xám)
    Path pathGrayBottomLeft = Path();
    pathGrayBottomLeft.moveTo(0, size.height); // Bắt đầu từ góc trái dưới
    pathGrayBottomLeft.lineTo(0, size.height * 0.3); // Đến điểm dưới đường cong
    pathGrayBottomLeft.cubicTo(
      size.width / 4,
      3 * size.height / 3,
      3 * size.width / 4,
      size.height / 4,
      size.width * 0.8,
      size.height,
    );
    pathGrayBottomLeft.lineTo(size.width, size.height); // Đến góc phải dưới
    pathGrayBottomLeft.close();

    paint.color = AppColor.grayColor;
    canvas.drawPath(pathGrayBottomLeft, paint);

    // Vẽ góc trên bên phải (màu xám) với 1/4 hình tròn
    Path pathGrayTopRight = Path();
    pathGrayTopRight.moveTo(
      size.width * 0.7,
      0,
    ); // Bắt đầu từ điểm gần góc trên bên phải
    pathGrayTopRight.arcToPoint(
      Offset(size.width, size.height * 0.3), // Điểm cuối của 1/4 hình tròn
      radius: Radius.circular(size.width * 0.3), // Bán kính của 1/4 hình tròn
      clockwise: false, // Chiều quay ngược
    );
    pathGrayTopRight.lineTo(size.width, 0); // Kết nối đến góc phải trên
    pathGrayTopRight.close();

    paint.color = AppColor.grayColor;
    canvas.drawPath(pathGrayTopRight, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

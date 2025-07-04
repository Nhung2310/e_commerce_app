import 'package:e_commerce_app/enum/card_type.dart';

class PaymentCard {
  CardType? type;
  String? number;
  String? name;
  int? month;
  int? year;
  int? cvv;

  PaymentCard({
    this.type,
    this.number,
    this.name,
    this.month,
    this.year,
    this.cvv,
  });

  @override
  String toString() {
    return 'Card(type: $type, number: $number, name: $name, month: $month, year: $year, cvv: $cvv)';
  }
}

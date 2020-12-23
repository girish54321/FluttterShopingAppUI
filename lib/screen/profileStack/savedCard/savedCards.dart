import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:credit_card_slider/card_background.dart';
import 'package:credit_card_slider/card_company.dart';
import 'package:credit_card_slider/card_network_type.dart';
import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:credit_card_slider/validity.dart';
import 'package:flutter/material.dart';

class SavedCardsScreen extends StatefulWidget {
  @override
  _SavedCardsScreenState createState() => _SavedCardsScreenState();
}

class _SavedCardsScreenState extends State<SavedCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "Cards"),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: CreditCard(
                roundedCornerRadius: 6.0,
                cardBackground:
                    SolidColorCardBackground(Colors.black.withOpacity(0.6)),
                cardNetworkType: CardNetworkType.visaBasic,
                cardHolderName: 'The boring developer',
                cardNumber: '1234 **** **** ****',
                company: CardCompany.hdfc,
                // numberColor: Colors.black,
                // validityColor: Colors.black,
                // cardHolderNameColor: Colors.black,
                validity: Validity(
                  validThruMonth: 1,
                  validThruYear: 21,
                  validFromMonth: 1,
                  validFromYear: 16,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: CreditCard(
                roundedCornerRadius: 6.0,
                cardBackground: SolidColorCardBackground(Colors.grey[300]),
                cardNetworkType: CardNetworkType.visaBasic,
                cardHolderName: 'The boring developer',
                cardNumber: '1234 **** **** ****',
                company: CardCompany.icici,
                numberColor: Colors.black,
                validityColor: Colors.black,
                cardHolderNameColor: Colors.black,
                validity: Validity(
                  validThruMonth: 1,
                  validThruYear: 21,
                  validFromMonth: 1,
                  validFromYear: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

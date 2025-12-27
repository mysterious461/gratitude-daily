
import 'package:in_app_purchase/in_app_purchase.dart';

class IAPService {
  static const premiumId = 'gratitude_premium';
  final InAppPurchase _iap = InAppPurchase.instance;

  Future<void> buyPremium() async {
    final response = await _iap.queryProductDetails({premiumId});
    if (response.productDetails.isEmpty) return;

    final purchaseParam =
        PurchaseParam(productDetails: response.productDetails.first);
    _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PremiumManager {
  // IMPORTANT: do NOT change this ID later
  static const String premiumId = 'premium_lifetime';

  static final ValueNotifier<bool> isPremium =
      ValueNotifier<bool>(false);

  static final InAppPurchase _iap = InAppPurchase.instance;
  static StreamSubscription<List<PurchaseDetails>>? _subscription;

  /// Initialize purchase listener
  static Future<void> init() async {
    final purchaseStream = _iap.purchaseStream;

    _subscription = purchaseStream.listen(
      _handlePurchases,
      onDone: () => _subscription?.cancel(),
      onError: (error) {
        // Silently ignore for now
      },
    );

    // Will do nothing until product exists (safe)
    await restorePurchases();
  }

  /// Trigger purchase (will work AFTER product is created)
  static Future<void> buyPremium() async {
    final response =
        await _iap.queryProductDetails({premiumId});

    if (response.productDetails.isEmpty) {
      // Product not available yet — expected for now
      return;
    }

    final product = response.productDetails.first;
    final purchaseParam =
        PurchaseParam(productDetails: product);

    _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  /// Restore purchases (required by Google)
  static Future<void> restorePurchases() async {
    await _iap.restorePurchases();
  }

  static void _handlePurchases(List<PurchaseDetails> purchases) {
    for (final purchase in purchases) {
      if (purchase.productID == premiumId &&
          purchase.status == PurchaseStatus.purchased) {
        isPremium.value = true;
        _iap.completePurchase(purchase);
      }
    }
  }

  static void dispose() {
    _subscription?.cancel();
  }
}

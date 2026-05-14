// lib/app/models/customer_model.dart

class CustomerModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String avatarUrl;
  final DateTime joinedDate;
  final double totalSpent;
  final int totalOrders;
  final bool isActive;

  const CustomerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatarUrl,
    required this.joinedDate,
    required this.totalSpent,
    required this.totalOrders,
    this.isActive = true,
  });

  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }
}

// ── Bill Models ───────────────────────────────────────────────────────────────

class BillItemModel {
  final String productId;
  final String productName;
  final String unit;
  final int quantity;
  final double unitPrice;

  const BillItemModel({
    required this.productId,
    required this.productName,
    required this.unit,
    required this.quantity,
    required this.unitPrice,
  });

  double get subtotal => quantity * unitPrice;
}

enum BillStatus { pending, paid, cancelled }

class BillModel {
  final String id;
  final String billNumber;
  final String customerId;
  final String customerName;
  final List<BillItemModel> items;
  final DateTime createdAt;
  final BillStatus status;
  final double discount;
  final double taxRate;
  final String notes;

  const BillModel({
    required this.id,
    required this.billNumber,
    required this.customerId,
    required this.customerName,
    required this.items,
    required this.createdAt,
    required this.status,
    this.discount = 0.0,
    this.taxRate = 0.18,
    this.notes = '',
  });

  double get subtotal => items.fold(0, (sum, item) => sum + item.subtotal);
  double get discountAmount => subtotal * (discount / 100);
  double get taxableAmount => subtotal - discountAmount;
  double get taxAmount => taxableAmount * taxRate;
  double get totalAmount => taxableAmount + taxAmount;

  String get statusLabel {
    switch (status) {
      case BillStatus.pending:
        return 'Pending';
      case BillStatus.paid:
        return 'Paid';
      case BillStatus.cancelled:
        return 'Cancelled';
    }
  }
}

// ── Analytics Model ───────────────────────────────────────────────────────────

class AnalyticsData {
  final String label;
  final double value;
  final double previousValue;

  const AnalyticsData({
    required this.label,
    required this.value,
    required this.previousValue,
  });

  double get growthPercent =>
      previousValue == 0 ? 0 : ((value - previousValue) / previousValue) * 100;

  bool get isPositive => value >= previousValue;
}

class ChartData {
  final String label;
  final double value;

  const ChartData({required this.label, required this.value});
}

// ── Product Request Model ─────────────────────────────────────────────────────

enum RequestStatus { pending, approved, rejected, fulfilled }

class ProductRequestModel {
  final String id;
  final String customerId;
  final String customerName;
  final String productName;
  final int quantity;
  final String notes;
  final DateTime requestedAt;
  final RequestStatus status;

  const ProductRequestModel({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.productName,
    required this.quantity,
    required this.notes,
    required this.requestedAt,
    required this.status,
  });
}
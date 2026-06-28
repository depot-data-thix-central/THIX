// 📁 lib/models/thix_sante/hospital/invoice_model.dart

/// Billing domain models used by the hospital admin module.
///
/// These models are intentionally backend-agnostic: they can be serialized to
/// JSON for Supabase (or any REST backend) and also used locally.
class InvoiceItem {
  final String description;
  final int quantity;
  final double unitPrice;
  final double total;

  const InvoiceItem({
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.total,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    final quantity = (json['quantity'] as num?)?.toInt() ?? 0;
    final unitPrice = (json['unit_price'] as num?)?.toDouble() ?? (json['unitPrice'] as num?)?.toDouble() ?? 0.0;
    final total = (json['total'] as num?)?.toDouble() ?? (quantity * unitPrice);

    return InvoiceItem(
      description: (json['description'] as String?)?.trim() ?? '',
      quantity: quantity,
      unitPrice: unitPrice,
      total: total,
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'quantity': quantity,
        'unit_price': unitPrice,
        'total': total,
      };

  InvoiceItem copyWith({
    String? description,
    int? quantity,
    double? unitPrice,
    double? total,
  }) {
    final nextQuantity = quantity ?? this.quantity;
    final nextUnitPrice = unitPrice ?? this.unitPrice;
    return InvoiceItem(
      description: description ?? this.description,
      quantity: nextQuantity,
      unitPrice: nextUnitPrice,
      total: total ?? (nextQuantity * nextUnitPrice),
    );
  }
}

class InvoiceModel {
  final String id;
  final String number;
  final String patientId;
  final String patientName;
  final DateTime date;
  final List<InvoiceItem> items;
  final double amount;
  final String status; // pending | paid | cancelled
  final String? notes;

  const InvoiceModel({
    required this.id,
    required this.number,
    required this.patientId,
    required this.patientName,
    required this.date,
    required this.items,
    required this.amount,
    required this.status,
    required this.notes,
  });

  static DateTime _parseDate(dynamic raw) {
    if (raw == null) return DateTime.fromMillisecondsSinceEpoch(0);
    if (raw is DateTime) return raw;
    if (raw is String) {
      final parsed = DateTime.tryParse(raw);
      return parsed ?? DateTime.fromMillisecondsSinceEpoch(0);
    }
    if (raw is int) return DateTime.fromMillisecondsSinceEpoch(raw);
    if (raw is num) return DateTime.fromMillisecondsSinceEpoch(raw.toInt());
    return DateTime.fromMillisecondsSinceEpoch(0);
  }

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    final List<InvoiceItem> items;
    if (rawItems is List) {
      items = rawItems.whereType<Map>().map((e) => InvoiceItem.fromJson(e.cast<String, dynamic>())).toList();
    } else {
      items = const [];
    }

    return InvoiceModel(
      id: (json['id'] as String?) ?? '',
      number: (json['number'] as String?) ?? '',
      patientId: (json['patient_id'] as String?) ?? (json['patientId'] as String?) ?? '',
      patientName: (json['patient_name'] as String?) ?? (json['patientName'] as String?) ?? '',
      date: _parseDate(json['date']),
      items: items,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      status: (json['status'] as String?) ?? 'pending',
      notes: (json['notes'] as String?),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'patient_id': patientId,
        'patient_name': patientName,
        'date': date.toIso8601String(),
        'items': items.map((e) => e.toJson()).toList(),
        'amount': amount,
        'status': status,
        'notes': notes,
      };

  InvoiceModel copyWith({
    String? id,
    String? number,
    String? patientId,
    String? patientName,
    DateTime? date,
    List<InvoiceItem>? items,
    double? amount,
    String? status,
    String? notes,
  }) {
    return InvoiceModel(
      id: id ?? this.id,
      number: number ?? this.number,
      patientId: patientId ?? this.patientId,
      patientName: patientName ?? this.patientName,
      date: date ?? this.date,
      items: items ?? this.items,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }
}


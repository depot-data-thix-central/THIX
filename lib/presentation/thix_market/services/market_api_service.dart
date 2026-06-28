import 'dart:convert';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class MarketApiService {
  final SupabaseClient _supabase = Supabase.instance.client;
  static const String baseUrl = 'https://your-project.supabase.co/functions/v1';

  // Generic API call with error handling
  Future<Map<String, dynamic>> _callEdgeFunction(
    String functionName,
    Map<String, dynamic> params,
  ) async {
    try {
      final response = await _supabase.functions.invoke(
        functionName,
        body: params,
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw ApiException('Failed to call $functionName: ${e.toString()}');
    }
  }

  // Get recommended products for user
  Future<List<Map<String, dynamic>>> getRecommendedProducts({
    required String userId,
    int limit = 20,
  }) async {
    try {
      final result = await _callEdgeFunction('recommendations', {
        'user_id': userId,
        'limit': limit,
      });
      return List<Map<String, dynamic>>.from(result['products'] ?? []);
    } catch (e) {
      return [];
    }
  }

  // Get similar products
  Future<List<Map<String, dynamic>>> getSimilarProducts({
    required String productId,
    String? category,
    int limit = 10,
  }) async {
    try {
      final result = await _supabase.rpc('get_similar_products', params: {
        'product_id': productId,
        'category': category,
        'limit': limit,
      });
      return List<Map<String, dynamic>>.from(result);
    } catch (e) {
      return [];
    }
  }

  // Get shop statistics
  Future<Map<String, dynamic>> getShopStatistics({
    required String shopId,
    String period = 'week',
  }) async {
    try {
      final result = await _supabase.rpc('get_shop_statistics', params: {
        'shop_id': shopId,
        'period': period,
      });
      return result as Map<String, dynamic>;
    } catch (e) {
      throw ApiException('Failed to get shop statistics: $e');
    }
  }

  // Get user activity
  Future<Map<String, dynamic>> getUserActivity({
    required String userId,
    int limit = 20,
  }) async {
    try {
      final result = await _supabase.rpc('get_user_activity', params: {
        'user_id': userId,
        'limit': limit,
      });
      return result as Map<String, dynamic>;
    } catch (e) {
      return {'activities': [], 'total': 0};
    }
  }

  // Track product view
  Future<void> trackProductView(String productId) async {
    try {
      await _supabase.rpc('increment_product_views', params: {
        'product_id': productId,
      });
    } catch (e) {
      // Silently fail - analytics not critical
    }
  }

  // Get flash sales
  Future<List<Map<String, dynamic>>> getFlashSales() async {
    try {
      final response = await _supabase
          .from('products')
          .select('*, shop:shops(name, logo_url)')
          .eq('is_flash_sale', true)
          .gt('flash_sale_end', DateTime.now().toIso8601String())
          .order('flash_sale_price', ascending: true)
          .limit(20);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      return [];
    }
  }

  // Get promo banners
  Future<List<Map<String, dynamic>>> getPromoBanners() async {
    try {
      final response = await _supabase
          .from('promo_banners')
          .select()
          .eq('is_active', true)
          .order('sort_order', ascending: true);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      return [];
    }
  }

  // Search with pagination
  Future<SearchResult> search({
    required String query,
    Map<String, dynamic>? filters,
    int page = 0,
    int limit = 20,
  }) async {
    try {
      var filter = _supabase
          .from('products')
          .select('*, shop:shops(name, rating)')
          .eq('status', 'active')
          .ilike('title', '%$query%');

      if (filters != null) {
        if (filters['min_price'] != null) {
          filter = filter.gte('price', filters['min_price']);
        }
        if (filters['max_price'] != null) {
          filter = filter.lte('price', filters['max_price']);
        }
        if (filters['min_rating'] != null) {
          filter = filter.gte('rating', filters['min_rating']);
        }
        if (filters['category'] != null && filters['category'] != 'all') {
          filter = filter.eq('category', filters['category']);
        }
        if (filters['free_shipping'] == true) {
          filter = filter.eq('free_shipping', true);
        }
      }

      dynamic transform = filter;
      final sortBy = filters?['sort_by'];
      switch (sortBy) {
        case 'price_asc':
          transform = filter.order('price', ascending: true);
          break;
        case 'price_desc':
          transform = filter.order('price', ascending: false);
          break;
        case 'rating':
          transform = filter.order('rating', ascending: false);
          break;
        case 'newest':
          transform = filter.order('created_at', ascending: false);
          break;
        default:
          transform = filter.order('created_at', ascending: false);
      }

      final response = await transform.range(page * limit, (page + 1) * limit - 1);
      final items = List<Map<String, dynamic>>.from(response);
      return SearchResult(
        items: items,
        total: items.length,
        hasMore: items.length == limit,
      );
    } catch (e) {
      throw ApiException('Search failed: $e');
    }
  }
}

class SearchResult {
  final List<Map<String, dynamic>> items;
  final int total;
  final bool hasMore;

  SearchResult({required this.items, required this.total, required this.hasMore});
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);
  @override
  String toString() => 'ApiException: $message';
}

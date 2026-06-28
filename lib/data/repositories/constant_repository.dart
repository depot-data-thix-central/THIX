// 📁 lib/data/repositories/constant_repository.dart

import 'package:thix_id/data/repositories/base_repository.dart';
import 'package:thix_id/models/thix_sante/health/constant_model.dart';

class ConstantRepository extends BaseRepository {
  Future<List<ConstantModel>> getConstants({String? patientId}) async {
    return execute(() async {
      var query = client.from('constants').select('*').order('date', ascending: false);
      if (patientId != null && patientId.isNotEmpty) query = query.eq('patient_id', patientId);
      final response = await query;
      return (response as List).map((json) => ConstantModel.fromJson(json as Map<String, dynamic>)).toList();
    }, operationName: 'getConstants');
  }
}

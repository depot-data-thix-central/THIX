// 📁 lib/data/repositories/symptom_repository.dart

import 'package:thix_id/data/repositories/base_repository.dart';
import 'package:thix_id/models/thix_sante/health/symptom_model.dart';

class SymptomRepository extends BaseRepository {
  Future<List<SymptomModel>> getSymptoms({String? patientId}) async {
    return execute(() async {
      var query = client.from('symptoms').select('*').order('date', ascending: false);
      if (patientId != null && patientId.isNotEmpty) query = query.eq('patient_id', patientId);
      final response = await query;
      return (response as List).map((json) => SymptomModel.fromJson(json as Map<String, dynamic>)).toList();
    }, operationName: 'getSymptoms');
  }

  Future<SymptomModel?> addSymptom(SymptomModel symptom) async {
    return execute(() async {
      final response = await client.from('symptoms').insert(symptom.toJson()).select().maybeSingle();
      return response == null ? null : SymptomModel.fromJson(response);
    }, operationName: 'addSymptom');
  }

  Future<bool> deleteSymptom(String id) async {
    return execute(() async {
      await client.from('symptoms').delete().eq('id', id);
      return true;
    }, operationName: 'deleteSymptom');
  }
}

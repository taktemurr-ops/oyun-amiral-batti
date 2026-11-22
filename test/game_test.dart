import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_amiral_batti/oyun_amiral_batti.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(amiralConfig.title.length, 33);
    expect(amiralConfig.tagline.length, 33);
    for (final s in amiralConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: amiralId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = amiralRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '../.env')
abstract class Env {
  const Env._();
  @EnviedField(varName: 'APP_KEY', obfuscate: true)
  static final String appKey = _Env.appKey;
  @EnviedField(varName: 'APP_NAME', obfuscate: true)
  static final String appName = _Env.appName;
}

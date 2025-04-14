import '../core/constants/api_constants/api_constants.dart';

enum Environment { development, qa, production, uat }

abstract class AppEnvironment {
  static late String policyBaseUrl;
  static late String policyName;
  static late String serviceBaseUrl;
  static late String authBaseUrl;
  static late String clientID;

  static late Environment _environment;

  static Environment get environment => _environment;

  static setupEnvironment(Environment env) {
    _environment = env;

    switch (env) {
      case Environment.development:
        {
          serviceBaseUrl = ApiConstants.serviceDevBaseUrl;
          break;
        }
      case Environment.qa:
        {
          serviceBaseUrl = ApiConstants.serviceQaBaseUrl;
          break;
        }
      case Environment.production:
        {
          serviceBaseUrl = ApiConstants.serviceProdBaseUrl;

          break;
        }
      case Environment.uat:
        {
          serviceBaseUrl = ApiConstants.serviceProdBaseUrl;
          break;
        }
    }
  }
}

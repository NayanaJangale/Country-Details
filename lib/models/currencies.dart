import 'package:country_details/handlers/string_handlers.dart';

class Currencies {
  String code,name,symbol;
  Currencies({
    this.code,
    this.name,
    this.symbol,
  });

  Currencies.fromMap(Map<String, dynamic> map) {
    code = map[CurrenciesNames.code] ?? StringHandlers.NotAvailable;
    name = map[CurrenciesNames.name] ?? StringHandlers.NotAvailable;
    symbol = map[CurrenciesNames.symbol] ?? StringHandlers.NotAvailable;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    CurrenciesNames.code: code,
    CurrenciesNames.name: name,
    CurrenciesNames.symbol: symbol,
      };
}

class CurrenciesNames {
  static const String code = "code";
  static const String name = "name";
  static const String symbol = "symbol";
}

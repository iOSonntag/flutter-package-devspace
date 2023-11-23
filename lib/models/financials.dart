// ignore_for_file: constant_identifier_names, camel_case_types

part of devspace;


enum kCurrency
{
  EUR,
  USD,
}

extension ExtensionOnCurrency on kCurrency
{
  String get symbol
  {
    return switch(this)
    {
      kCurrency.EUR => '€',
      kCurrency.USD => '\$',
    };
  }

  String get name
  {
    return switch(this)
    {
      kCurrency.EUR => 'Euro',
      kCurrency.USD => 'US Dollar',
    };
  }

  String get code
  {
    return switch(this)
    {
      kCurrency.EUR => 'EUR',
      kCurrency.USD => 'USD',
    };
  }

  String get flag
  {
    return switch(this)
    {
      kCurrency.EUR => '🇪🇺',
      kCurrency.USD => '🇺🇸',
    };
  }

  int get decimals
  {
    return switch(this)
    {
      kCurrency.EUR => 2,
      kCurrency.USD => 2,
    };
  }
}

class Price {

  final kCurrency currency;
  final double value;

  const Price(this.value, {
    this.currency = kCurrency.EUR,
  });


  String format({
    bool omitDecimalsIfZero = true,
    bool symbolRight = true,
  })
  {
    String? result;

    if (omitDecimalsIfZero && value % 1 == 0)
    {
      result = value.toInt().toString();
    }
    else
    {
      result = value.toStringAsFixed(currency.decimals);
    }

    if (symbolRight)
    {
      return '$result ${currency.symbol}';
    }
    
      return '${currency.symbol} $result';
  }


  @override
  String toString()
  {
    return '${currency.symbol} ${value.toStringAsFixed(currency.decimals)}';
  }
}
const String getDetailCountryInfo= r'''
query GetDetailCountryInfo($code:ID!) {
  country(code: $code) {
    name
    native
    capital
    emoji
    currency
    languages {
      code
      name
    }
  }
}
''';
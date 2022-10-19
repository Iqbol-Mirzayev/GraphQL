const String getMinCountryInfo = r'''
query GetMinCountryInfo($code:String!){
  country(code: $code) {
    code
    name
    emoji
  }
}
''';
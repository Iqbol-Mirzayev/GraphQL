const String getAllCountryInfoQuery = '''
query {
  countries {
    code
    name
    emoji
  }
}
''';
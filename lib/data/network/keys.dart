dynamic url =
    'https://zrguuflnjngcikcxuiyo.supabase.co'.split('').reversed.toList();

dynamic anonKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpyZ3V1Zmxuam5nY2lrY3h1aXlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgwOTYwMTIsImV4cCI6MjA1MzY3MjAxMn0.cTBYidPZGMsibk0ETnpxmb-qfdlMAj_IHwkg3B0MP6I"
        .split('')
        .reversed
        .toList();

void correlateKeys() {
  url = (url as List).reversed.toList().join('');
  anonKey = (anonKey as List).reversed.toList().join('');
}

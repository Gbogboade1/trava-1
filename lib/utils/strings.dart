const pubKey = """
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAg1UfPDRuDqyJsQSKh/Yy
EWRYff2srsrekdqtuzdoUuHs2JONGQ9f/lS7RMTqT+BElhfphDqzF5PgXYvR9thb
5aBZTWPXhC2WpFNakD0rbsm2FgxkzT7zkctNQ0pbjyUVv4/9V1aJo/Vyqn1aYxF1
efgNp1AOY9y/toxYHovQpWsSdfNyoy/4YoMrAP0EaI7DG9D0y9lNMR6MTgYDZuZc
a8gh0ZG/PgafBclj5mvf2aVKfLzdXC2HqFSezhxvSyy8Bz74HmWt4fziWnA4w9XO
QHhnwMhmXkb8leZPJ2K0Z9Awxhcf5QNulkT3u0pzP5CjjH0xX4isGtbELIfHduao
bwIDAQAB
-----END PUBLIC KEY-----
""";
const prikey = """
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAg1UfPDRuDqyJsQSKh/YyEWRYff2srsrekdqtuzdoUuHs2JON
GQ9f/lS7RMTqT+BElhfphDqzF5PgXYvR9thb5aBZTWPXhC2WpFNakD0rbsm2Fgxk
zT7zkctNQ0pbjyUVv4/9V1aJo/Vyqn1aYxF1efgNp1AOY9y/toxYHovQpWsSdfNy
oy/4YoMrAP0EaI7DG9D0y9lNMR6MTgYDZuZca8gh0ZG/PgafBclj5mvf2aVKfLzd
XC2HqFSezhxvSyy8Bz74HmWt4fziWnA4w9XOQHhnwMhmXkb8leZPJ2K0Z9Awxhcf
5QNulkT3u0pzP5CjjH0xX4isGtbELIfHduaobwIDAQABAoIBAATlSGvLHIspfVx+
6dcVo1oonm/b4/MEFvXi6/T9pMLqLxUHswvLGe32JKD0ojNmDch2jbrjIUfwuD1k
d+g2un490vZikWcY9/OaM9cKoLLZjBMYVS2deiDmLjQi8nTMkhn4+R2nWSwmeybF
03e77+AjEgc5ob+xO+hHJQXGenmgDQaHJdamETp3VQHMr7Uic46g7D3bIHRdD8AZ
shvyO3Tc/lsBXuH0PWzTQXD+qULxGugZCqU+Y75HO9yXgtTGWRvvUOD2WRCKBeCr
glQy08RCy5w+UbGQ07HFcGXUF4nYkDdI5EdKHL4EIIeh3pvky9aavcUt8vmzUm+C
9GfZhMkCgYEA7dAevlDXqPUBn7qaeb5l2p6TX7tkNn4QG9V+xDLHhoInuq3nQ0HL
JCrZDW7zVpizaImXo8pMpXpcVD2XDsHpoxxRitQ5fzPvMcVCgrpTUjpBbLkt1xH2
8espWdoEkcDgQq0a6g9sXoHkB1BShDZ1EVcdfYsOtLwpeQegvfiRoh0CgYEAjWBW
ZR9Sj0sTkhKL4VgX3B2fXTwdqXUtPETSC17WssxX3afwSSDlTa8rntmK88LYVHaO
dcsxyDoF5jHbeDBG/JhPHCdb282wzYlm0kGOOXlRtx9LItp1AUcspVHtV/8N5K63
uVNmpZmvKNHUYom/EgJis7vGjQunGMILngARrvsCgYEAh24ANA3B4xw0IoyYMEC3
rHqmHtyOw2GjNtasbHsmmXlButQSYYD0eNJV7YqD1Yr8kMnaq5IneA1oyyiP//16
WkNkRJV7cO9YhpV5vQzzKl62p34FlvdKFJcBY4P/GionDJGcRDMoWeHKxEd/1n9U
x90+lCI+67pEPAKWDdmixhkCgYBfFTTl6+wN3ZN7Aag8VZAuhWnCPgVBDELxLuQJ
q65AMHjD5ggQVuSBm9d9jZgLm7b9D4N+q7t+i6+eA1g0/Fsx1YoXSE1ahntrsQaL
UHXEJ9kSjSRue3iH9IONaI11Sl/gtrVwGiyGIdeRX5Y086mjBiG1+gtunzCx0QgZ
Kri58wKBgQCo+ivJCHifcjMGCd+nO02H9TreaNAMw7cDMri8G0JGUq2OjZPndcDZ
MmpceceMAXycUyqEg3E6d17gzwIoH8Z3JYPWr2j7MFAzCmScvwJD67P7NYZ7zoBe
hdd8poc4yagLHFU1Njbp0WDRvBVk6GnjhCxbFDGQ0XB2REVTkMK99g==
-----END RSA PRIVATE KEY-----
""";
const String appName = 'Payment Card Demo';
const String fieldReq = 'This field is required';
const String pay = 'Validate';
const String numberIsInvalid = 'Card is invalid';
const String completeProfile = '''You cannot request for a loan while My current profile information is incomplete.\n\nTo access loans request, you need to update My profile.''';
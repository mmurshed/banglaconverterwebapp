---
topic: Node.js Bangla Ascii to Unicode converter
languages:
  - javascript
  - nodejs
---

# Node.js Bangla Ascii to Unicode converter

A simple webapp for converting ASCII to Unicode Bangla. Once the webapp is running you can get the string converted by calling http://localhost:1337/?bangla=‡U÷, where the ASCII string is `‡U÷`. It should respond with the Unicode result `টেস্ট`.

You can also specify a format parameter, `format=bijoy`. Currently supported formats are `boisakhi`, `bangsee`, `bornosoft`, `nukta`, `phonetic`, `htmlsafehex`, `htmlsafedec`. A sample call looks like this: http://localhost:1337/?bangla=‡U÷&format=bijoy.

An example use case is available in the `example` folder. In this case, strings in an Excel file is converted to Unicode. While the webapps is running on localhost, a VBA macro makes a rest call from the cell content and returns the Unicode string.

import 'package:flutter/cupertino.dart';

class TimeToTextConverter {
  int hours;

  static const deMap = {
    0 : "null",
    1 : "eine",
    2 : "zwei",
    3 : "drei",
    4 : "vier",
    5 : "fünf", 
    6 : "sechs",
    7: "sieben",
    8: "acht",
    9: "neun",
    10: "zehn",
    11: "elf",
    12: "zwölf",
    13: "dreizehn",
    14: "vierzehn",
    15: "fünfzehn",
    16: "sechzehn",
    17: "siebzehn",
    18: "achtzehn",
    19: "neunzehn",
    20: "zwanzig",
    21: "einundzwanzig",
    22: "zweiundzwanzig",
    23: "dreiundzwanzig",
    24: "vierundzwanzig",
    25: "fünfundzwanzig",
    26: "sechsundzwanzig",
    27: "siebenundzwanzig",
    28: "achtundzwanzig",
    29: "neunundzwanzig",
    30: "dreißig",
    31: "einunddreißig",
    32: "zweiunddreißig",
    33: "dreiunddreißig",
    34: "vierunddreißig",
    35: "fünfunddreißig",
    36: "sechsunddreißig",
    37: "siebenunddreißig",
    38: "achtunddreißig",
    39: "neununddreißig",
    40: "vierzig",
    41: "einundvierzig",
    42: "zweiundvierzig",
    43: "dreiundvierzig",
    44: "vierundvierzig",
    45: "fünfundvierzig",
    46: "sechsundvierzig",
    47: "siebenundvierzig",
    48: "achtundvierzig",
    49: "neunundvierzig",
    50: "fünfzig",
    51: "einundfünfzig",
    52: "zweiundfünfzig",
    53: "dreiundfünfzig",
    54: "vierundfünfzig",
    55: "fünfundfünfzig",
    56: "sechsundfünfzig",
    57: "siebenundfünfzig",
    58: "achtundfünfzig",
    59: "neunundfünfzig",
    60: "sechzig"
  };

  static const plMap = {
    0 : "zero",
    1 : "",
    2 : "dwa",
    3 : "trzy",
    4 : "cztery",
    5 : "pięć",
    6 : "sześć",
    7: "siedem",
    8: "osiem",
    9: "dziewięć",
    10: "dziesięć",
    11: "jedenaście",
    12: "dwanaście",
    13: "trzynaście",
    14: "czternaście",
    15: "piętnaście",
    16: "szesnaście",
    17: "siedemnaście",
    18: "osiemnaście",
    19: "dziewiętnaście",
    20: "dwadzieścia",
    21: "dwadzieścia jeden",
    22: "dwadzieścia dwa",
    23: "dwadzieścia trzy",
    24: "dwadzieścia cztery",
    25: "dwadzieścia pięć",
    26: "dwadzieścia sześć",
    27: "dwadzieścia siedem",
    28: "dwadzieścia osiem",
    29: "dwadzieścia dziewięć",
    30: "trzydzieści",
    31: "trzydzieści jeden",
    32: "trzydzieści dwa",
    33: "trzydzieści trzy",
    34: "trzydzieści cztery",
    35: "trzydzieści pięć",
    36: "trzydzieści sześć",
    37: "trzydzieści siedem",
    38: "trzydzieści osiem",
    39: "trzydzieści dziewięć",
    40: "czterdzieści",
    41: "czterdzieści jeden",
    42: "czterdzieści dwa",
    43: "czterdzieści trzy",
    44: "czterdzieści cztery",
    45: "czterdzieści pięć",
    46: "czterdzieści sześć",
    47: "czterdzieści siedem",
    48: "czterdzieści osiem",
    49: "czterdzieści dziewięć",
    50: "pięćdziesiąt",
    51: "pięćdziesiąt jeden",
    52: "pięćdziesiąt dwa",
    53: "pięćdziesiąt trzy",
    54: "pięćdziesiąt cztery",
    55: "pięćdziesiąt pięć",
    56: "pięćdziesiąt sześć",
    57: "pięćdziesiąt siedem",
    58: "pięćdziesiąt osiem",
    59: "pięćdziesiąt dziewięć",
  };

  
  var mapLocales = { "de": deMap,  "pl" : new Map() };

  convertStringToString(int hour, int minutes, int seconds, String language) {

    switch(language){
      case "de":
        return "Es ist " + deMap[hour] + " Uhr " + deMap[minutes] + " Minuten und " + deMap[seconds] + " Sekunden" ;
      case "pl":

        return "Jest" + plMap[hour] + " godzina i" + plMap[minutes] + " minut i " + plMap[seconds] + " sekund";
      default:
        return "unsupported language";
    }
  }



}
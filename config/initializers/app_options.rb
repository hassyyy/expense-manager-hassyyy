module AppOptions
  MONTHS = Date::ABBR_MONTHNAMES.drop(1).freeze
  MIN_YEAR = 2022.freeze
  YEARS = Array(MIN_YEAR..Date.today.year).freeze
  CURRENCY_FORMAT = {
    unit: "₹",
    precision: 0,
    delimiter_pattern: /(\d+?)(?=(\d\d)+(\d)(?!\d))/,
    delimiter: ","
  }
end

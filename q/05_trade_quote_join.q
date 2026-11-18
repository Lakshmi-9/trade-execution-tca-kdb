/ ============================================================
/ 05_trade_quote_join.q
/ Purpose: Match each trade with the latest available quote
/          using an as-of join.
/ ============================================================


tradeWithQuote: aj[`sym`time;trade;quote]


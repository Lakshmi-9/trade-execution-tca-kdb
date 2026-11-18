/
n:1000
num:10000
symRef:([] sym:`AAPL`MSFT`GOOG`AMZN`NVDA; assetClass:5#`EQUITY; currency:5#`USD);

quote:([] date:num#2026.11.05 2026.11.06 2026.11.07 2026.11.08 2026.11.09 ; time:num?09:30+til 7; sym:num?`AAPL`U`AMZN`SHOP`WPRO`TSLA`GOOG`MSFT`ENRG`ALCTR; bid:num?500.0;
    ask:num?500.0; bidSize:num?2000; askSize:num?2000);

trade:([] date:n#2026.11.05 2026.11.06 2026.11.07 2026.11.08 2026.11.09;
    time:n#09:30 09:32 09:33 09:34 09:35 09:36;
    sym:n?`AAPL`U`AMZN`SHOP`WPRO`TSLA`GOOG`MSFT`ENRG`ALCTR;
    tradeId:n#`T001`T002`T003`T004`T005`T006`T007;
    price:n?500f;
    qty:n?500;
    side:n?`BUY`SELL;
    broker:n?`B1`B2`B3`B4`B5;
    venue:n?`NYSE`NASDAQ`TSE);
\


syms:`AAPL`U`AMZN`SHOP`WPRO`TSLA`GOOG`MSFT`ENRG`ALCTR
brokers:`B1`B2`B3`B4`B5
venues:`NYSE`NASDAQ`TSE
dates:2026.11.05 2026.11.06 2026.11.07 2026.11.08 2026.11.09

basePrices:490 440 329 253 358 400 300 420 60 200



symRef:([] 
    sym:syms;
    assetClass:10#`EQUITY;
    currency:10#`USD;
    basePrice:basePrices
    )

quoteSym:nQuotes?syms
quoteBase:basePrices[syms?quoteSym]
quoteMid:quoteBase+(nQuotes?2f)-1f
spread:0.02+nQuotes?0.08
bid:quoteMid-spread%2
ask:quoteMid+spread%2

quote:([] date:nQuotes?dates;time:nQuotes?09:30+ til 390;sym:quoteSym;bid:bid; ask:ask;bidSize:100+nQuotes?4900;askSize:100+nQuotes?4900)


tradeSym:nTrades?syms
tradeBase:basePrices[syms?tradeSym]
tradeMid:tradeBase+(nTrades?2f)-1f
tradeSide:nTrades?`BUY`SELL
tradeDiff:0.01+nTrades?0.05
tradePrice:?[tradeSide=`BUY; tradeMid+tradeDiff; tradeMid-tradeDiff]
venues:`NYSE`NASDAQ`TSE
brokers:`B1`B2`B3`B4`B5

trade:([] date:nTrades?dates;
         time:nTrades?09:30+ til 390; 
         sym:tradeSym; tradeId:`$"T",/:string 1+til nTrades;
         price:tradePrice; 
         qty:100+nTrades?4900;
         side:tradeSide;
         broker:nTrades?brokers; 
         venue:nTrades?venues)
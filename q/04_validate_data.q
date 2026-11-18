
select from trade where null price

select from trade where null qty


select from trade where qty<=0

select from trade where not side in `BUY`SELL

select count i by tradeId from trade

select from (select count i by tradeId from trade) where x>1


select from quote where null bid

select from quote where null ask

select from quote where bid>ask

select from quote where bidSize<0 or askSize<0

quote:`sym`time xasc quote

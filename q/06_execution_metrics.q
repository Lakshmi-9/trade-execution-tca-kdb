/ ============================================================
/ 06_execution_metrics.q
/ Purpose: Calculate execution quality metrics such as
/          midpoint, execution difference and BPS.
/ ============================================================

cols tradeWithQuote

tradeMetrics: update  mid:0.5*bid+ask from tradeWithQuote

select tradeId,sym,price,bid,ask,mid from tradeMetrics

calculateDiff:{[s;p;m] 
                 ?[s=`BUY;p-m;m-p]}


slippage:update execDiff:calculateDiff[side;price;mid] from tradeMetrics 


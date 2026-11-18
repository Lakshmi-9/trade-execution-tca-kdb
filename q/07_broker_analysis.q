/ ============================================================
/ 07_broker_analysis.q
/ Purpose: Compare execution quality across brokers.
/ ============================================================


select noOfTrades:count i,totalQty:sum qty,avgExecDiff:avg execDiff by broker from slippage

/ Convert execution difference to basis points

slippage:update execDiffBps:10000*execDiff%mid from slippage

select avgExecDiffBps:avg execDiffBps by broker from slippage


select avgExecDiffBps:avg execDiffBps by broker,side from slippage

select avgExecDiffBps:avg execDiffBps by sym,broker from slippage

select maxExecCost:max execDiffBps by broker from slippage

select minExecCost:min execDiffBps by broker from slippage

brokerReport:select noOfTrades:count i,totalQty:sum qty,avgExecDiffBps:avg execDiffBps,maxExecBps:max execDiffBps,minExecBps:min execDiffBps by broker from slippage


`avgExecDiffBps xasc brokerReport
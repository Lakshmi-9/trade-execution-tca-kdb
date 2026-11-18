/ ============================================================
/ 08_time_analysis.q
/ Purpose: Analyze execution quality across trading sessions.
/ ============================================================


(`Morning`Midday`Afternoon)[09:00 11:00 14:00 bin slippage`time]


update session:(`Morning`Midday`Afternoon)[09:00 11:00 14:00 bin slippage`time] from `slippage

timeReport:select noOfTrades:count i,totalQty:sum qty, avgExecDiffBps:avg execDiffBps, maxExecBps:max execDiffBps by session from slippage




`orderColumn xasc update orderColumn:`Morning`Midday`Afternoon?session from `timeReport

timeReport:select session,noOfTrades,totalQty,avgExecDiffBps,maxExecBps from `orderColumn xasc update orderColumn:`Morning`Midday`Afternoon?session from timeReport
/ ============================================================
/ 09_tca_report.q
/ Purpose: Generate overall Trade Cost Analysis (TCA) reports.
/ ============================================================


overallReport:select noOfTrades:count i,totalQty:sum qty,avgExecDiffBps:avg execDiffBps,maxExecBps:max execDiffBps,minExecBps:min execDiffBps from slippage


overallReport

timeReport
brokerReport

brokerReport


bestBroker:select from brokerReport where avgExecDiffBps=min exec avgExecDiffBps from brokerReport


worstBroker:select from brokerReport where avgExecDiffBps=max exec avgExecDiffBps from brokerReport


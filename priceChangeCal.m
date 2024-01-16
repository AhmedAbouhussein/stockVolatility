function spikeStd = priceChangeCal(undlyp,M)
% Calculate price change as implemented in Table 3.4 of Augen.
% you need at least N + 2 data points (including current day) to calculate
% N-day volatility. M is used to indicate the window and flags for error if
% the M + 2 = N + 2 condition is violated  

N = length(undlyp);

if (N ~= M + 2)
    netInt = M + 2;
    error('ERROR: You need %i data points for a %i-day price change window', netInt, M)
end



window   = N-2;
spikeday = N;

spikeperiod = (spikeday-window-1):(spikeday-1);
pc         = diff(log(undlyp(spikeperiod))); % price change
pcd  = undlyp(spikeday) - undlyp(spikeday-1);
stdpc = std(pc);
stdDev1 = stdpc*undlyp(spikeday-1);
spikeStd = pcd/stdDev1;


end
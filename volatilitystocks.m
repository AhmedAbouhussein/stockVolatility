% this script aims to compute prices change of in standard deviatons. 
% It follows Table 3.4 and Figure 3.6 of Augen

ticker = 'VZ';
endDate = [ 15 9 2021 ];
windowN = 10; %window for price change calculations
N = windowN*10; %get data for past N days

pcvec = zeros(N,1);
[dS,mS,yS] = findStartDate(endDate(1),endDate(2),endDate(3),N);

for k = 1:N
    i = N+1-k;
    [dS,mS,yS] = findStartDate(endDate(1),endDate(2),endDate(3),i);
    stockData = getHistDataWrapper(ticker,[dS,mS,yS], windowN+2);
    pcvec(k) = priceChangeCal(stockData.Close,windowN);
    
end
x = length(pcvec):-1:1;
bar(x,pcvec)
set ( gca, 'xdir', 'reverse' )

xlabel('previous trading days')
ylabel('price change in StdDev')
title(['price change behaviour for ',ticker])
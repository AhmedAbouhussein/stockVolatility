function stockData = getHistDataWrapper(ticker, stopdate, N)
% get the exact ammount of trading data for N trading days from
% stopdate. 
% stopdate format is [dd mm yy] 


endD = stopdate(1);
endM = stopdate(2);
endY = stopdate(3);

Ndays = N;

[startD,startM,startY] = findStartDate(endD,endM,endY,Ndays);

startdata = strcat(num2str(startD,'%02.f'),num2str(startM,'%02.f'),num2str(startY));
stopdata = strcat(num2str(endD,'%02.f'),num2str(endM,'%02.f'),num2str(endY));

stockData = hist_stock_data(startdata, stopdata, ticker); % this is not my 
% script. I downloaded it from the Matlab file exchange

while (length(stockData.Open) < N)
    
    Ndays = Ndays + 1;
    
    
    [startD,startM,startY] = findStartDate(endD,endM,endY,Ndays);

    startdata = strcat(num2str(startD,'%02.f'),num2str(startM,'%02.f'),num2str(startY));
    stopdata = strcat(num2str(endD,'%02.f'),num2str(endM,'%02.f'),num2str(endY));

    stockData = hist_stock_data(startdata, stopdata, ticker);


end

end

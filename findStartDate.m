function [dS,mS,yS] = findStartDate(dC,mC,yC,N)
% find the date (dS,mS,yS) which is N trading days away from the input date
% given by dC/mC/yC. This script may not count holidays and other 
% non-trading days

Ndays = N; %days away from end date

% dummy vars to get YTD

endDd = dC;
endMd = mC;
endYd = yC;
mat = [];

for k = 1:12 
    
    
    
    if (endMd+1-k <= 0)
        endMd = 13;
        endYd = endYd - 1;
    end
        
    calM = calendar(endYd,endMd+1-k);
    tradCalMmat = calM(1:end,2:end-1)';
    monthvec = ones(length(nonzeros(tradCalMmat)),1)*(endMd+1-k);
    yearvec  = ones(length(nonzeros(tradCalMmat)),1)*(endYd);
    mat = [[nonzeros(tradCalMmat) monthvec yearvec]; mat];
    
    if (k == 1)
        ind = find(mat == endDd);
        mat = mat(1:ind,:);
    end  
        
    
end

dS = mat(end-Ndays,1);
mS = mat(end-Ndays,2);
yS = mat(end-Ndays,3);




end

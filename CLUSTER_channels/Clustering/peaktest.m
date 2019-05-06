load(fullfile(matlabroot,'examples','signal','spots_num.mat'))
[pks,locs] = findpeaks(avSpots);
plot(year,avSpots,year(locs),pks,'or')
xlabel('Year')
ylabel('Number')
axis tight
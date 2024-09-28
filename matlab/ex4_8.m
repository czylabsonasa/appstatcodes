% example 4.8, two ships, none of them waits

clc; clear; clf;

% exact computation
% plot
% by hand, favourable area / total area = (23^2/2 + 22^2/2)/24^2

p_hand=(23^2/2 + 22^2/2)/24^2;

% approximate computation
% by simulation:
N=100000;

% N random points on a unit square
sim=24*rand(2,N);
sim=cumsum((sim(1,:)+1<sim(2,:)) | (sim(2,:)+2<sim(1,:))) ./ (1:N);
plot(1:N, sim, ".", [1,N],[p_hand, p_hand],"r");
axis([1,N,0.7*p_hand, 1.3*p_hand]);
yt=(0.7:0.05:1.3)*p_hand;
yticks(yt);

legend(["simulation", "theoretical"],"Location","northeastoutside");
text(N,p_hand,"  p="+strip(string(rats(p_hand))));
title(sprintf("example 4.8\n two ships, none of them waits"));


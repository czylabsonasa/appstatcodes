% sum of two dice - DISTRIBUTION

clc; clear; clf;

% exact
% by hand
% sum->#num.of pairs
% 2->#1, 3->#2, 4->#3,...7->#6, 8->#5, ..., 12->#1
d_hand=[1:6, 5:-1:1]/36;

% by computer
outcomes=(1:6)+(1:6)'; outcomes=outcomes(:); % flatten it
d_comp=hist(outcomes, 2:12); % frequency computation
d_comp=d_comp/36;

assert(all(d_hand==d_comp));


% by simulation
N=10000;
sim=sum(randi(6,2,N));
d_sim=hist(sim, 2:12);
d_sim=d_sim/N;

% plot
bar(2:12, d_comp,"w");
hold on;
plot(2:12,d_sim, "r*")

legend(["theoretical","simulation"],"Location","northeastoutside");
title(sprintf("example X\n distribution of the sum of two dice"));

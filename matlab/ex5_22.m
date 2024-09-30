clc; clear; clf;

tit="example 5.22\nUlysses, triple turnout, Bayes";

% exact computation
% by hand 
% turnout weights
p_1=[1,1,1]/3; 
% lying weights
p_2=1-[2/3,1/2,0];

% Bayes theorem (weight of perfect cars from factory 4 / total weight of perfect cars)
p_hand=p_1(1)*p_2(1)/dot(p_1,p_2);

% approximate computation
% by simulation:
N=100000;

% simulate w/ loop
rN=0; % it is the real N, counting only the truth telling cases
sim=zeros(1,N);
for road=datasample(1:3,N,"Weights",p_1)
  if rand()<p_2(road)
    rN=rN+1;
    sim(rN)=(road==1);
  end
end

% adjust
sim=sim(1:rN); N=rN;
sim=cumsum(sim) ./ (1:N);

simplot(sim,p_hand,tit); %drawnow included

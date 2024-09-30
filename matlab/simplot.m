function simplot(sim, p_hand, tit)
  N=length(sim);
  plot(1:N, sim, ".", [1,N],[p_hand, p_hand],"r");
  axis([1,N,0.7*p_hand, 1.3*p_hand]);
  yt=(0.7:0.05:1.3)*p_hand;
  yticks(yt);
  
  legend(["simulation", "theoretical"],"Location","northeastoutside");
  text(N,p_hand,"  p="+strip(string(rats(p_hand))));
  title(sprintf(tit));
  drawnow;
end
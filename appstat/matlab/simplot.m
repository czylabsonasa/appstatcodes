function simplot(sim, tline, tit)
  N=length(sim);
  plot(1:N, sim, ".", [1,N],[tline, tline],"r");
  
  % handle negative tline
  tmp=sort([0.7*tline, 1.3*tline]);
  axis([1,N,tmp]);
  
  yt=sort((0.7:0.05:1.3)*tline);
  yticks(yt);
  
  legend(["simulation", "theoretical"],"Location","northeastoutside");
  text(N,tline,"  p="+strip(string(rats(tline))));
  title(sprintf(tit));
end
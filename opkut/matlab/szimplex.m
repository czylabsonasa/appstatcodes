function [mutat, csere, hanyados]=szimplex(obj,lhs,rhs,benn,kinn)
  % szimplex(obj,lhs,rhs,benn,kinn)
  % obj: a célfüggvény sorvektora -  a 0 együtthatókat be kell írni
  % lhs: az egyenlőséges alak együttható mátrixa
  % rhs: egyenlőséges alak jobboldala (oszlopvektor)
  % benn: a bázisban levő vektorok indexei (oszlopvektor)
  % kinn: a bázison kívüli vektorok indexei (sorvektor)

  mtx = [lhs,rhs];
  % zk-ck
  alsosor=obj(benn)*mtx-[obj(kinn),0];
  mtx = [mtx; alsosor];
  [R,C]=size(mtx);

  tmtx=mtx; % simple copy will be used for temp results


  kinn="x"+string(kinn);
  benn="x"+string(benn);

  loc=configureDictionary("string", "int16");
  for i=1:numel(benn)
    loc(benn(i))=i;
  end
  for i=1:numel(kinn)
    loc(kinn(i))=-i;
  end

  function mutat0()
    disp(array2table(mtx,"VariableNames",[kinn,"b"], "RowNames", [benn; "z-c"] ));
  end

  function hanyados0(xk)
    j=loc(xk);
    assert(j<0); % it is a member of kinn
    j=-j;
    disp(array2table(mtx(1:R-1,C)./mtx(1:R-1,j), "VariableNames", "b/"+xk, "RowNames", benn));
  end

  function csere0(xb,xk)
    jb=loc(xb);
    assert(jb>0);
    jk=loc(xk);
    assert(jk<0);
    jk=-jk;

    % cserék
    benn(jb)=xk;
    loc(xk)=jb;
    
    kinn(jk)=xb;
    loc(xb)=-jk;

    piv=mtx(jb,jk);
    assert(~(piv==0));
    tmtx(jb,jk)=1/piv;
    for r=1:R
      for c=1:C
        w=2*(r==jb)+(c==jk);
        switch w
          case 3
            tmtx(r,c)=1/piv;
          case 2
            tmtx(r,c)=mtx(r,c)/piv;
          case 1
            tmtx(r,c)=-mtx(r,c)/piv;
          otherwise
            tmtx(r,c)=mtx(r,c)-mtx(r,jk)*mtx(jb,c)/piv;
        end
      end
    end

    mtx=tmtx;
    mutat0();
    

  end

  mutat=@mutat0;
  csere=@csere0;
  hanyados=@hanyados0;
end
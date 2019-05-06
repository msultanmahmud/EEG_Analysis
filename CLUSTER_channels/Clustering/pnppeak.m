function [p, tp]=pnppeak(t, pks,locs, pkst,locst)
% pks=[-0.147456256	-0.130175787	0.71812185	1.29467529	1.165935872	-0.085471633 -0.252924361	-0.054772734	0.193877784	0.603747246];
% locs=[3	9	25	38	45	56	69	75	82	92];

    tip1=find(t(locs)>=40 & t(locs)<=70);
    p1m=max(pks(tip1));
    tp1m=(p1m==pks);
    tip1m=find(tp1m);
    tp1=t(locs(tip1m));

    
    tin1=find(t(locst)>=90 & t(locst)<=145);
    n1m=max(pkst(tin1));
    tn1m=(n1m==pkst);
    tin1m=find(tn1m);
    tn1=t(locst(tin1m));

    tip2=find(t(locs)>145 & t(locs)<=175);
    p2m=max(pks(tip2));
    tp2m=(p2m==pks);
    tip2m=find(tp2m);
    tp2=t(locs(tip2m));
    
 p=[p1m,-n1m,p2m];
tp=[tp1,tn1,tp2];
end
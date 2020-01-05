function kids = th_crossover( parents, options, NVARS, FitnessFcn, thisScore, thisPopulation )
verification=th_getGlobalVerification();
control=th_getGlobalControl();
nKids = length(parents)/2;
kids = zeros(nKids,NVARS);
index = 1;
i=1;
while (i<=nKids)
    parent1=thisPopulation(parents(index),:);
    parent2=thisPopulation(parents(index+1),:);    
    p=sort(randi([1 length(parent1)],1,3));
    child=parent1;
    child(p(1):p(2))=parent2(p(1):p(2));
    child(p(3):length(parent1))=parent2(p(3):length(parent1));
    if th_constraint(child, verification, control)
        kids(i,:)=child;
        index=index+2;
        i=i+1;
        display(i);
    end
end
end


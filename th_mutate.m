function mutants = th_mutate( parents, options, NVARS, FitnessFcn, state, thisScore, thisPopulation, mutationRate )
verification=th_getGlobalVerification();
control=th_getGlobalControl();
mutants=zeros(length(parents),NVARS);
nMutants=length(parents);
i=1;
nMutation=round(NVARS*mutationRate);
while (i<=nMutants)
    parent=thisPopulation(parents(i),:);
    p=ceil(randperm(length(parent),nMutation));
    child=parent;
    order=randperm(nMutation);
    for j=1:nMutation
        child(p(j))=parent(p(order(j)));
    end
    if th_constraint(child, verification, control)
        mutants(i,:)=child;
        i=i+1;
    end
end
end


function pop = th_creation( NVARS,~, options)
%set population size
totalPopulationSize = sum(options.PopulationSize);
%get the number of variables
n = NVARS;
%set traceability matrix to verification
verification=th_getGlobalVerification();
%set affected requirement list to control
control=th_getGlobalControl();
%create initial population matrix
pop = zeros(totalPopulationSize, n);

i=1; %set i to 1 for a controlled start of while
% create defined number of solutions that provide full coverage of
% requirements
while (i<=totalPopulationSize)
    %create a random solution
    chr = round(rand(1,n));
    %if the solution provide full coverage add to matrix otherwise omit it
    if th_constraint(chr, verification, control)
        pop(i,:)=chr;
        i=i+1;
        display(i);
    end
% alternative solution for performance
%     chr=th_alternative2CustomizedGA(54,40,0.7,0.2,@th_alternative2Creation,7/54);
%     pop(i,:)=chr;
%     i=i+1;
end
end


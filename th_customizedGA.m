function [x,fval,exitflag,output,population,score] = th_customizedGA(nvars,PopulationSize,CrossoverFraction,MigrationFraction,CreationType, mutationRate)
%Start with the default options
options = gaoptimset(@ga);
%Modify options setting
options = gaoptimset(options,'PopulationType', 'bitstring');
options = gaoptimset(options,'PopulationSize', PopulationSize);
options = gaoptimset(options,'CrossoverFraction', CrossoverFraction);
options = gaoptimset(options,'MigrationFraction', MigrationFraction);
options = gaoptimset(options,'CreationFcn', CreationType);
options = gaoptimset(options,'StallGenLimit', 20);
%set crossover function to customized crossover function
options = gaoptimset(options,'CrossoverFcn', @th_crossover);
%set mutation function to customized mutation function
options = gaoptimset(options,'MutationFcn', {@th_mutate mutationRate});
options = gaoptimset(options,'Display', 'off');
options = gaoptimset(options,'Generations', 120);
%use problem specific fitness function in GA
[x,fval,exitflag,output,population,score] = ...
ga(@th_fitness,nvars,[],[],[],[],[],[],[],[],options);


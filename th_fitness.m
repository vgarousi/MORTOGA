function y = th_fitness(chromosome)
testCostList=th_getGlobalTestCostValue;
x=size(testCostList,1);
fitness=zeros(54,1);
for i=1:1:x
if testCostList(i,10)
    fitness(i,1)=sum(testCostList(i,1:9))+sum(testCostList(testCostList(i,10),1:9));
else
    fitness(i,1)=sum(testCostList(i,1:9));
end
end
y=abs(chromosome*fitness);



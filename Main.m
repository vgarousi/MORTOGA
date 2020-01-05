%get traceability matrix
th_setGlobalVerification(xlsread('file_name','sheet name'));
%get affected requirement list
controlSet=xlsread('file_name','sheet name');
%get cost and benefit values of each test case
th_setGlobalTestCostValue(xlsread('file_name','sheet name'));

%create a fitness_value vector - 5 is the number of versions
fitness_value = zeros(5,1);
%create a test suite matrix
testSuites=zeros(5,54);

for i=1:1:5 % 5 is the number of versions
    %set the specific affected requirement list for each version
    th_setGlobalControl(controlSet(:,i));
    %run GA with customized creation function
    [x,fval,exitflag,output,population,score]=th_customizedGA(54,40,0.7,0.2,@th_creation,7/54);
    %get fitness value
    fitness_value(i)=fval;
    %get test suite
    testSuites(i,:)=x;     
end

    

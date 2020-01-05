function output = th_constraint( chromosome, verification, control )
    %control the coverage of solution 
    if logical((logical(chromosome*verification'))'.*control)==control
        output=1;
    else
        output=0;
    end
end


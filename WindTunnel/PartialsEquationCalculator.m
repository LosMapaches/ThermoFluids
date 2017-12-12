function equation = PartialsEquationCalculator(f,varlist,varerror)
n = numel(varlist);
sig = vpa(ones(1,n));
for i = 1:n
    sigu(i) = varerror(i).*diff(f,varlist(i),1);
end

equation=matlabFunction((sum(sigu.^2)).^(1./2));

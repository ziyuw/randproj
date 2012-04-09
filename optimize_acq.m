function x_max = optimize_acq(model, type, si)

if nargin < 2
	type = 'ei';
end

if nargin < 3
	si = 1;
end

problem.f = @(x)-1*acq(model, x', type, si);
[ret_minval, x_max, history] = direct(problem, model.bounds, model.dopt);

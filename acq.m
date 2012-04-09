function acq = acquisition(model, x, type, si)

if nargin < 4
	si = 1;
end

if nargin < 3
	type = 'ucb';
end

[mu, var] = gp_pred(model.gp, model.X, model.f, x);
sigma = sqrt(var);

if strcmp('ucb', type)
	acq = mu+2*log((model.n)^2*model.dim*pi^2/(6*0.1))*sigma;
elseif strcmp('ei', type)
	Z = (mu - model.max_val)/sigma;
	acq = (mu - model.max_val)*normcdf(Z, 0, 1) + sigma*normpdf(Z,0,1);
end

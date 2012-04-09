function model = init_model(init_pt, init_value)

lik = lik_gaussian('sigma2', 0.001^2);
gpcf = gpcf_sexp('lengthScale', ones(size(init_pt))*0.1, 'magnSigma2', 1^2)

% Set some priors
pn = prior_fixed();
lik = lik_gaussian(lik,'sigma2_prior', pn);
pl = prior_gaussian();
pm = prior_fixed('s2', 0.1^2);
gpcf = gpcf_sexp(gpcf, 'lengthScale_prior', pl, 'magnSigma2_prior', pm);

% Following lines do the same since the default type is FULL
model.gp = gp_set('type','FULL','lik',lik,'cf',gpcf);

model.n = 1;
model.X = [init_pt];
model.f = [init_value];

model.dopt.maxevals = 500;
model.dopt.maxits = 100;
model.dopt.showits = 0;


model.bounds = [-5*ones(size(init_pt))', 5*ones(size(init_pt))'];
model.dim = size(init_pt, 2);


model.max_val = init_value;

model.opt=optimset('TolFun',1e-1,'TolX',1e-1,'Display','off', 'MaxFunEvals', 50);


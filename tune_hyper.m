function model = tune_hyper(model)

model.gp=gp_optim(model.gp, model.X, model.f,'optimf',@fminscg,'opt', model.opt);
init_pt = rand(1,4);
init_value = objective(init_pt);


model = init_model(init_pt, init_value);


for i =1:200
	x_max = optimize_acq(model)';
	val = objective(x_max);

	model = update_model(model, val, x_max);
	
	if i >= 40
		model = tune_hyper(model);
		
		[w,s]=gp_pak(model.gp);
		% display exp(w) and labels
		disp(s), disp(exp(w))
	end
	
	disp([x_max, val])
end


[w,s]=gp_pak(model.gp);
% display exp(w) and labels
disp(s), disp(exp(w))


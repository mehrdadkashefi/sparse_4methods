function [X] = BP_func(Y,D)
m = length(D);

F = ones([2*m , 1]);
Aeq = [D , -D];
beq = Y;
lb = zeros([2*m , 1]);
ub = inf([2*m , 1]);

Options = optimoptions('linprog', 'Algorithm', 'dual-simplex', 'Display', 'off');
UV1 = linprog(F, [], [], Aeq, beq, lb, ub, Options);
X = UV1(1:m) - UV1(m + 1:end);

end


% Sparse representation
%
% Comparing different algorithms with noise added to signal
%
%      date            programmer             version
%     =======         ===========            =========
%   06/10/2019       Mehrdad Kashefi       original code
%  ..........................................................
% ...........................................................

%% Clearing
clear;
clc;
close all;
% Normalized Mean Squered Error Function
MSE = @(x,y) (1/length(N))* norm(x-y)^2;

% Parameters
dim = 100;
sparse_dim = 200;
iteration = 50;
D = rand(dim,sparse_dim);
temp = zeros(iteration,4,3);
average_error = zeros(sparse_dim,4,3);
% Noise Parameter
noise_amp = 0.4;
%% Sparsity loop
for k=1:sparse_dim
    for iter=1:iteration % Averaging iteration times to make errors smooth
        % Create a vector with length sparse_dim and k sparsity
        x = zeros(sparse_dim,1);
        x(randi(sparse_dim,k,1)) = rand(k,1); 
        y = D*x + noise_amp*randn(size(D*x));


        % Basic Pursuit with linear programming
        tic;
        x_bp = basic_pursuit(y,D);
        y_bp = D*x_bp;
        time = toc;
        temp(iter,1,:) =abs([snr(x,x-x_bp),mse(y,y_bp), time]);  

        % Focuss Method
        lambda = 1e-10;
        tic
        [x_focuss, ~, ~, ~] = tMFOCUSS(D, y, lambda);
        y_focuss = D*x_focuss;
        time = toc;
        temp(iter,2,:) = abs([snr(x,x-x_focuss), mse(y,y_focuss), time]);

        % SL0 
        sigma_min=0;
        sigma_decrease_factor=0.5;
        tic
        x_sl0 = SL0_func( y,D, sigma_min, sigma_decrease_factor);
        y_sl0 = D*x_sl0;
        time = toc;
        temp(iter,3,:) = abs([snr(x,x-x_sl0),mse(y,y_sl0), time]);

        %Orthogonal Matching pursuit
        tic;
        [x_omp ,~]= s_omp(y,D,k);
        y_omp = D*x_omp;
        time = toc;
        temp(iter,4,:) = abs([snr(x,x-x_omp),mse(y,y_omp),time]);
        disp(['Working on k: ',num2str(k),' iteration: ',num2str(iter)])
    end
    average_error(k,:,:) = squeeze(mean(temp,1));
end

save('average_error_noisy.mat','average_error')
figure(1)
hold on
plot(average_error(:,1,1),'LineWidth',2)
plot(average_error(:,2,1),'LineWidth',2)
plot(average_error(:,3,1),'LineWidth',2)
plot(average_error(:,4,1),'LineWidth',2)
title('SNR for Different k Sparse Signals')
legend("Basic Pursuit","Focuss","SL0","Orthogonal Matching Pursuit")
xlabel("k")
ylabel("SNR")

figure(2)
hold on
plot(average_error(:,1,2),'LineWidth',2)
plot(average_error(:,2,2),'LineWidth',2)
plot(average_error(:,3,2),'LineWidth',2)
plot(average_error(:,4,2),'LineWidth',2)
title('Reconstruction MSE for Different k Sparse Signals')
legend("Basic Pursuit","Focuss","SL0","Orthogonal Matching Pursuit")
xlabel("k")
ylabel("Reconstruction MSE")

figure(3)
hold on
plot(average_error(:,1,3),'LineWidth',2)
plot(average_error(:,2,3),'LineWidth',2)
plot(average_error(:,3,3),'LineWidth',2)
plot(average_error(:,4,3),'LineWidth',2)
title('Consumed Time for Different k Sparse Signals')
legend("Basic Pursuit","Focuss","SL0","Orthogonal Matching Pursuit")
xlabel("k")
ylabel("Time in Second")

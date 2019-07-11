% Plot Sparse representation
%
% Only Ploting Sparse and Sparse_noisy program
%
%      date            programmer             version
%     =======         ===========            =========
%   06/10/2019       Mehrdad Kashefi       original code
%  ..........................................................
% ...........................................................
clear;
clc;
close all;
try
    load('average_error_noiseless.mat')
    load('average_error_noisy.mat')
    disp("Saved files have been found!")
    answer = input('Do you want to plot noisy or noiseless results.\n Enter 1 for noiseless 2 for noisy');
    while 1
        if answer == 1
            load('average_error_noiseless.mat')
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
            break
        elseif answer == 2
            load('average_error_noisy.mat')
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
            break
        else
            clc;
            disp("Your answer is not valid.")
            answer = input('Do you want to plot noisy or noiseless results.\n Enter 1 for noiseless 2 for noisy');
        end
    end
catch
    disp("No data Found! please run Sparce.m and Sparce_noisy.m ")
end

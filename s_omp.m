function  [X ,supp]= s_omp(Y,phi,K)
% S OMP algorithm by J A Tropp
% Y = phi * X + N
%  K is the order of sparsity (rowsparsity)
% Y is the measurment matrix(M*L). L is the number of Observations
% phi is sensing matrix (M*N)
% this algorithm recovers sparse matrix after K iterations
% R is the residual

R=Y;
[~,L]=size(Y);
[~,N]=size(phi);
lambda=zeros(1,K);
X=zeros(N,L);

if L==1
    for i=1:K
        
        [~,ind]=max(abs(R'*phi));
        lambda(i)=ind;
        P = pinv(phi(:,lambda(1:i)));
        temp=P*Y;
        X(lambda(1:i),:)=temp;
        R=Y-phi*X;
        
    end
else
    for i=1:K
        
        [~,ind]=max(sum(abs(R'*phi)));
        lambda(i)=ind;
        P = pinv(phi(:,lambda(1:i)));
        temp=P*Y;
        X(lambda(1:i),:)=temp;
        R=Y-phi*X;
        
    end
end
supp=lambda;
end


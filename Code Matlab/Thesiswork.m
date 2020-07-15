clc;clear;
data = xlsread('francis_data'); %Calling the data
x = data(:,1); % 1st column
x = x(~isnan(x)); %removing all NaN in the 1st column

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
BM = data(:,2); % calling the second row
BM = BM(~isnan(BM)); %removing all NaN in the 2nd row
N = length(BM); % the number of entries in BM
mu = mean(BM);
disp(['The mean value for BM is ',num2str(mu)]) %mean of BM
stdvi = std(BM);  %Standard deviation of BM
disp(['The standard deviation  for BM is ',num2str(stdvi)])
var = stdvi^2;
disp(['The variance  for BM is ',num2str(var)])
%Computing the confidence interval for BM
ysem = stdvi/sqrt(N);
confit = tinv([0.025 0.975],N-1);
yconfit = bsxfun(@times,ysem,confit(:))';
disp(['The 95 confidence interval for BM is ',num2str(yconfit)])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
VM = data(:,3); % calling the second row
VM = VM(~isnan(VM));  
mu_v = mean(VM);
disp(['The mean value for VM is ',num2str(mu_v)])
stdvi_v = std(VM);
disp(['The standard deviation for VM is ',num2str(stdvi_v)])
var_v = stdvi_v^2;
disp(['The variance  for VM is ',num2str(var_v)])
%Computing the confidence interval for VM
ysem_v = stdvi_v/sqrt(N);
confit_v = tinv([0.025 0.975],N-1);
yconfit_v = bsxfun(@times,ysem_v,confit_v(:))';
disp(['The 95 confidence interval for VM is ',num2str(yconfit_v)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(x,BM)
hold on
plot(x,VM)
hold off
grid
title('Jitter')
ylabel('Jitter(MS)') 
xlabel('time per second') 
legend('BM','VM')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
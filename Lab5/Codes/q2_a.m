clear;
close all;

ite=1e5;

% normal radnom variables to simulate
X= zeros(ite,1);
Y= zeros(ite,1);

for i=1:ite

% generate two uniform random variable instances    
u1= rand(1);
u2= rand(1);


% forulae to obtain two independent uniform random variables
X(i)= sqrt(-2*log(u1))*cos(2*3.14*u2); % will rand be independent in same statement?

Y(i)= sqrt(-2*log(u1))*sin(2*3.14*u2);

end


% change the parameters of (0,1) normal distribution X such that mean = 5,
% standard deviation = 10
X = X * 10 + 5;

% change the parameters of (0,1) normal distribution Y such that mean = 100,
% standard deviation = 10
Y = Y * 10 + 100;

% checking mu and sigma
meanX = mean(X)
stdX = std(X)

meanY = mean(Y)
stdY = std(Y)


% histogram to check the nature of pdf
hist(X,100);
title('Histogram Random Variable X, mean=5, SD=10','FontSize',16);
xlabel('Values taken by X','FontSize',16);
ylabel('Frequency Count','FontSize',16);


figure

hist(Y,100);
title('Histogram Random Variable Y, mean=100, SD=10','FontSize',16);
xlabel('Values taken by Y','FontSize',16);
ylabel('Frequency count','FontSize',16);

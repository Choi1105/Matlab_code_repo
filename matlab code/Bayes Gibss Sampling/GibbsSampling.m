%% Gibbs Sampling
% Linear Regression model
% Y = b1 + x2*b2 + e, Y = Xb + e, e ~ iidN(0, Sig2)

%% Step 0: Set up
clear;
clc;
addpath('C:\Users\PC\OneDrive - 전북대학교\문서\MATLAB\M_library');

%% Step 0 : Data Generating Process
% Sample size
T = 200;

% True value
beta1 = 1;
beta2 = 2;
sig2 = 0.5;

% Independent/Dependent variable
x1m = ones(T,1);
x2m = 5*rand(T,1);

Ym = x1m*beta1 + x2m*beta2 + sqrt(sig2)*randn(T,1);

%% Step 1: Prior
% Data
Y = ym;       % 영업이익 차분    
X = [x1m, x2m];

% Information
[T, k] = size(X);

% beta prior
beta_0 = zeros(k,1);
B_0 = 100*eye(k);

% sig2 prior
% mean = d_0/v_0
v_0 = 3;
d_0 = 3;

%% Step 2: Sampling
n0 = 10000;
n1 = 10000;
[betam,sig2m] = Bayes_linear_N(Y,X,beta_0,B_0,v_0,d_0,n0,n1);

%% Step 3: Result
MHm = [betam sig2m];

alpha = 0.05;
maxac = 200;
is_plot = 0;
postmom = MHout(MHm, alpha, maxac, is_plot);

% Display
disp('==========================================');
disp(['   Mean''   S.E.' '     2.5%' '     97.5%']);
disp('==========================================');
disp([postmom(:,2) postmom(:,3) postmom(:,4) postmom(:,6)]);

%% Step 4: OLS Estimation and Results
printi = 1;
[bhat, sig2hat, stde, t_val, Yhat, ehat, varbhat, mY, TSS, RSS, R2, R2_,SC, AIC] = OLSout(Y,X,printi);
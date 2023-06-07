%% MATLAB Assignment 2
% Ajinkya Joshi, EECE2520 Fundamentals of Linear Systems, March 18th, 2023 

%% QUESTION 1
%Part a: 

u_1 = @(n) (n >= 0);
n = 1:10;
x_1 = u_1(n-1) - u_1(n-4);
h_1 = u_1(n-6) - u_1(n-11);

y_1 = conv(x_1,h_1); 

%Part b: 
% The output generated looks similar but it is not identical. This is
% because the areas of partial overal have an exact value of 2 while the 
% plot had the value of n. 


%% QUESTION 2
u_2 = @(t) (t>=0);
t = 0:4;
x_2 = u_2(t-2) - u_2(t-4);
h_2 = exp(-2*t).*u_2(t);

y_2 = conv(x_2,h_2); 


%% QUESTION 3

delta = @(n) (n==0); 
n = 0:5;
x_3 = u_1(n-1) - u_1(n-4); % same expression as x(n) in question 1
h_3 = delta(n) - delta(n-1) + 2*delta(n-2) + delta(n-4);

%Part a:
y_3 = x_3.*(n+1);

%Part b: 
w_1 = conv(y_3, h_3);

%part c: 
n = 0:10;
x_4 = u_1(n-1) - u_1(n-4);
h_4 = delta(n) - delta(n-1) + 2*delta(n-2) + delta(n-4);

y_4 = conv(x_4,h_4);
y_4(12:21)=[];

w_2 = y_4.*(n+1);

% w2 and w1 are not identical. but are similar. They both display a similar
% trend based on the outputs. It was expected that the curves have to be
% identical as through convolution and the leftward shift, the outputs
% should be the exact same. 



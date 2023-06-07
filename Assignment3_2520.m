%% MATLAB Assignment 3
% Ajinkya Joshi, EECE2520 Fundamentals of Linear Systems, April 15th, 2023 

%% Question 1

% predefined delta and unit step functions. 
delta= @(n) (n==0);
u = @(n) (n>=0);

%%% Part a

% part a defined perameters for the functions. 
n = -20:20;
x = delta(n); 
a = [1 -0.7];
b = 1; 

%setting values for x and y
x = delta(n);
y = filter(b,a,x);

%plotting for y
figure(1) %plot of one part compared to the analytical response. 
stem(n,y)
xlabel('n')
ylabel('y[n]')
ylim([-2 2]);
title('Plot of the Impulse Response')

%derrived analytical expresssion comparison 
k = 0.7;
h = k.^n .* (n>=0);

%plotting for h[n] 
figure(2)
stem(n, h)
ylim([-2 2]);
xlabel('n')
ylabel('h[n]')
title('Plot of the Impulse Response Computed Analytically')

% The analytical plot is identical to 


%% Part b

%setting n range and x value. 
n = -30:30;
x = 5 .* (u(n+10) - u(n-10));
p = filter (b,a,x);


%plotting for the filter. 
figure(3)
stem(n, p);
ylim([-20 20]);
xlabel('n')
ylabel('y[n]')
title('Plot of the Discrete Time Low Pass Filter Output')


%% Part c
%defined values. 
a = [1 0.7];
n = -30:30;
x = delta(n); % reusing the part a input for x
y = filter(b,a,x);

%plotting the impulse response. 
figure(4)
stem(n, y);
ylim([-2 2]);
xlabel('n')
ylabel('h[n]')
title('Plot of the Impulse Response')

%% part d
x = 5 .* ( u(n + 10) - u(n - 10) );
y = filter(b,a,x);
%plot
figure(5)
stem(n, y);
ylim([-20 20]);
xlabel('n')
ylabel('y[n]')
title('Plot of the Band Pass Filter Output')

% The output is confirmed to be much smaller. 
% The following filter is determined to be a band pass filter. 


%% Question 2

% Defined variables. 
N = 1000;
k = 0.5;
a = 1;
b = [1 zeros(1, N-1), k];
x = delta(n);

%defined impulse responses. 
h = filter(b, a, x);
h_i = filter(a, b, x);
h_eq = filter(a, b, h);


%% part 1

% Plot of all responses. 
figure(6);

subplot(2, 2, 1)
stem(n, h);
title('1. Plot of the Echo System Impulse Response')
xlabel('n')
ylabel('h[n]')

subplot(2, 2, 2)
stem(n, h_i)
title('2. Plot of the Echo Removal System Impulse Response. ')
xlabel('n')
ylabel('h_1[n]')

subplot(2, 2, 3)
stem(n, h_eq)
title('3. Plot of the Net Impulse Response')
xlabel('n')
ylabel('h_{eq}[n]')

subplot(2, 2, 4)
stem(n, x);
title('4. Plot of Dirac Delta Function')
xlabel('n')
ylabel('d[n]')


%% part 2

% File provided by assignment
load lineup-3.mat

% Redefinition of the variables. 
b = 1;
a = [1 zeros(1, N-1), k];

% Playing the original sound
soundsc(y, 8192) 

% After playing this sound sample it is apperant that the output is
% "lineup" but it has been repeated many times in echo. 

% remove echoes
z = filter(b, a, y);
%play without echo
soundsc(z, 8192)

% Post filtering, only one "lineup" was observed. the sound was also a lot
% more clear than the first sample. This meant that lineup echo was cleaned
% up only outputting one sound sample of the word. 



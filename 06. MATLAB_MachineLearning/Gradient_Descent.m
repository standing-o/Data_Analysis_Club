clear ; clc ; close all;

E = @(w)(3*(w-2).^2 + 5) ; % cost function
eta = 0.1 ; w(1) = 5; % learning rate and initial condition
dE = @(w)(6 *(w-2));  % differentiation

for n=1:10
    w(n+1) = w(n) - eta * dE(w(n));
    E(w(n+1))
end

x = linspace(-1, 5) ;
plot(x, E(x));

hold on 
plot(w, E(w), 'o-')

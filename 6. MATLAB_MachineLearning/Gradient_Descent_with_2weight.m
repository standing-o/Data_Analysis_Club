clear ; clc ; close all;

E = @(w1,w2)(3*(w1-2).^2 + 2*(w2 - 3).^2 +3) ; % cost function
eta = 0.1 ; w1(1) = 8 ; w2(1) = 10; % learning rate and initial condition
dE1 = @(w1, w2)(6 *(w1-2));  % differentiation
dE2 = @(w1, w2)(4 *(w2-3));

for n=1:100
    w1(n+1) = w1(n) - eta * dE1(w1(n), w2(n));
    w2(n+1) = w2(n) - eta * dE2(w1(n), w2(n));
    E(w1(n+1), w2(n+1))
end

x = linspace(-1, 10) ;
y = linspace(-1, 10) ;

for ix = 1:length(x)
    for iy = 1:length(y)
        EE(ix,iy) = E(x(ix),y(iy));
    end
end

% for ix = 1:length(w1)
%         EEw(ix) = E(w1(ix),w2(ix));
%     end

subplot(1,2,1)
surf(x,y,EE')
shading interp;
colorbar;
colormap hot;
hold on

plot3(w1,w2,E(w1,w2),'go--')
alpha(0.7)

subplot(1,2,2)
contour(x,y,EE', [0:20:300])
hold on
plot3(w1,w2,E(w1,w2),'bo--')
axis image;

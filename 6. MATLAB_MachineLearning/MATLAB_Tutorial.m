% logical
x = [1 2 3 4 5];
y = [5 4 3 2 1];
x<y
x<=y
x==y
x>=y
x>y


% for
for x = 0:2:10
    a = 2^x
end

% if-else
a = 3;
if a<1
    b = a+1
else
    c = a+2
end    

% while
a = 1;
while a<4
    a = a+1
end 

% clear : variable clear
% clc : command clear
% clf : figure clear

% inline
f = inline('x.^3 + 6*x - 2', 'x');
f(3)
f([3 4 5])

% linspace
x = linspace(0, 5, 6)

t = linspace(0 , 2*pi , 100) ; 
x = 2*cos(t) ; y = 2*sin(t) ; 
plot(x,y) ; axis square

% ones, zeros
ones(3)
zeros(3)

% length
c = [1 2 3] ; length(c)

% sum
A = [1 2 3 ; 4 5 6 ; 7 8 9]
sum(A)

% absolute value
abs(-999)

% fprintf
fp = fopen('test.m' , 'w');
fprintf(fp, '%d %d\n' , 1,2);
fprintf(fp, '%f %f\n' , 3.5 , 4.5);
fprintf(fp, '%e\n' , 100,1000);
fclose(fp) ; 

% load
t = load('test.m');

% rand
r = rand(2,3)
rand('seed' , 3)
rand(2,3)
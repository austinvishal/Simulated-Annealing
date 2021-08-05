%% SA_2D Function

clear all;

%Set paremeters

X0 = [5,5];
Xmin = [-10,-10];
Xmax = [+10,+10];
Ti   = 5;
T_f   = 0.0001;
v    = 0.2;
max_iter = 600;
state=1000;

x1 = Xmin(1):0.2:Xmax(1);
x2 = Xmin(2):0.2:Xmax(2);
i = 1;
j = 1;
fx = zeros(length(x1),length(x2));

%Calculate the initial plot of the function

for X1 = x1
    for X2 = x2
        fx(i,j) = F2d([X1,X2]);
        j = j+1;
    end
    i = i+1;
    j=1;
   
end


%Calculate the simulated-annealing optimum
[X_opt,F_opt,Xint,NoEval]=sa2d( X0, Xmin, Xmax,Ti,v,T_f,max_iter, state);
display('Function 2');
X_opt
F_opt

%Calculate the intermediate optimum values
 for i=1:size(Xint,1)
     x11 = Xint(i,[1,2]);
     fx2(i) = F2d(x11);
 end

%Plot Results
figure;
%  subplot(1,2,1);
contour(x2,x1,fx);
xlabel('X2 axis');
ylabel('X1 axis');
drawnow();
hold on;

plot(Xint(:,2),Xint(:,1),'r*');
plot(X_opt(2),X_opt(1),'ko');
legend('Function contours','Intermediate optimum','Global optimum');
hold off;

%  subplot(1,2,2);
figure;
 plot(Xint(:,3),fx2,'r*');
 xlabel('Number of evaluations');
 ylabel('Function minimum');
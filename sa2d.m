function [X_opt,F_opt,Xint,NoEval]=sa2d(X0, Xmin, Xmax,Ti,v,T_f,max_iter, state)

%SIMULATED_ANNEALING Calculates optimum by simulated annealing
%   Parameter details:

%     X0       = Initial position
%     Xmin     = Lower limits
%     Xmax     = Upper limits
%     Ti       = Initial T value
%     v        = T variance parameter
%     T_f       = Final T value
%     max_iter = Maximum number of iterations

%   Output details:
%     Xopt     = The optimum value of X
%     Fopt     = The optimum value of the function
%     Xint    = The intermediate optimum values found by the algorithm
%     NoEval   = The total number of evaluations

%Set the random seed for repeatability
state=1000;
rand('state',state);


%Set the initial conditions 
T = Ti;
X=X0;
n=length(X0)
X_opt=X;
F_opt=F2d(X_opt);
NoEval = 1;
Xint=[X0,NoEval]


iter=0;

while T>T_f
    iter=1;
   
   
    while (iter< max_iter)
   
        deltaX = (rand(1,n)-0.5).*(Xmax-Xmin)*0.2;
        y = X + deltaX;
%         if( (y<Xmin) | (y>Xmax) )
%             continue;
%         end
       
        NoEval = NoEval+1;
        delta=F2d(y)-F2d(X);
        %If Y is a better estimate than X, replace X:->Y
        if (delta < 0)
             X=y;
             %If Y is a better estimate than Xopt, replace Xopt:->X, 
                if (F2d(X)< F_opt)
                    
                    X_opt=X
                    F_opt=F2d(X_opt);
                      Xint = [Xint;X,NoEval];
                 %If Y is worse than X, replace X:->Y only for a small fraction of
        %cases
                else
                        if (rand<exp(-delta/T))
                             X=y;
                 
                        end
                end
        end
             iter=iter+1;
%                 plot(X_opt,F(X_opt),'*r')
               
         
     end
     %Reduce the value of the parameter v
     T= v*T;  
     
end
end


 


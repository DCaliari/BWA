clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Description %%%%%%%%%%%%%%%%%%%
%%%% Depending on which domain is needed load different data
%%%% And at the end save different data as well

% load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Revealed Pref ALL\Revealed Preference Time\Variables Time ALL.mat')
% load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Revealed Pref MAIN\Revealed Preference Time\Variables Time MAIN.mat')
load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Revealed Pref MAIN\Revealed Preference Time\Variables Time Binary.mat')

S = {'x','y','z','w'};
Ns = 145; % Number of subjects

%% Bernheim and Rangel

BernRangDelayed = zeros(size(S,2),size(S,2),size(xRy,1));

for i=1:Ns
    if sum(xRy(i,:)) > 0 && sum(yRx(i,:)) > 0  || sum(xRy(i,:)) == 0 && sum(yRx(i,:)) == 0
        BernRangDelayed(1,2,i) = 0;
        BernRangDelayed(2,1,i) = 0;
    elseif  sum(xRy(i,:)) > 0 && sum(yRx(i,:)) == 0
        BernRangDelayed(1,2,i) = 1;
    elseif  sum(xRy(i,:)) == 0 && sum(yRx(i,:)) > 0
        BernRangDelayed(2,1,i) = 1;
    end
end


for i=1:Ns
    if sum(xRz(i,:)) > 0 && sum(zRx(i,:)) > 0  || sum(xRz(i,:)) == 0 && sum(zRx(i,:)) == 0
        BernRangDelayed(1,3,i) = 0;
        BernRangDelayed(3,1,i) = 0;
    elseif  sum(xRz(i,:)) > 0 && sum(zRx(i,:)) == 0
        BernRangDelayed(1,3,i) = 1;
    elseif  sum(xRz(i,:)) == 0 && sum(zRx(i,:)) > 0
        BernRangDelayed(3,1,i) = 1;
    end
end


for i=1:Ns
    if sum(zRy(i,:)) > 0 && sum(yRz(i,:)) > 0  || sum(zRy(i,:)) == 0 && sum(yRz(i,:)) == 0
        BernRangDelayed(2,3,i) = 0;
        BernRangDelayed(3,2,i) = 0;
    elseif  sum(zRy(i,:)) > 0 && sum(yRz(i,:)) == 0
        BernRangDelayed(3,2,i) = 1;
    elseif  sum(zRy(i,:)) == 0 && sum(yRz(i,:)) > 0
        BernRangDelayed(2,3,i) = 1;
    end
end



for i=1:Ns
    if sum(xRw(i,:)) > 0 && sum(wRx(i,:)) > 0  || sum(xRw(i,:)) == 0 && sum(wRx(i,:)) == 0
        BernRangDelayed(1,4,i) = 0;
       BernRangDelayed(4,1,i) = 0;
    elseif  sum(xRw(i,:)) > 0 && sum(wRx(i,:)) == 0
        BernRangDelayed(1,4,i) = 1;
    elseif  sum(xRw(i,:)) == 0 && sum(wRx(i,:)) > 0
        BernRangDelayed(4,1,i) = 1;
    end
end


for i=1:Ns
    if sum(wRy(i,:)) > 0 && sum(yRw(i,:)) > 0  || sum(wRy(i,:)) == 0 && sum(yRw(i,:)) == 0
        BernRangDelayed(4,2,i) = 0;
        BernRangDelayed(2,4,i) = 0;
    elseif  sum(wRy(i,:)) > 0 && sum(yRw(i,:)) == 0
        BernRangDelayed(4,2,i) = 1;
    elseif  sum(wRy(i,:)) == 0 && sum(yRw(i,:)) > 0
        BernRangDelayed(2,4,i) = 1;
    end
end

for i=1:Ns
    if sum(zRw(i,:)) > 0 && sum(wRz(i,:)) > 0  || sum(zRw(i,:)) == 0 && sum(wRz(i,:)) == 0
        BernRangDelayed(3,4,i) = 0;
        BernRangDelayed(4,3,i) = 0;
    elseif  sum(zRw(i,:)) > 0 && sum(wRz(i,:)) == 0
        BernRangDelayed(3,4,i) = 1;
    elseif  sum(zRw(i,:)) == 0 && sum(wRz(i,:)) > 0
        BernRangDelayed(4,3,i) = 1;
    end
end

%% Counting Revealed Preference
countrev = zeros(size(S,2),size(S,2),Ns);
for z = 1:Ns
    countrev(1,2,z) = ChXY(z,1);
    countrev(1,3,z) = ChXZ(z,1);
    countrev(1,4,z) = ChXW(z,1);
    countrev(2,3,z) = ChYZ(z,1);
    countrev(2,4,z) = ChYW(z,1);
    countrev(3,4,z) = ChZW(z,1);
    countrev(2,1,z) = ChYX(z,1);
    countrev(3,1,z) = ChZX(z,1);
    countrev(3,2,z) = ChZY(z,1);
    countrev(4,1,z) = ChWX(z,1);
    countrev(4,2,z) = ChWY(z,1);
    countrev(4,3,z) = ChWZ(z,1);
end


countsolDelayed = zeros(size(S,2),size(S,2),Ns);

for z=1:Ns
    for i = 1:size(S,2)
        for   j = 1:size(S,2)
            if choicearray(z,i) >= choicearray(z,j)
                countsolDelayed(i,j,z) = 1;
            else
                countsolDelayed(i,j,z) = 0;
            end
        end
    end
end

for z=1:Ns
for i = 1:size(S,2)
    for j= 1:size(S,2)
        if i==j
            countsolDelayed(i,j,z) = 0;
        else
        end
    end
end
end


countrevsolDelayed = zeros(size(S,2),size(S,2),Ns);
for z=1:Ns
    for i = 1:size(S,2)
        for j = 1:size(S,2)
         if i~=j && countrev(i,j,z) > countrev(j,i,z)
                 countrevsolDelayed(i,j,z) = 1;
                 countrevsolDelayed(j,i,z) = 0;
         elseif i~=j && countrev(j,i,z) > countrev(i,j,z)
                 countrevsolDelayed(j,i,z) = 1;
                 countrevsolDelayed(i,j,z) = 0;
         elseif i~=j && countrev(j,i,z) == countrev(i,j,z)
                 countrevsolDelayed(i,j,z) = 1;
                 countrevsolDelayed(j,i,z) = 1; 
         elseif i==j
                 countrevsolDelayed(i,j,z) = 0;
         end
        end
    end
end

clear ChX ChY ChZ ChW ChXY ChXZ ChXW ChYX ChYZ ChYW ChZX ChZY ChZW ChWX ChWY ChWZ


%% Eigenvector

outdegree = {'x','x','x','y','y','y','z','z','z','w','w','w'};
indegree = {'y','z','w','x','z','w','x','y','w','x','y','z'};

Revealed = Revealed(:,1:size(outdegree,2));

Revealedgraph = cell(1,Ns);
for i=1:Ns % revealed preference graphs
    Revealedgraph{1,i} = digraph(outdegree,indegree,Revealed(i,:),S);
end

Adiacencyrevealedgraph = cell(1,Ns);
for i=1:Ns %Adjacency matrices of revealed preference graphs
    nn = numnodes(Revealedgraph{1,i});
    [s,t]=findedge(Revealedgraph{1,i});
        Adiacencyrevealedgraph{1,i} = sparse(s,t,Revealedgraph{1,i}.Edges.Weight,nn,nn);
end
    

for i=1:size(Adiacencyrevealedgraph,2) %substitute zeros with positive numbers (Perron-Frobenius Theorem)
Adiacencyrevealedgraph{1,i}(~Adiacencyrevealedgraph{1,i}) = 0.001;
end

for i=1:size(Adiacencyrevealedgraph,2) %substitute sparse matrices with full matrices
Adiacencyrevealedgraph{1,i}= full(Adiacencyrevealedgraph{1,i});
end


Centrality = cell(1,Ns);

for i = 1:Ns
   Centrality{1,i} = eigencentrality(Adiacencyrevealedgraph{1,i});
end 
for i = 1:Ns
     for j=1:size(Centrality{1,1},1)
    if Centrality{1,i}(j,1) < 0
     Centrality{1,i}(j,1) = Centrality{1,i}(j,1)*-1;
    end 
    end
end

eigensolDelayed = zeros(size(S,2),size(S,2),Ns);

%%%% numerical calculation of centrality may wrongly eliminate
%%%% indifferences

for z = 1:Ns
for i = 1:size(S,2)
    for j = 1:size(S,2)
    if Centrality{1,z}(i,1) - Centrality{1,z}(j,1)>0.0001
        eigensolDelayed(i,j,z) = 1;
    elseif abs(Centrality{1,z}(i,1) - Centrality{1,z}(j,1))<0.0001
        eigensolDelayed(i,j,z) = 1;
        eigensolDelayed(j,i,z) = 1;         
    end
    end
end
end


for z=1:Ns
for i = 1:size(S,2)
    for j= 1:size(S,2)
        if i==j
            eigensolDelayed(i,j,z) = 0;
        else
        end
    end
end
end

clear Adiacencyrevealedgraph Centrality Revealedgraph Domain domains

%% Transitive Core based on CRP


trcoreDelayed = zeros(size(S,2),size(S,2),Ns);
for z=1:Ns
    if countrevsolDelayed(1,2,z) >= countrevsolDelayed(2,1,z) && countrevsolDelayed(3,2,z) >= countrevsolDelayed(3,1,z) && countrevsolDelayed(1,3,z) >= countrevsolDelayed(2,3,z) && countrevsolDelayed(4,2,z) >= countrevsolDelayed(4,1,z) && countrevsolDelayed(1,4,z) >= countrevsolDelayed(2,4,z)
    trcoreDelayed(1,2,z)=1;
    end
if countrevsolDelayed(1,3,z) >= countrevsolDelayed(3,1,z) && countrevsolDelayed(2,3,z) >= countrevsolDelayed(2,1,z) && countrevsolDelayed(1,2,z) >= countrevsolDelayed(3,2,z) && countrevsolDelayed(4,3,z) >= countrevsolDelayed(4,1,z) && countrevsolDelayed(1,4,z) >= countrevsolDelayed(3,4,z)
    trcoreDelayed(1,3,z)=1;
end    
if countrevsolDelayed(1,4,z) >= countrevsolDelayed(4,1,z) && countrevsolDelayed(2,4,z) >= countrevsolDelayed(2,1,z) && countrevsolDelayed(1,2,z) >= countrevsolDelayed(4,2,z) && countrevsolDelayed(3,4,z) >= countrevsolDelayed(3,1,z) && countrevsolDelayed(1,3,z) >= countrevsolDelayed(4,3,z)
    trcoreDelayed(1,4,z)=1;
 end  
 if countrevsolDelayed(2,1,z) >= countrevsolDelayed(1,2,z) && countrevsolDelayed(3,1,z) >= countrevsolDelayed(3,2,z) && countrevsolDelayed(2,3,z) >= countrevsolDelayed(1,3,z) && countrevsolDelayed(4,1,z) >= countrevsolDelayed(4,2,z) && countrevsolDelayed(2,4,z) >= countrevsolDelayed(1,4,z)
    trcoreDelayed(2,1,z)=1;
end    
if countrevsolDelayed(2,3,z) >= countrevsolDelayed(3,2,z) && countrevsolDelayed(1,3,z) >= countrevsolDelayed(1,2,z) && countrevsolDelayed(2,1,z) >= countrevsolDelayed(3,1,z) && countrevsolDelayed(4,3,z) >= countrevsolDelayed(4,2,z) && countrevsolDelayed(2,4,z) >= countrevsolDelayed(3,4,z)
    trcoreDelayed(2,3,z)=1;
 end  
 if countrevsolDelayed(2,4,z) >= countrevsolDelayed(4,2,z) && countrevsolDelayed(1,4,z) >= countrevsolDelayed(1,2,z) && countrevsolDelayed(2,1,z) >= countrevsolDelayed(4,1,z) && countrevsolDelayed(3,4,z) >= countrevsolDelayed(3,2,z) && countrevsolDelayed(2,3,z) >= countrevsolDelayed(4,3,z)
    trcoreDelayed(2,4,z)=1;
end    
if countrevsolDelayed(3,1,z) >= countrevsolDelayed(1,3,z) && countrevsolDelayed(2,1,z) >= countrevsolDelayed(2,3,z) && countrevsolDelayed(3,2,z) >= countrevsolDelayed(1,2,z) && countrevsolDelayed(4,1,z) >= countrevsolDelayed(4,3,z) && countrevsolDelayed(3,4,z) >= countrevsolDelayed(1,4,z)
    trcoreDelayed(3,1,z)=1;
 end  
 if countrevsolDelayed(3,2,z) >= countrevsolDelayed(2,3,z) && countrevsolDelayed(1,2,z) >= countrevsolDelayed(1,3,z) && countrevsolDelayed(3,1,z) >= countrevsolDelayed(2,1,z) && countrevsolDelayed(4,2,z) >= countrevsolDelayed(4,3,z) && countrevsolDelayed(3,4,z) >= countrevsolDelayed(2,4,z)
    trcoreDelayed(3,2,z)=1;
end    
if countrevsolDelayed(3,4,z) >= countrevsolDelayed(4,3,z) && countrevsolDelayed(1,4,z) >= countrevsolDelayed(1,3,z) && countrevsolDelayed(3,1,z) >= countrevsolDelayed(4,1,z) && countrevsolDelayed(2,4,z) >= countrevsolDelayed(2,3,z) && countrevsolDelayed(3,2,z) >= countrevsolDelayed(4,2,z)
    trcoreDelayed(3,4,z)=1;
 end  
 if countrevsolDelayed(4,1,z) >= countrevsolDelayed(1,4,z) && countrevsolDelayed(2,1,z) >= countrevsolDelayed(2,4,z) && countrevsolDelayed(4,2,z) >= countrevsolDelayed(1,2,z) && countrevsolDelayed(3,1,z) >= countrevsolDelayed(3,4,z) && countrevsolDelayed(4,3,z) >= countrevsolDelayed(1,3,z)
    trcoreDelayed(4,1,z)=1;
end    
if countrevsolDelayed(4,2,z) >= countrevsolDelayed(2,4,z) && countrevsolDelayed(1,2,z) >= countrevsolDelayed(1,4,z) && countrevsolDelayed(4,1,z) >= countrevsolDelayed(2,1,z) && countrevsolDelayed(3,2,z) >= countrevsolDelayed(3,4,z) && countrevsolDelayed(4,3,z) >= countrevsolDelayed(2,3,z)
    trcoreDelayed(4,2,z)=1;
 end  
 if countrevsolDelayed(4,3,z) >= countrevsolDelayed(3,4,z) && countrevsolDelayed(1,3,z) >= countrevsolDelayed(1,4,z) && countrevsolDelayed(4,1,z) >= countrevsolDelayed(3,1,z) && countrevsolDelayed(2,3,z) >= countrevsolDelayed(2,4,z) && countrevsolDelayed(4,2,z) >= countrevsolDelayed(3,2,z)
    trcoreDelayed(4,3,z)=1;
end
end



%% Attention method with both BR and MS

if exist('choice_L_MAIN','var')==1

N=145;

structure = [
    0,0,1,2;
    0,0,1,3;
    0,0,1,4;
    0,0,2,3;
    0,0,2,4;
    0,0,3,4;
    0,1,2,3;
    0,1,2,4;
    0,1,3,4;
    0,2,3,4;
    1,2,3,4];


MASA_DATASET = cell(N,1);

for i=1:N
    MASA_DATASET{i,1} = [structure, zeros(size(choice_D_MAIN,2),1)];
end

for i=1:N
        if choice_D_MAIN{i,1}=='x'
            MASA_DATASET{i,1}(1,5)=1;
        elseif choice_D_MAIN{i,1}=='y'
            MASA_DATASET{i,1}(1,5)=2;
        end
        if choice_D_MAIN{i,2}=='x'
            MASA_DATASET{i,1}(2,5)=1;
        elseif choice_D_MAIN{i,2}=='z'
            MASA_DATASET{i,1}(2,5)=3;
        end       
        if choice_D_MAIN{i,3}=='x'
            MASA_DATASET{i,1}(3,5)=1;
        elseif choice_D_MAIN{i,3}=='w'
            MASA_DATASET{i,1}(3,5)=4;
        end       
        if choice_D_MAIN{i,4}=='y'
            MASA_DATASET{i,1}(4,5)=2;
        elseif choice_D_MAIN{i,4}=='z'
            MASA_DATASET{i,1}(4,5)=3;
        end 
        if choice_D_MAIN{i,5}=='y'
            MASA_DATASET{i,1}(5,5)=2;
        elseif choice_D_MAIN{i,5}=='w'
            MASA_DATASET{i,1}(5,5)=4;
        end
        if choice_D_MAIN{i,6}=='z'
            MASA_DATASET{i,1}(6,5)=3;
        elseif choice_D_MAIN{i,6}=='w'
            MASA_DATASET{i,1}(6,5)=4;
        end
        if choice_D_MAIN{i,7}=='x'
            MASA_DATASET{i,1}(7,5)=1;
        elseif choice_D_MAIN{i,7}=='y'
            MASA_DATASET{i,1}(7,5)=2;
        elseif choice_D_MAIN{i,7}=='z'
            MASA_DATASET{i,1}(7,5)=3;    
        end
        if choice_D_MAIN{i,8}=='x'
            MASA_DATASET{i,1}(8,5)=1;
        elseif choice_D_MAIN{i,8}=='y'
            MASA_DATASET{i,1}(8,5)=2;
        elseif choice_D_MAIN{i,8}=='w'
            MASA_DATASET{i,1}(8,5)=4;    
        end
        if choice_D_MAIN{i,9}=='x'
            MASA_DATASET{i,1}(9,5)=1;
        elseif choice_D_MAIN{i,9}=='z'
            MASA_DATASET{i,1}(9,5)=3;
        elseif choice_D_MAIN{i,9}=='w'
            MASA_DATASET{i,1}(9,5)=4;    
        end
        if choice_D_MAIN{i,10}=='y'
            MASA_DATASET{i,1}(10,5)=2;
        elseif choice_D_MAIN{i,10}=='z'
            MASA_DATASET{i,1}(10,5)=3;
        elseif choice_D_MAIN{i,10}=='w'
            MASA_DATASET{i,1}(10,5)=4;    
        end
        if choice_D_MAIN{i,11}=='x'
            MASA_DATASET{i,1}(11,5)=1;        
        elseif choice_D_MAIN{i,11}=='y'
            MASA_DATASET{i,1}(11,5)=2;
        elseif choice_D_MAIN{i,11}=='z'
            MASA_DATASET{i,1}(11,5)=3;
        elseif choice_D_MAIN{i,11}=='w'
            MASA_DATASET{i,1}(11,5)=4;    
        end   
end

Attention_pref = masa_att(MASA_DATASET);
Attention_pref(Attention_pref>0)=1;

Att_graph = cell(N,1);
for i=1:N
    Att_graph{i,1} = digraph(Attention_pref(:,:,i));
    t(i,1)=isdag(Att_graph{i,1});
    if t(i,1)==0 % if the choices are not in line with the model then we reject the model completely
        Attention_pref(:,:,i)=zeros(4,4);
        Att_graph{i,1}=digraph(Attention_pref(:,:,i));
    end
    Att_graph{i,1} = transclosure(Att_graph{i,1});
    Attention_pref(:,:,i) = adjacency(Att_graph{i,1}); 
end

Not_ATT = N-sum(t);

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\Results Time MAIN.mat')

for i=1:N % eliminate symmetric part of the binary relation
    for j=1:4
        for z=1:4
            if minswapssolDelayed(j,z,i)==1 && minswapssolDelayed(z,j,i)==1
                minswapssolDelayed(j,z,i)=0;
                minswapssolDelayed(z,j,i)=0;
            end
        end
    end
end

Att_MS_Delayed = Attention_pref+minswapssolDelayed;
Att_BR_Delayed = Attention_pref+BernRangDelayed;

Att_MS_Delayed(Att_MS_Delayed>0)=1;
Att_BR_Delayed(Att_BR_Delayed>0)=1;

%%% break cycles in favor of attention
%%% First, check cycles of length 2

cycle2_ATT_MS = Attention_pref - permute(minswapssolDelayed,[2,1,3]);
cycle2_ATT_BR = Attention_pref - permute(BernRangDelayed,[2,1,3]);

Att_MS_Delayed_acyclic = Att_MS_Delayed;
Att_BR_Delayed_acyclic = Att_BR_Delayed;
for i=1:N
    for j=1:4
        for z=1:4
            if Attention_pref(j,z,i)==1 && cycle2_ATT_MS(j,z,i)==0
                Att_MS_Delayed_acyclic(z,j,i)=0;
            end
            if Attention_pref(j,z,i)==1 && cycle2_ATT_BR(j,z,i)==0
                Att_BR_Delayed_acyclic(z,j,i)=0;
            end
        end
    end
end


for i=1:N
    cycle_ATT_MS{i,1} = allcycles(digraph(Att_MS_Delayed_acyclic(:,:,i)));
    cycle_ATT_BR{i,1} = allcycles(digraph(Att_BR_Delayed_acyclic(:,:,i)));
end

for i=1:N % break all the cycles of length greater than 2 in favor of Attention
    if isempty(cycle_ATT_BR{i,1})==0
        for j=1:size(cycle_ATT_BR{i,1},1)
            temp = Attention_pref(:,:,i);
            temp = temp(cycle_ATT_BR{i,1}{j,1},cycle_ATT_BR{i,1}{j,1});
            temp1 = Att_BR_Delayed_acyclic(:,:,i);
            temp1(cycle_ATT_BR{i,1}{j,1},cycle_ATT_BR{i,1}{j,1}) = temp;
            Att_BR_Delayed_acyclic(:,:,i) = temp1;
        end
    end
end
for i=1:N % break all the cycles of length greater than 2 in favor of Attention
    if isempty(cycle_ATT_MS{i,1})==0
        for j=1:size(cycle_ATT_MS{i,1},1)
            temp = Attention_pref(:,:,i);
            temp = temp(cycle_ATT_MS{i,1}{j,1},cycle_ATT_MS{i,1}{j,1});
            temp1 = Att_MS_Delayed_acyclic(:,:,i);
            temp1(cycle_ATT_MS{i,1}{j,1},cycle_ATT_MS{i,1}{j,1}) = temp;
            Att_MS_Delayed_acyclic(:,:,i) = temp1;
        end
    end
end

end

%% Transitive Core based on BR

BernRangDelayed_TC = BernRangDelayed;

for z=1:size(BernRangDelayed_TC,3)
for i=1:4
for j=1:4
     if BernRangDelayed_TC(i,j,z)==BernRangDelayed_TC(j,i,z) && i ~=j
        BernRangDelayed_TC(i,j,z)=1;
        BernRangDelayed_TC(j,i,z)=1;
     end
end
end
end

trcoreDelayed_BR = zeros(size(S,2),size(S,2),Ns);
for z=1:Ns
    if BernRangDelayed_TC(1,2,z) >= BernRangDelayed_TC(2,1,z) && BernRangDelayed_TC(3,2,z) >= BernRangDelayed_TC(3,1,z) && BernRangDelayed_TC(1,3,z) >= BernRangDelayed_TC(2,3,z) && BernRangDelayed_TC(4,2,z) >= BernRangDelayed_TC(4,1,z) && BernRangDelayed_TC(1,4,z) >= BernRangDelayed_TC(2,4,z)
    trcoreDelayed_BR(1,2,z)=1;
    end
if BernRangDelayed_TC(1,3,z) >= BernRangDelayed_TC(3,1,z) && BernRangDelayed_TC(2,3,z) >= BernRangDelayed_TC(2,1,z) && BernRangDelayed_TC(1,2,z) >= BernRangDelayed_TC(3,2,z) && BernRangDelayed_TC(4,3,z) >= BernRangDelayed_TC(4,1,z) && BernRangDelayed_TC(1,4,z) >= BernRangDelayed_TC(3,4,z)
    trcoreDelayed_BR(1,3,z)=1;
end    
if BernRangDelayed_TC(1,4,z) >= BernRangDelayed_TC(4,1,z) && BernRangDelayed_TC(2,4,z) >= BernRangDelayed_TC(2,1,z) && BernRangDelayed_TC(1,2,z) >= BernRangDelayed_TC(4,2,z) && BernRangDelayed_TC(3,4,z) >= BernRangDelayed_TC(3,1,z) && BernRangDelayed_TC(1,3,z) >= BernRangDelayed_TC(4,3,z)
    trcoreDelayed_BR(1,4,z)=1;
 end  
 if BernRangDelayed_TC(2,1,z) >= BernRangDelayed_TC(1,2,z) && BernRangDelayed_TC(3,1,z) >= BernRangDelayed_TC(3,2,z) && BernRangDelayed_TC(2,3,z) >= BernRangDelayed_TC(1,3,z) && BernRangDelayed_TC(4,1,z) >= BernRangDelayed_TC(4,2,z) && BernRangDelayed_TC(2,4,z) >= BernRangDelayed_TC(1,4,z)
    trcoreDelayed_BR(2,1,z)=1;
end    
if BernRangDelayed_TC(2,3,z) >= BernRangDelayed_TC(3,2,z) && BernRangDelayed_TC(1,3,z) >= BernRangDelayed_TC(1,2,z) && BernRangDelayed_TC(2,1,z) >= BernRangDelayed_TC(3,1,z) && BernRangDelayed_TC(4,3,z) >= BernRangDelayed_TC(4,2,z) && BernRangDelayed_TC(2,4,z) >= BernRangDelayed_TC(3,4,z)
    trcoreDelayed_BR(2,3,z)=1;
 end  
 if BernRangDelayed_TC(2,4,z) >= BernRangDelayed_TC(4,2,z) && BernRangDelayed_TC(1,4,z) >= BernRangDelayed_TC(1,2,z) && BernRangDelayed_TC(2,1,z) >= BernRangDelayed_TC(4,1,z) && BernRangDelayed_TC(3,4,z) >= BernRangDelayed_TC(3,2,z) && BernRangDelayed_TC(2,3,z) >= BernRangDelayed_TC(4,3,z)
    trcoreDelayed_BR(2,4,z)=1;
end    
if BernRangDelayed_TC(3,1,z) >= BernRangDelayed_TC(1,3,z) && BernRangDelayed_TC(2,1,z) >= BernRangDelayed_TC(2,3,z) && BernRangDelayed_TC(3,2,z) >= BernRangDelayed_TC(1,2,z) && BernRangDelayed_TC(4,1,z) >= BernRangDelayed_TC(4,3,z) && BernRangDelayed_TC(3,4,z) >= BernRangDelayed_TC(1,4,z)
    trcoreDelayed_BR(3,1,z)=1;
 end  
 if BernRangDelayed_TC(3,2,z) >= BernRangDelayed_TC(2,3,z) && BernRangDelayed_TC(1,2,z) >= BernRangDelayed_TC(1,3,z) && BernRangDelayed_TC(3,1,z) >= BernRangDelayed_TC(2,1,z) && BernRangDelayed_TC(4,2,z) >= BernRangDelayed_TC(4,3,z) && BernRangDelayed_TC(3,4,z) >= BernRangDelayed_TC(2,4,z)
    trcoreDelayed_BR(3,2,z)=1;
end    
if BernRangDelayed_TC(3,4,z) >= BernRangDelayed_TC(4,3,z) && BernRangDelayed_TC(1,4,z) >= BernRangDelayed_TC(1,3,z) && BernRangDelayed_TC(3,1,z) >= BernRangDelayed_TC(4,1,z) && BernRangDelayed_TC(2,4,z) >= BernRangDelayed_TC(2,3,z) && BernRangDelayed_TC(3,2,z) >= BernRangDelayed_TC(4,2,z)
    trcoreDelayed_BR(3,4,z)=1;
 end  
 if BernRangDelayed_TC(4,1,z) >= BernRangDelayed_TC(1,4,z) && BernRangDelayed_TC(2,1,z) >= BernRangDelayed_TC(2,4,z) && BernRangDelayed_TC(4,2,z) >= BernRangDelayed_TC(1,2,z) && BernRangDelayed_TC(3,1,z) >= BernRangDelayed_TC(3,4,z) && BernRangDelayed_TC(4,3,z) >= BernRangDelayed_TC(1,3,z)
    trcoreDelayed_BR(4,1,z)=1;
end    
if BernRangDelayed_TC(4,2,z) >= BernRangDelayed_TC(2,4,z) && BernRangDelayed_TC(1,2,z) >= BernRangDelayed_TC(1,4,z) && BernRangDelayed_TC(4,1,z) >= BernRangDelayed_TC(2,1,z) && BernRangDelayed_TC(3,2,z) >= BernRangDelayed_TC(3,4,z) && BernRangDelayed_TC(4,3,z) >= BernRangDelayed_TC(2,3,z)
    trcoreDelayed_BR(4,2,z)=1;
 end  
 if BernRangDelayed_TC(4,3,z) >= BernRangDelayed_TC(3,4,z) && BernRangDelayed_TC(1,3,z) >= BernRangDelayed_TC(1,4,z) && BernRangDelayed_TC(4,1,z) >= BernRangDelayed_TC(3,1,z) && BernRangDelayed_TC(2,3,z) >= BernRangDelayed_TC(2,4,z) && BernRangDelayed_TC(4,2,z) >= BernRangDelayed_TC(3,2,z)
    trcoreDelayed_BR(4,3,z)=1;
end
end



%% Sequential 

if exist('choice_D_MAIN','var')==1

seqsolDelayed= zeros(size(S,2),size(S,2),size(choice_D_MAIN,1));

for i=1:size(choice_D_MAIN,1)
if choice_D_MAIN{i,11} == 'y' %%%% if 'y' is chosen from the grand set then 'y' is preferred to any element
        seqsolDelayed(2,1,i)=1;
        seqsolDelayed(2,3,i)=1;
        seqsolDelayed(2,4,i)=1;
if choice_D_MAIN{i,9} == 'x'  %%%% if 'x' is chosen from the set with x,z,w then it is preferred to them
        seqsolDelayed(1,3,i)= 1;
        seqsolDelayed(1,4,i)= 1;
       if choice_D_MAIN{i,6} == 'z'
        seqsolDelayed(3,4,i)= 1;
       end
    if choice_D_MAIN{i,6} == 'w'
        seqsolDelayed(4,3,i)= 1;
    end
end
if choice_D_MAIN{i,9} == 'z'
        seqsolDelayed(3,1,i)= 1;
        seqsolDelayed(3,4,i)= 1;
        if choice_D_MAIN{i,3} == 'x'
          seqsolDelayed(1,4,i)= 1;
        end
    if choice_D_MAIN{i,3} == 'w'
          seqsolDelayed(4,1,i)= 1;
    end
end
if choice_D_MAIN{i,9} == 'w'
           seqsolDelayed(4,1,i)= 1;
        seqsolDelayed(4,3,i)= 1;
      if choice_D_MAIN{i,2} == 'x'
          seqsolDelayed(1,3,i)= 1;
      end
    if choice_D_MAIN{i,2} == 'z'
          seqsolDelayed(3,1,i)= 1;
    end
end
end
end


for i=1:size(choice_D_MAIN,1)
if choice_D_MAIN{i,11} == 'x'
        seqsolDelayed(1,2,i)=1;
        seqsolDelayed(1,3,i)=1;
        seqsolDelayed(1,4,i)=1;
if choice_D_MAIN{i,10} == 'y'
        seqsolDelayed(2,3,i)= 1;
        seqsolDelayed(2,4,i)= 1;
       if choice_D_MAIN{i,6} == 'z'
        seqsolDelayed(3,4,i)= 1;
       end
    if choice_D_MAIN{i,6} == 'w'
        seqsolDelayed(4,3,i)= 1;
    end
end
if choice_D_MAIN{i,10} == 'z'
        seqsolDelayed(3,2,i)= 1;
        seqsolDelayed(3,4,i)= 1;
        if choice_D_MAIN{i,5} == 'y'
          seqsolDelayed(2,4,i)= 1;
        end
    if choice_D_MAIN{i,5} == 'w'
          seqsolDelayed(4,2,i)= 1;
     end
end
if choice_D_MAIN{i,10} == 'w'
           seqsolDelayed(4,2,i)= 1;
        seqsolDelayed(4,3,i)= 1;
       if choice_D_MAIN{i,4} == 'y'
          seqsolDelayed(2,3,i)= 1;
      end
    if choice_D_MAIN{i,4} == 'z'
          seqsolDelayed(3,2,i)= 1;
    end
end
end
end



for i=1:size(choice_D_MAIN,1)
if choice_D_MAIN{i,11} == 'z'
        seqsolDelayed(3,1,i)=1;
        seqsolDelayed(3,2,i)=1;
        seqsolDelayed(3,4,i)=1;
if choice_D_MAIN{i,8} == 'x'
        seqsolDelayed(1,2,i)= 1;
        seqsolDelayed(1,4,i)= 1;
       if choice_D_MAIN{i,5} == 'y'
        seqsolDelayed(2,4,i)= 1;
       end
    if choice_D_MAIN{i,5} == 'w'
        seqsolDelayed(4,2,i)= 1;
    end
end
if choice_D_MAIN{i,8} == 'y'
        seqsolDelayed(2,1,i)= 1; 
        seqsolDelayed(2,4,i)= 1;
        if choice_D_MAIN{i,3} == 'x'
          seqsolDelayed(1,4,i)= 1;
        end
    if choice_D_MAIN{i,3} == 'w'
          seqsolDelayed(4,1,i)= 1;
     end
end
if choice_D_MAIN{i,8} == 'w'
        seqsolDelayed(4,1,i)= 1;
        seqsolDelayed(4,2,i)= 1;
       if choice_D_MAIN{i,1} == 'x'
          seqsolDelayed(1,2,i)= 1;
      end
    if choice_D_MAIN{i,1} == 'y'
          seqsolDelayed(2,1,i)= 1;
    end
end
end
end


for i=1:size(choice_D_MAIN,1)
if choice_D_MAIN{i,11} == 'w'
        seqsolDelayed(4,1,i)=1;
        seqsolDelayed(4,2,i)=1;
        seqsolDelayed(4,3,i)=1;
if choice_D_MAIN{i,7} == 'x'
        seqsolDelayed(1,2,i)= 1;
        seqsolDelayed(1,3,i)= 1;
       if choice_D_MAIN{i,4} == 'y'
        seqsolDelayed(2,3,i)= 1;
       end
    if choice_D_MAIN{i,4} == 'z'
        seqsolDelayed(3,2,i)= 1;
    end
end
if choice_D_MAIN{i,7} == 'y'
        seqsolDelayed(2,1,i)= 1;
        seqsolDelayed(2,3,i)= 1;
        if choice_D_MAIN{i,2} == 'x'
          seqsolDelayed(1,3,i)= 1;
        end
    if choice_D_MAIN{i,2} == 'z'
          seqsolDelayed(3,1,i)= 1;
    end
end
if choice_D_MAIN{i,7} == 'z'
        seqsolDelayed(3,1,i)= 1;
        seqsolDelayed(3,2,i)= 1;
      if choice_D_MAIN{i,1} == 'x'
          seqsolDelayed(1,2,i)= 1;
      end
    if choice_D_MAIN{i,1} == 'y'
          seqsolDelayed(2,1,i)= 1;
    end
end
end
end
end

%% Minimum Swaps
Rel = 12;
weights = zeros(Ns,Rel);

for i=1:Ns %%%weights is the vector of weights for the digraph with nodes [s,t] 
    k=sum(xRy,2);
    l=sum(yRx,2);
    if k(i,1) - l(i,1) > 0
       weights(i,1) = k(i,1) - l(i,1);
    elseif k(i,1)-l(i,1) < 0
       weights(i,2) = l(i,1)-k(i,1);
    elseif k(i,1)-l(i,1) == 0   
       weights(i,1) = 0;
       weights(i,2) = 0;
    end
end

for i=1:Ns
    k=sum(xRz,2);
    l=sum(zRx,2);
    if k(i,1) - l(i,1) > 0
       weights(i,3) = k(i,1) - l(i,1);
    elseif k(i,1)-l(i,1) < 0
       weights(i,4) = l(i,1)-k(i,1);
    elseif k(i,1)-l(i,1) == 0
       weights(i,3) = 0;
       weights(i,4) = 0;
    end
end

for i=1:Ns
    k=sum(yRz,2);
    l=sum(zRy,2);
    if k(i,1) - l(i,1) > 0
       weights(i,5) = k(i,1) - l(i,1);
    elseif k(i,1)-l(i,1) < 0
       weights(i,6) = l(i,1)-k(i,1);
    elseif k(i,1)-l(i,1) == 0
       weights(i,5) = 0;
       weights(i,6) = 0;
    end
end

for i=1:Ns
    k=sum(xRw,2);
    l=sum(wRx,2);
    if k(i,1) - l(i,1) > 0
       weights(i,7) = k(i,1) - l(i,1);
    elseif k(i,1)-l(i,1) < 0
       weights(i,8) = l(i,1)-k(i,1);
    elseif k(i,1)-l(i,1) == 0
       weights(i,7) = 0;
       weights(i,8) = 0;
    end
end

for i=1:Ns
    k=sum(yRw,2);
    l=sum(wRy,2);
    if k(i,1) - l(i,1) > 0
       weights(i,9) = k(i,1) - l(i,1);
    elseif k(i,1)-l(i,1) < 0
       weights(i,10) = l(i,1)-k(i,1);
    elseif k(i,1)-l(i,1) == 0
       weights(i,9) = 0;
       weights(i,10) = 0;
    end
end

for i=1:Ns
    k=sum(zRw,2);
    l=sum(wRz,2);
    if k(i,1) - l(i,1) > 0
       weights(i,11) = k(i,1) - l(i,1);
    elseif k(i,1)-l(i,1) < 0
       weights(i,12) = l(i,1)-k(i,1);
    elseif k(i,1)-l(i,1) == 0
       weights(i,11) = 0;
       weights(i,12) = 0;
    end
end

s=[1,2,1,3,2,3,1,4,2,4,3,4];
t=[2,1,3,1,3,2,4,1,4,2,4,3];

g=cell(Ns,1);

for i=1:Ns
g{i,1}=digraph(s,t,weights(i,:));
end

clear k l

for i=1:Ns
    for j=1:Rel
        if weights(i,j) == 0
            g{i,1} = rmedge(g{i,1},s(j),t(j));
        else
        end
    end
end

clear xRy xRz xRw yRx yRz yRw zRx zRy zRw wRx wRy wRz

sol_ac=cell(Ns,1);
sol_cy=cell(Ns,1);

for i=1:Ns
    if isdag(g{i,1})==1
        sol_ac{i,1} = g{i,1};
    else
        sol_cy{i,1} = g{i,1};
    end
end

G=cell(Ns,1);
A=cell(Ns,1);
b=cell(Ns,1);

for o=1:Ns
    if isempty(sol_cy{o,1}) == 0
    it=0;
    for l=1:Rel
        G{o,1}= rmedge(sol_cy{o,1},s(l),t(l)); % I remove the first edge
        it=it+1;
        if isdag(G{o,1})==1
            nn = numnodes(G{o,1});
            [p,q] = findedge(G{o,1});
            A{o,1}{1,it} = sparse(p,q,G{o,1}.Edges.Weight,nn,nn);
            b{o,1}(1,it)=sum(sum(A{o,1}{1,it})); % sum the weights of edges
        else 
        end
    end          
    end
end

for i=1:Ns
    if isempty(A{i,1})==1
        nn = numnodes(sol_ac{i,1});
       [p,q] = findedge(sol_ac{i,1});
        A{i,1}{1,1} = sparse(p,q,sol_ac{i,1}.Edges.Weight,nn,nn);
        b{i,1}(1,1)=sum(sum(A{i,1}{1,1}));
    else
    end
end

E=cell(Ns,1);
R=cell(Ns,1);
kk=cell(Ns,1);
RESULT=cell(Ns,1);
ADJ=cell(Ns,1);
a = zeros(Ns,1);

for o=1:Ns
a(o,1)=max(b{o,1});
end

for o=1:Ns
    for i=1:size(A{o,1},2)
    E{o,1}{1,i} = full(A{o,1}{1,i});
    end
end

for o=1:Ns
for i=1:size(E{o,1},2)
    R{o,1}(1,i) = sum(sum(E{o,1}{1,i}));
end
end

for o=1:Ns
R{o,1}(R{o,1}<a(o,1)) = 0 ;
end

for o=1:Ns
kk{o,1}=find(R{o,1});
end

for o=1:Ns
for i=1:size(kk{o,1},2)
    RESULT{o,1}{1,i} = digraph(A{o,1}{1,kk{o,1}(1,i)});
end
end

for o=1:Ns
for i=1:size(RESULT{o,1},2)
    RESULT{o,1}{1,i} = transclosure(RESULT{o,1}{1,i});
end
end

for o=1:Ns
for i=1:size(RESULT{o,1},2)
    ADJ{o,1}{1,i} = adjacency(RESULT{o,1}{1,i});
end 
end

for o=1:Ns
ind = true(1,numel(ADJ{o,1})); %// true indicates non-duplicate. Initiallization
for ii = 1:numel(ADJ{o,1})-1
    for jj = ii+1:numel(ADJ{o,1})
        if isequal(ADJ{o,1}{ii}, ADJ{o,1}{jj})
            ind(jj) = false; %// mark as duplicate
        end
    end
end
ADJ{o,1} = ADJ{o,1}(ind);
end

minswaps = cell(Ns,1);
for o=1:Ns
    for i = 1:size(ADJ{o,1},2)
    minswaps{o,1}(:,:,i) = full(ADJ{o,1}{1,i});
    end
end

for o=1:Ns
    if size(minswaps{o,1},2) > 1
        minswaps{o,1} = sum(minswaps{o,1},3);
    end
end

for o=1:Ns
    for i = 1:size(S,2)
        for j = 1:size(S,2)
            if minswaps{o,1}(i,j) == size(ADJ{o,1},2)
                 minswaps{o,1}(i,j) = 1;
            else
                minswaps{o,1}(i,j) = 0;
            end
        end
    end
end

minswapssolDelayed = zeros(size(S,2),size(S,2),Ns);

for i=1:Ns
minswapssolDelayed(:,:,i) = minswaps{i,1};
end

for z=1:Ns
    for i=1:size(S,2)
    for j=1:size(S,2)
       if minswapssolDelayed(i,j,z) == 0 && minswapssolDelayed(j,i,z) == 0 && i~=j
          minswapssolDelayed(i,j,z) = 1;
          minswapssolDelayed(j,i,z) = 1;
       end
    end
    end
end

%% Save all

% save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\Results Time ALL','BernRangDelayed','countsolDelayed',...
%    'countrevsolDelayed','trcoreDelayed','eigensolDelayed','minswapssolDelayed', 'trcoreDelayed_BR');
%  save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\Results Time MAIN','BernRangDelayed','countsolDelayed',...
%    'countrevsolDelayed','trcoreDelayed','eigensolDelayed','seqsolDelayed','minswapssolDelayed', 'trcoreDelayed_BR', 'Att_MS_Delayed_acyclic', 'Att_BR_Delayed_acyclic', 'Attention_pref');
  save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\Results Time Binary','BernRangDelayed','countsolDelayed',...
     'countrevsolDelayed','trcoreDelayed','eigensolDelayed','minswapssolDelayed', 'trcoreDelayed_BR');



clear
clc

% load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Revealed Pref ALL\Revealed Preference Risk\Variables Risk ALL.mat')
% load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Revealed Pref MAIN\Revealed Preference Risk\Variables Risk MAIN.mat')
 load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Revealed Pref MAIN\Revealed Preference Risk\Variables Risk Binary.mat')


S = {'a','b','c','d'};
Ns = 145; % Number of subjects

%% Bernheim and Rangel

BernRangLotteries = zeros(size(S,2),size(S,2),size(aRb,1));

for i=1:Ns
    if sum(aRb(i,:)) > 0 && sum(bRa(i,:)) > 0  || sum(aRb(i,:)) == 0 && sum(bRa(i,:)) == 0
        BernRangLotteries(1,2,i) = 0;
        BernRangLotteries(2,1,i) = 0;
    elseif  sum(aRb(i,:)) > 0 && sum(bRa(i,:)) == 0
        BernRangLotteries(1,2,i) = 1;
    elseif  sum(aRb(i,:)) == 0 && sum(bRa(i,:)) > 0
        BernRangLotteries(2,1,i) = 1;
    end
end


for i=1:Ns
    if sum(aRc(i,:)) > 0 && sum(cRa(i,:)) > 0  || sum(aRc(i,:)) == 0 && sum(cRa(i,:)) == 0
        BernRangLotteries(1,3,i) = 0;
        BernRangLotteries(3,1,i) = 0;
    elseif  sum(aRc(i,:)) > 0 && sum(cRa(i,:)) == 0
        BernRangLotteries(1,3,i) = 1;
    elseif  sum(aRc(i,:)) == 0 && sum(cRa(i,:)) > 0
        BernRangLotteries(3,1,i) = 1;
    end
end


for i=1:Ns
    if sum(cRb(i,:)) > 0 && sum(bRc(i,:)) > 0  || sum(cRb(i,:)) == 0 && sum(bRc(i,:)) == 0
        BernRangLotteries(2,3,i) = 0;
        BernRangLotteries(3,2,i) = 0;
    elseif  sum(cRb(i,:)) > 0 && sum(bRc(i,:)) == 0
        BernRangLotteries(3,2,i) = 1;
    elseif  sum(cRb(i,:)) == 0 && sum(bRc(i,:)) > 0
        BernRangLotteries(2,3,i) = 1;
    end
end



for i=1:Ns
    if sum(aRd(i,:)) > 0 && sum(dRa(i,:)) > 0  || sum(aRd(i,:)) == 0 && sum(dRa(i,:)) == 0
        BernRangLotteries(1,4,i) = 0;
       BernRangLotteries(4,1,i) = 0;
    elseif  sum(aRd(i,:)) > 0 && sum(dRa(i,:)) == 0
        BernRangLotteries(1,4,i) = 1;
    elseif  sum(aRd(i,:)) == 0 && sum(dRa(i,:)) > 0
        BernRangLotteries(4,1,i) = 1;
    end
end


for i=1:Ns
    if sum(dRb(i,:)) > 0 && sum(bRd(i,:)) > 0  || sum(dRb(i,:)) == 0 && sum(bRd(i,:)) == 0
        BernRangLotteries(4,2,i) = 0;
        BernRangLotteries(2,4,i) = 0;
    elseif  sum(dRb(i,:)) > 0 && sum(bRd(i,:)) == 0
        BernRangLotteries(4,2,i) = 1;
    elseif  sum(dRb(i,:)) == 0 && sum(bRd(i,:)) > 0
        BernRangLotteries(2,4,i) = 1;
    end
end

for i=1:Ns
    if sum(cRd(i,:)) > 0 && sum(dRc(i,:)) > 0  || sum(cRd(i,:)) == 0 && sum(dRc(i,:)) == 0
        BernRangLotteries(3,4,i) = 0;
        BernRangLotteries(4,3,i) = 0;
    elseif  sum(cRd(i,:)) > 0 && sum(dRc(i,:)) == 0
        BernRangLotteries(3,4,i) = 1;
    elseif  sum(cRd(i,:)) == 0 && sum(dRc(i,:)) > 0
        BernRangLotteries(4,3,i) = 1;
    end
end

%% Counting Revealed Preference
countrev = zeros(size(S,2),size(S,2),Ns);
for z = 1:Ns
    countrev(1,2,z) = ChAB(z,1);
    countrev(1,3,z) = ChAC(z,1);
    countrev(1,4,z) = ChAD(z,1);
    countrev(2,3,z) = ChBC(z,1);
    countrev(2,4,z) = ChBD(z,1);
    countrev(3,4,z) = ChCD(z,1);
    countrev(2,1,z) = ChBA(z,1);
    countrev(3,1,z) = ChCA(z,1);
    countrev(3,2,z) = ChCB(z,1);
    countrev(4,1,z) = ChDA(z,1);
    countrev(4,2,z) = ChDB(z,1);
    countrev(4,3,z) = ChDC(z,1);
end


countsolLotteries = zeros(size(S,2),size(S,2),Ns);

for z=1:Ns
    for i = 1:size(S,2)
        for   j = 1:size(S,2)
            if choicearray(z,i) >= choicearray(z,j)
                countsolLotteries(i,j,z) = 1;
            else
                countsolLotteries(i,j,z) = 0;
            end
        end
    end
end

for z=1:Ns
for i = 1:size(S,2)
    for j= 1:size(S,2)
        if i==j
            countsolLotteries(i,j,z) = 0;
        else
        end
    end
end
end


countrevsolLotteries = zeros(size(S,2),size(S,2),Ns);
for z=1:Ns
    for i = 1:size(S,2)
        for j = 1:size(S,2)
         if i~=j && countrev(i,j,z) > countrev(j,i,z)
                 countrevsolLotteries(i,j,z) = 1;
                 countrevsolLotteries(j,i,z) = 0;
         elseif i~=j && countrev(j,i,z) > countrev(i,j,z)
                 countrevsolLotteries(j,i,z) = 1;
                 countrevsolLotteries(i,j,z) = 0;
         elseif i~=j && countrev(j,i,z) == countrev(i,j,z)
                 countrevsolLotteries(i,j,z) = 1;
                 countrevsolLotteries(j,i,z) = 1; 
         elseif i==j
                 countrevsolLotteries(i,j,z) = 0;
         end
        end
    end
end

clear ChA ChB ChC ChD ChAB ChAC ChAD ChBA ChBC ChBD ChCA ChCB ChCD ChDA ChDB ChDC


%% Eigenvector

outdegree = {'a','a','a','b','b','b','c','c','c','d','d','d'};
indegree = {'b','c','d','a','c','d','a','b','d','a','b','c'};

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

eigensolLotteries = zeros(size(S,2),size(S,2),Ns);

%%%% numerical calculation of centrality may wrongly eliminate
%%%% indifferences

for z = 1:Ns
for i = 1:size(S,2)
    for j = 1:size(S,2)
    if Centrality{1,z}(i,1) - Centrality{1,z}(j,1)>0.0001
        eigensolLotteries(i,j,z) = 1;
    elseif abs(Centrality{1,z}(i,1) - Centrality{1,z}(j,1))<0.0001
        eigensolLotteries(i,j,z) = 1;
        eigensolLotteries(j,i,z) = 1;         
    end
    end
end
end


for z=1:Ns
for i = 1:size(S,2)
    for j= 1:size(S,2)
        if i==j
            eigensolLotteries(i,j,z) = 0;
        else
        end
    end
end
end

clear Adiacencyrevealedgraph Centrality Revealedgraph Domain domains

%% Transitive Core based on CRP


trcoreLotteries = zeros(size(S,2),size(S,2),Ns);
for z=1:Ns
    if countrevsolLotteries(1,2,z) >= countrevsolLotteries(2,1,z) && countrevsolLotteries(3,2,z) >= countrevsolLotteries(3,1,z) && countrevsolLotteries(1,3,z) >= countrevsolLotteries(2,3,z) && countrevsolLotteries(4,2,z) >= countrevsolLotteries(4,1,z) && countrevsolLotteries(1,4,z) >= countrevsolLotteries(2,4,z)
    trcoreLotteries(1,2,z)=1;
    end
if countrevsolLotteries(1,3,z) >= countrevsolLotteries(3,1,z) && countrevsolLotteries(2,3,z) >= countrevsolLotteries(2,1,z) && countrevsolLotteries(1,2,z) >= countrevsolLotteries(3,2,z) && countrevsolLotteries(4,3,z) >= countrevsolLotteries(4,1,z) && countrevsolLotteries(1,4,z) >= countrevsolLotteries(3,4,z)
    trcoreLotteries(1,3,z)=1;
end    
if countrevsolLotteries(1,4,z) >= countrevsolLotteries(4,1,z) && countrevsolLotteries(2,4,z) >= countrevsolLotteries(2,1,z) && countrevsolLotteries(1,2,z) >= countrevsolLotteries(4,2,z) && countrevsolLotteries(3,4,z) >= countrevsolLotteries(3,1,z) && countrevsolLotteries(1,3,z) >= countrevsolLotteries(4,3,z)
    trcoreLotteries(1,4,z)=1;
 end  
 if countrevsolLotteries(2,1,z) >= countrevsolLotteries(1,2,z) && countrevsolLotteries(3,1,z) >= countrevsolLotteries(3,2,z) && countrevsolLotteries(2,3,z) >= countrevsolLotteries(1,3,z) && countrevsolLotteries(4,1,z) >= countrevsolLotteries(4,2,z) && countrevsolLotteries(2,4,z) >= countrevsolLotteries(1,4,z)
    trcoreLotteries(2,1,z)=1;
end    
if countrevsolLotteries(2,3,z) >= countrevsolLotteries(3,2,z) && countrevsolLotteries(1,3,z) >= countrevsolLotteries(1,2,z) && countrevsolLotteries(2,1,z) >= countrevsolLotteries(3,1,z) && countrevsolLotteries(4,3,z) >= countrevsolLotteries(4,2,z) && countrevsolLotteries(2,4,z) >= countrevsolLotteries(3,4,z)
    trcoreLotteries(2,3,z)=1;
 end  
 if countrevsolLotteries(2,4,z) >= countrevsolLotteries(4,2,z) && countrevsolLotteries(1,4,z) >= countrevsolLotteries(1,2,z) && countrevsolLotteries(2,1,z) >= countrevsolLotteries(4,1,z) && countrevsolLotteries(3,4,z) >= countrevsolLotteries(3,2,z) && countrevsolLotteries(2,3,z) >= countrevsolLotteries(4,3,z)
    trcoreLotteries(2,4,z)=1;
end    
if countrevsolLotteries(3,1,z) >= countrevsolLotteries(1,3,z) && countrevsolLotteries(2,1,z) >= countrevsolLotteries(2,3,z) && countrevsolLotteries(3,2,z) >= countrevsolLotteries(1,2,z) && countrevsolLotteries(4,1,z) >= countrevsolLotteries(4,3,z) && countrevsolLotteries(3,4,z) >= countrevsolLotteries(1,4,z)
    trcoreLotteries(3,1,z)=1;
 end  
 if countrevsolLotteries(3,2,z) >= countrevsolLotteries(2,3,z) && countrevsolLotteries(1,2,z) >= countrevsolLotteries(1,3,z) && countrevsolLotteries(3,1,z) >= countrevsolLotteries(2,1,z) && countrevsolLotteries(4,2,z) >= countrevsolLotteries(4,3,z) && countrevsolLotteries(3,4,z) >= countrevsolLotteries(2,4,z)
    trcoreLotteries(3,2,z)=1;
end    
if countrevsolLotteries(3,4,z) >= countrevsolLotteries(4,3,z) && countrevsolLotteries(1,4,z) >= countrevsolLotteries(1,3,z) && countrevsolLotteries(3,1,z) >= countrevsolLotteries(4,1,z) && countrevsolLotteries(2,4,z) >= countrevsolLotteries(2,3,z) && countrevsolLotteries(3,2,z) >= countrevsolLotteries(4,2,z)
    trcoreLotteries(3,4,z)=1;
 end  
 if countrevsolLotteries(4,1,z) >= countrevsolLotteries(1,4,z) && countrevsolLotteries(2,1,z) >= countrevsolLotteries(2,4,z) && countrevsolLotteries(4,2,z) >= countrevsolLotteries(1,2,z) && countrevsolLotteries(3,1,z) >= countrevsolLotteries(3,4,z) && countrevsolLotteries(4,3,z) >= countrevsolLotteries(1,3,z)
    trcoreLotteries(4,1,z)=1;
end    
if countrevsolLotteries(4,2,z) >= countrevsolLotteries(2,4,z) && countrevsolLotteries(1,2,z) >= countrevsolLotteries(1,4,z) && countrevsolLotteries(4,1,z) >= countrevsolLotteries(2,1,z) && countrevsolLotteries(3,2,z) >= countrevsolLotteries(3,4,z) && countrevsolLotteries(4,3,z) >= countrevsolLotteries(2,3,z)
    trcoreLotteries(4,2,z)=1;
 end  
 if countrevsolLotteries(4,3,z) >= countrevsolLotteries(3,4,z) && countrevsolLotteries(1,3,z) >= countrevsolLotteries(1,4,z) && countrevsolLotteries(4,1,z) >= countrevsolLotteries(3,1,z) && countrevsolLotteries(2,3,z) >= countrevsolLotteries(2,4,z) && countrevsolLotteries(4,2,z) >= countrevsolLotteries(3,2,z)
    trcoreLotteries(4,3,z)=1;
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
    MASA_DATASET{i,1} = [structure, zeros(size(choice_L_MAIN,2),1)];
end

for i=1:N
        if choice_L_MAIN{i,1}=='a'
            MASA_DATASET{i,1}(1,5)=1;
        elseif choice_L_MAIN{i,1}=='b'
            MASA_DATASET{i,1}(1,5)=2;
        end
        if choice_L_MAIN{i,2}=='a'
            MASA_DATASET{i,1}(2,5)=1;
        elseif choice_L_MAIN{i,2}=='c'
            MASA_DATASET{i,1}(2,5)=3;
        end       
        if choice_L_MAIN{i,3}=='a'
            MASA_DATASET{i,1}(3,5)=1;
        elseif choice_L_MAIN{i,3}=='d'
            MASA_DATASET{i,1}(3,5)=4;
        end       
        if choice_L_MAIN{i,4}=='b'
            MASA_DATASET{i,1}(4,5)=2;
        elseif choice_L_MAIN{i,4}=='c'
            MASA_DATASET{i,1}(4,5)=3;
        end 
        if choice_L_MAIN{i,5}=='b'
            MASA_DATASET{i,1}(5,5)=2;
        elseif choice_L_MAIN{i,5}=='d'
            MASA_DATASET{i,1}(5,5)=4;
        end
        if choice_L_MAIN{i,6}=='c'
            MASA_DATASET{i,1}(6,5)=3;
        elseif choice_L_MAIN{i,6}=='d'
            MASA_DATASET{i,1}(6,5)=4;
        end
        if choice_L_MAIN{i,7}=='a'
            MASA_DATASET{i,1}(7,5)=1;
        elseif choice_L_MAIN{i,7}=='b'
            MASA_DATASET{i,1}(7,5)=2;
        elseif choice_L_MAIN{i,7}=='c'
            MASA_DATASET{i,1}(7,5)=3;    
        end
        if choice_L_MAIN{i,8}=='a'
            MASA_DATASET{i,1}(8,5)=1;
        elseif choice_L_MAIN{i,8}=='b'
            MASA_DATASET{i,1}(8,5)=2;
        elseif choice_L_MAIN{i,8}=='d'
            MASA_DATASET{i,1}(8,5)=4;    
        end
        if choice_L_MAIN{i,9}=='a'
            MASA_DATASET{i,1}(9,5)=1;
        elseif choice_L_MAIN{i,9}=='c'
            MASA_DATASET{i,1}(9,5)=3;
        elseif choice_L_MAIN{i,9}=='d'
            MASA_DATASET{i,1}(9,5)=4;    
        end
        if choice_L_MAIN{i,10}=='b'
            MASA_DATASET{i,1}(10,5)=2;
        elseif choice_L_MAIN{i,10}=='c'
            MASA_DATASET{i,1}(10,5)=3;
        elseif choice_L_MAIN{i,10}=='d'
            MASA_DATASET{i,1}(10,5)=4;    
        end
        if choice_L_MAIN{i,11}=='a'
            MASA_DATASET{i,1}(11,5)=1;        
        elseif choice_L_MAIN{i,11}=='b'
            MASA_DATASET{i,1}(11,5)=2;
        elseif choice_L_MAIN{i,11}=='c'
            MASA_DATASET{i,1}(11,5)=3;
        elseif choice_L_MAIN{i,11}=='d'
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

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\Results Risk MAIN.mat')

for i=1:N % eliminate symmetric part of the binary relation
    for j=1:4
        for z=1:4
            if minswapssolLotteries(j,z,i)==1 && minswapssolLotteries(z,j,i)==1
                minswapssolLotteries(j,z,i)=0;
                minswapssolLotteries(z,j,i)=0;
            end
        end
    end
end

Att_MS_Lotteries = Attention_pref+minswapssolLotteries;
Att_BR_Lotteries = Attention_pref+BernRangLotteries;

Att_MS_Lotteries(Att_MS_Lotteries>0)=1;
Att_BR_Lotteries(Att_BR_Lotteries>0)=1;

%%% break cycles in favor of attention
%%% First, check cycles of length 2

cycle2_ATT_MS = Attention_pref - permute(minswapssolLotteries,[2,1,3]);
cycle2_ATT_BR = Attention_pref - permute(BernRangLotteries,[2,1,3]);

Att_MS_Lotteries_acyclic = Att_MS_Lotteries;
Att_BR_Lotteries_acyclic = Att_BR_Lotteries;
for i=1:N
    for j=1:4
        for z=1:4
            if Attention_pref(j,z,i)==1 && cycle2_ATT_MS(j,z,i)==0
                Att_MS_Lotteries_acyclic(z,j,i)=0;
            end
            if Attention_pref(j,z,i)==1 && cycle2_ATT_BR(j,z,i)==0
                Att_BR_Lotteries_acyclic(z,j,i)=0;
            end
        end
    end
end


for i=1:N
    cycle_ATT_MS{i,1} = allcycles(digraph(Att_MS_Lotteries_acyclic(:,:,i)));
    cycle_ATT_BR{i,1} = allcycles(digraph(Att_BR_Lotteries_acyclic(:,:,i)));
end

for i=1:N % break all the cycles of length greater than 2 in favor of Attention
    if isempty(cycle_ATT_BR{i,1})==0
        for j=1:size(cycle_ATT_BR{i,1},1)
            temp = Attention_pref(:,:,i);
            temp = temp(cycle_ATT_BR{i,1}{j,1},cycle_ATT_BR{i,1}{j,1});
            temp1 = Att_BR_Lotteries_acyclic(:,:,i);
            temp1(cycle_ATT_BR{i,1}{j,1},cycle_ATT_BR{i,1}{j,1}) = temp;
            Att_BR_Lotteries_acyclic(:,:,i) = temp1;
        end
    end
end
for i=1:N % break all the cycles of length greater than 2 in favor of Attention
    if isempty(cycle_ATT_MS{i,1})==0
        for j=1:size(cycle_ATT_MS{i,1},1)
            temp = Attention_pref(:,:,i);
            temp = temp(cycle_ATT_MS{i,1}{j,1},cycle_ATT_MS{i,1}{j,1});
            temp1 = Att_MS_Lotteries_acyclic(:,:,i);
            temp1(cycle_ATT_MS{i,1}{j,1},cycle_ATT_MS{i,1}{j,1}) = temp;
            Att_MS_Lotteries_acyclic(:,:,i) = temp1;
        end
    end
end

end

%% Transitive Core based on BR

BernRangLotteries_TC = BernRangLotteries;

for z=1:size(BernRangLotteries_TC,3)
for i=1:4
for j=1:4
     if BernRangLotteries_TC(i,j,z)==BernRangLotteries_TC(j,i,z) && i ~=j
        BernRangLotteries_TC(i,j,z)=1;
        BernRangLotteries_TC(j,i,z)=1;
     end
end
end
end

trcoreLotteries_BR = zeros(size(S,2),size(S,2),Ns);
for z=1:Ns
    if BernRangLotteries_TC(1,2,z) >= BernRangLotteries_TC(2,1,z) && BernRangLotteries_TC(3,2,z) >= BernRangLotteries_TC(3,1,z) && BernRangLotteries_TC(1,3,z) >= BernRangLotteries_TC(2,3,z) && BernRangLotteries_TC(4,2,z) >= BernRangLotteries_TC(4,1,z) && BernRangLotteries_TC(1,4,z) >= BernRangLotteries_TC(2,4,z)
    trcoreLotteries_BR(1,2,z)=1;
    end
if BernRangLotteries_TC(1,3,z) >= BernRangLotteries_TC(3,1,z) && BernRangLotteries_TC(2,3,z) >= BernRangLotteries_TC(2,1,z) && BernRangLotteries_TC(1,2,z) >= BernRangLotteries_TC(3,2,z) && BernRangLotteries_TC(4,3,z) >= BernRangLotteries_TC(4,1,z) && BernRangLotteries_TC(1,4,z) >= BernRangLotteries_TC(3,4,z)
    trcoreLotteries_BR(1,3,z)=1;
end    
if BernRangLotteries_TC(1,4,z) >= BernRangLotteries_TC(4,1,z) && BernRangLotteries_TC(2,4,z) >= BernRangLotteries_TC(2,1,z) && BernRangLotteries_TC(1,2,z) >= BernRangLotteries_TC(4,2,z) && BernRangLotteries_TC(3,4,z) >= BernRangLotteries_TC(3,1,z) && BernRangLotteries_TC(1,3,z) >= BernRangLotteries_TC(4,3,z)
    trcoreLotteries_BR(1,4,z)=1;
 end  
 if BernRangLotteries_TC(2,1,z) >= BernRangLotteries_TC(1,2,z) && BernRangLotteries_TC(3,1,z) >= BernRangLotteries_TC(3,2,z) && BernRangLotteries_TC(2,3,z) >= BernRangLotteries_TC(1,3,z) && BernRangLotteries_TC(4,1,z) >= BernRangLotteries_TC(4,2,z) && BernRangLotteries_TC(2,4,z) >= BernRangLotteries_TC(1,4,z)
    trcoreLotteries_BR(2,1,z)=1;
end    
if BernRangLotteries_TC(2,3,z) >= BernRangLotteries_TC(3,2,z) && BernRangLotteries_TC(1,3,z) >= BernRangLotteries_TC(1,2,z) && BernRangLotteries_TC(2,1,z) >= BernRangLotteries_TC(3,1,z) && BernRangLotteries_TC(4,3,z) >= BernRangLotteries_TC(4,2,z) && BernRangLotteries_TC(2,4,z) >= BernRangLotteries_TC(3,4,z)
    trcoreLotteries_BR(2,3,z)=1;
 end  
 if BernRangLotteries_TC(2,4,z) >= BernRangLotteries_TC(4,2,z) && BernRangLotteries_TC(1,4,z) >= BernRangLotteries_TC(1,2,z) && BernRangLotteries_TC(2,1,z) >= BernRangLotteries_TC(4,1,z) && BernRangLotteries_TC(3,4,z) >= BernRangLotteries_TC(3,2,z) && BernRangLotteries_TC(2,3,z) >= BernRangLotteries_TC(4,3,z)
    trcoreLotteries_BR(2,4,z)=1;
end    
if BernRangLotteries_TC(3,1,z) >= BernRangLotteries_TC(1,3,z) && BernRangLotteries_TC(2,1,z) >= BernRangLotteries_TC(2,3,z) && BernRangLotteries_TC(3,2,z) >= BernRangLotteries_TC(1,2,z) && BernRangLotteries_TC(4,1,z) >= BernRangLotteries_TC(4,3,z) && BernRangLotteries_TC(3,4,z) >= BernRangLotteries_TC(1,4,z)
    trcoreLotteries_BR(3,1,z)=1;
 end  
 if BernRangLotteries_TC(3,2,z) >= BernRangLotteries_TC(2,3,z) && BernRangLotteries_TC(1,2,z) >= BernRangLotteries_TC(1,3,z) && BernRangLotteries_TC(3,1,z) >= BernRangLotteries_TC(2,1,z) && BernRangLotteries_TC(4,2,z) >= BernRangLotteries_TC(4,3,z) && BernRangLotteries_TC(3,4,z) >= BernRangLotteries_TC(2,4,z)
    trcoreLotteries_BR(3,2,z)=1;
end    
if BernRangLotteries_TC(3,4,z) >= BernRangLotteries_TC(4,3,z) && BernRangLotteries_TC(1,4,z) >= BernRangLotteries_TC(1,3,z) && BernRangLotteries_TC(3,1,z) >= BernRangLotteries_TC(4,1,z) && BernRangLotteries_TC(2,4,z) >= BernRangLotteries_TC(2,3,z) && BernRangLotteries_TC(3,2,z) >= BernRangLotteries_TC(4,2,z)
    trcoreLotteries_BR(3,4,z)=1;
 end  
 if BernRangLotteries_TC(4,1,z) >= BernRangLotteries_TC(1,4,z) && BernRangLotteries_TC(2,1,z) >= BernRangLotteries_TC(2,4,z) && BernRangLotteries_TC(4,2,z) >= BernRangLotteries_TC(1,2,z) && BernRangLotteries_TC(3,1,z) >= BernRangLotteries_TC(3,4,z) && BernRangLotteries_TC(4,3,z) >= BernRangLotteries_TC(1,3,z)
    trcoreLotteries_BR(4,1,z)=1;
end    
if BernRangLotteries_TC(4,2,z) >= BernRangLotteries_TC(2,4,z) && BernRangLotteries_TC(1,2,z) >= BernRangLotteries_TC(1,4,z) && BernRangLotteries_TC(4,1,z) >= BernRangLotteries_TC(2,1,z) && BernRangLotteries_TC(3,2,z) >= BernRangLotteries_TC(3,4,z) && BernRangLotteries_TC(4,3,z) >= BernRangLotteries_TC(2,3,z)
    trcoreLotteries_BR(4,2,z)=1;
 end  
 if BernRangLotteries_TC(4,3,z) >= BernRangLotteries_TC(3,4,z) && BernRangLotteries_TC(1,3,z) >= BernRangLotteries_TC(1,4,z) && BernRangLotteries_TC(4,1,z) >= BernRangLotteries_TC(3,1,z) && BernRangLotteries_TC(2,3,z) >= BernRangLotteries_TC(2,4,z) && BernRangLotteries_TC(4,2,z) >= BernRangLotteries_TC(3,2,z)
    trcoreLotteries_BR(4,3,z)=1;
end
end



%% Sequential

if exist('choice_L_MAIN','var')==1

seqsolLotteries= zeros(size(S,2),size(S,2),size(choice_L_MAIN,1));

for i=1:size(choice_L_MAIN,1)
if choice_L_MAIN{i,11} == 'b' %%%% if 'b' is chosen from the grand set then 'b' is preferred to any element
        seqsolLotteries(2,1,i)=1;
        seqsolLotteries(2,3,i)=1;
        seqsolLotteries(2,4,i)=1;
if choice_L_MAIN{i,9} == 'a'  %%%% if 'a' is chosen from the set with x,z,w then it is preferred to them
        seqsolLotteries(1,3,i)= 1;
        seqsolLotteries(1,4,i)= 1;
       if choice_L_MAIN{i,6} == 'c'
        seqsolLotteries(3,4,i)= 1;
       end
    if choice_L_MAIN{i,6} == 'd'
        seqsolLotteries(4,3,i)= 1;
    end
end
if choice_L_MAIN{i,9} == 'c'
        seqsolLotteries(3,1,i)= 1;
        seqsolLotteries(3,4,i)= 1;
        if choice_L_MAIN{i,3} == 'a'
          seqsolLotteries(1,4,i)= 1;
        end
    if choice_L_MAIN{i,3} == 'd'
          seqsolLotteries(4,1,i)= 1;
    end
end
if choice_L_MAIN{i,9} == 'd'
           seqsolLotteries(4,1,i)= 1;
        seqsolLotteries(4,3,i)= 1;
      if choice_L_MAIN{i,2} == 'a'
          seqsolLotteries(1,3,i)= 1;
      end
    if choice_L_MAIN{i,2} == 'c'
          seqsolLotteries(3,1,i)= 1;
    end
end
end
end


for i=1:size(choice_L_MAIN,1)
if choice_L_MAIN{i,11} == 'a'
        seqsolLotteries(1,2,i)=1;
        seqsolLotteries(1,3,i)=1;
        seqsolLotteries(1,4,i)=1;
if choice_L_MAIN{i,10} == 'b'
        seqsolLotteries(2,3,i)= 1;
        seqsolLotteries(2,4,i)= 1;
       if choice_L_MAIN{i,6} == 'c'
        seqsolLotteries(3,4,i)= 1;
       end
    if choice_L_MAIN{i,6} == 'd'
        seqsolLotteries(4,3,i)= 1;
    end
end
if choice_L_MAIN{i,10} == 'c'
        seqsolLotteries(3,2,i)= 1;
        seqsolLotteries(3,4,i)= 1;
        if choice_L_MAIN{i,5} == 'b'
          seqsolLotteries(2,4,i)= 1;
        end
    if choice_L_MAIN{i,5} == 'd'
          seqsolLotteries(4,2,i)= 1;
     end
end
if choice_L_MAIN{i,10} == 'd'
           seqsolLotteries(4,2,i)= 1;
        seqsolLotteries(4,3,i)= 1;
       if choice_L_MAIN{i,4} == 'b'
          seqsolLotteries(2,3,i)= 1;
      end
    if choice_L_MAIN{i,4} == 'c'
          seqsolLotteries(3,2,i)= 1;
    end
end
end
end



for i=1:size(choice_L_MAIN,1)
if choice_L_MAIN{i,11} == 'c'
        seqsolLotteries(3,1,i)=1;
        seqsolLotteries(3,2,i)=1;
        seqsolLotteries(3,4,i)=1;
if choice_L_MAIN{i,8} == 'a'
        seqsolLotteries(1,2,i)= 1;
        seqsolLotteries(1,4,i)= 1;
       if choice_L_MAIN{i,5} == 'b'
        seqsolLotteries(2,4,i)= 1;
       end
    if choice_L_MAIN{i,5} == 'd'
        seqsolLotteries(4,2,i)= 1;
    end
end
if choice_L_MAIN{i,8} == 'b'
        seqsolLotteries(2,1,i)= 1; 
        seqsolLotteries(2,4,i)= 1;
        if choice_L_MAIN{i,3} == 'a'
          seqsolLotteries(1,4,i)= 1;
        end
    if choice_L_MAIN{i,3} == 'd'
          seqsolLotteries(4,1,i)= 1;
     end
end
if choice_L_MAIN{i,8} == 'd'
        seqsolLotteries(4,1,i)= 1;
        seqsolLotteries(4,2,i)= 1;
       if choice_L_MAIN{i,1} == 'a'
          seqsolLotteries(1,2,i)= 1;
      end
    if choice_L_MAIN{i,1} == 'b'
          seqsolLotteries(2,1,i)= 1;
    end
end
end
end


for i=1:size(choice_L_MAIN,1)
if choice_L_MAIN{i,11} == 'd'
        seqsolLotteries(4,1,i)=1;
        seqsolLotteries(4,2,i)=1;
        seqsolLotteries(4,3,i)=1;
if choice_L_MAIN{i,7} == 'a'
        seqsolLotteries(1,2,i)= 1;
        seqsolLotteries(1,3,i)= 1;
       if choice_L_MAIN{i,4} == 'b'
        seqsolLotteries(2,3,i)= 1;
       end
    if choice_L_MAIN{i,4} == 'c'
        seqsolLotteries(3,2,i)= 1;
    end
end
if choice_L_MAIN{i,7} == 'b'
        seqsolLotteries(2,1,i)= 1;
        seqsolLotteries(2,3,i)= 1;
        if choice_L_MAIN{i,2} == 'a'
          seqsolLotteries(1,3,i)= 1;
        end
    if choice_L_MAIN{i,2} == 'c'
          seqsolLotteries(3,1,i)= 1;
    end
end
if choice_L_MAIN{i,7} == 'c'
        seqsolLotteries(3,1,i)= 1;
        seqsolLotteries(3,2,i)= 1;
      if choice_L_MAIN{i,1} == 'a'
          seqsolLotteries(1,2,i)= 1;
      end
    if choice_L_MAIN{i,1} == 'b'
          seqsolLotteries(2,1,i)= 1;
    end
end
end
end
end

%% Minimum Swaps
Rel = 12;
weights = zeros(Ns,Rel);

for i=1:Ns %%%weights is the vector of weights for the digraph with nodes [s,t] 
    k=sum(aRb,2);
    l=sum(bRa,2);
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
    k=sum(aRc,2);
    l=sum(cRa,2);
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
    k=sum(bRc,2);
    l=sum(cRb,2);
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
    k=sum(aRd,2);
    l=sum(dRa,2);
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
    k=sum(bRd,2);
    l=sum(dRb,2);
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
    k=sum(cRd,2);
    l=sum(dRc,2);
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

clear aRb aRc aRd bRa bRc bRd cRa cRb cRd dRa dRb dRc

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

minswapssolLotteries = zeros(size(S,2),size(S,2),Ns);

for i=1:Ns
minswapssolLotteries(:,:,i) = minswaps{i,1};
end

for z=1:Ns
    for i=1:size(S,2)
    for j=1:size(S,2)
       if minswapssolLotteries(i,j,z) == 0 && minswapssolLotteries(j,i,z) == 0 && i~=j
          minswapssolLotteries(i,j,z) = 1;
          minswapssolLotteries(j,i,z) = 1;
       end
    end
    end
end

%% Save all

% save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\Results Risk ALL','BernRangLotteries','countsolLotteries',...
%    'countrevsolLotteries','trcoreLotteries','eigensolLotteries','minswapssolLotteries', 'trcoreLotteries_BR');
%  save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\Results Risk MAIN','BernRangLotteries','countsolLotteries',...
%    'countrevsolLotteries','trcoreLotteries','eigensolLotteries','seqsolLotteries','minswapssolLotteries', 'trcoreLotteries_BR', 'Att_MS_Lotteries_acyclic', 'Att_BR_Lotteries_acyclic', 'Attention_pref');
  save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\Results Risk Binary','BernRangLotteries','countsolLotteries',...
     'countrevsolLotteries','trcoreLotteries','eigensolLotteries','minswapssolLotteries', 'trcoreLotteries_BR');


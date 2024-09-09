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


%%%

sum(Attention_pref==Att_MS_Delayed_acyclic & Attention_pref==1,'all')
sum(Attention_pref==Att_BR_Delayed_acyclic & Attention_pref==1,'all')
sum(Attention_pref==1,'all')


load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Time Ranking.mat')

testATT = zeros(size(Time_Ranking,3),1);
for i = 1:size(Time_Ranking,3)
    testATT(i,1) = isequal(Time_Ranking(:,:,i),Attention_pref(:,:,i));
end
testATT_MS_acyc = zeros(size(Time_Ranking,3),1);
for i = 1:size(Time_Ranking,3)
    testATT_MS_acyc(i,1) = isequal(Time_Ranking(:,:,i),Att_MS_Delayed_acyclic(:,:,i));
end
testATT_BR_acyc = zeros(size(Time_Ranking,3),1);
for i = 1:size(Time_Ranking,3)
    testATT_BR_acyc(i,1) = isequal(Time_Ranking(:,:,i),Att_BR_Delayed_acyclic(:,:,i));
end


WRI_ATT = sum(testATT)/N;
WRI_ATT_MS = sum(testATT_MS)/N;
WRI_ATT_BR = sum(testATT_BR)/N;
WRI_ATT_MS_acyc = sum(testATT_MS_acyc)/N;
WRI_ATT_BR_acyc = sum(testATT_BR_acyc)/N;


Diff_ATT = Attention_pref - Time_Ranking;
Diff_ATT_MS = Att_MS_Delayed - Time_Ranking;
Diff_ATT_BR = Att_BR_Delayed - Time_Ranking;
Diff_ATT_MS_acyc = Att_MS_Delayed_acyclic - Time_Ranking;
Diff_ATT_BR_acyc = Att_BR_Delayed_acyclic - Time_Ranking;
SD_ATT = sum(sum(sum(abs(Diff_ATT)))); 
SD_ATT_MS = sum(sum(sum(abs(Diff_ATT_MS))));
SD_ATT_BR = sum(sum(sum(abs(Diff_ATT_BR)))); 
SD_ATT_MS_acyc = sum(sum(sum(abs(Diff_ATT_MS_acyc))));
SD_ATT_BR_acyc = sum(sum(sum(abs(Diff_ATT_BR_acyc)))); 

%% RISK

clear
clc

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Creating all datasets\Risk Datasets\Datasets_Risk.mat')

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

Att_MS_Lotteries = Attention_pref+minswapssolLotteries;
Att_BR_Lotteries = Attention_pref+BernRangLotteries;

Att_MS_Lotteries(Att_MS_Lotteries>0)=1;
Att_BR_Lotteries(Att_BR_Lotteries>0)=1;

for i=1:N
    Att_graph_ATT_MS{i,1} = digraph(Att_MS_Lotteries(:,:,i));
    Att_graph_ATT_BR{i,1} = digraph(Att_BR_Lotteries(:,:,i));
    cycles_ATT_MS(i,1) = isdag(Att_graph_ATT_MS{i,1});
    cycles_ATT_BR(i,1) = isdag(Att_graph_ATT_BR{i,1});
end
sum(cycles_ATT_MS)
sum(cycles_ATT_BR)

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
sum(Attention_pref==Att_MS_Lotteries_acyclic & Attention_pref==1,'all')
sum(Attention_pref==Att_BR_Lotteries_acyclic & Attention_pref==1,'all')
sum(Attention_pref==1,'all')


load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Risk Ranking.mat')

testATT = zeros(size(Risk_Ranking,3),1);
for i = 1:size(Risk_Ranking,3)
    testATT(i,1) = isequal(Risk_Ranking(:,:,i),Attention_pref(:,:,i));
end
testATT_MS = zeros(size(Risk_Ranking,3),1);
for i = 1:size(Risk_Ranking,3)
    testATT_MS(i,1) = isequal(Risk_Ranking(:,:,i),Att_MS_Lotteries(:,:,i));
end
testATT_BR = zeros(size(Risk_Ranking,3),1);
for i = 1:size(Risk_Ranking,3)
    testATT_BR(i,1) = isequal(Risk_Ranking(:,:,i),Att_BR_Lotteries(:,:,i));
end
testATT_MS_acyc = zeros(size(Risk_Ranking,3),1);
for i = 1:size(Risk_Ranking,3)
    testATT_MS_acyc(i,1) = isequal(Risk_Ranking(:,:,i),Att_MS_Lotteries_acyclic(:,:,i));
end
testATT_BR_acyc = zeros(size(Risk_Ranking,3),1);
for i = 1:size(Risk_Ranking,3)
    testATT_BR_acyc(i,1) = isequal(Risk_Ranking(:,:,i),Att_BR_Lotteries_acyclic(:,:,i));
end


WRI_ATT = sum(testATT)/N;
WRI_ATT_MS = sum(testATT_MS)/N;
WRI_ATT_BR = sum(testATT_BR)/N;
WRI_ATT_MS_acyc = sum(testATT_MS_acyc)/N;
WRI_ATT_BR_acyc = sum(testATT_BR_acyc)/N;


Diff_ATT = Attention_pref - Risk_Ranking;
Diff_ATT_MS = Att_MS_Lotteries - Risk_Ranking;
Diff_ATT_BR = Att_BR_Lotteries - Risk_Ranking;
Diff_ATT_MS_acyc = Att_MS_Lotteries_acyclic - Risk_Ranking;
Diff_ATT_BR_acyc = Att_BR_Lotteries_acyclic - Risk_Ranking;
SD_ATT = sum(sum(sum(abs(Diff_ATT)))); 
SD_ATT_MS = sum(sum(sum(abs(Diff_ATT_MS))));
SD_ATT_BR = sum(sum(sum(abs(Diff_ATT_BR)))); 
SD_ATT_MS_acyc = sum(sum(sum(abs(Diff_ATT_MS_acyc))));
SD_ATT_BR_acyc = sum(sum(sum(abs(Diff_ATT_BR_acyc)))); 
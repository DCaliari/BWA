clear
clc

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Risk Ranking.mat')

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\Results Risk MAIN.mat')

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\Results Risk MAIN.mat','seqsolLotteries', 'Att_BR_Lotteries_acyclic',...
    'Att_MS_Lotteries_acyclic','Attention_pref')

N=145;

%% WRI Identification

testBR = zeros(size(Risk_Ranking,3),1);
testCRP = zeros(size(Risk_Ranking,3),1);
testCC = zeros(size(Risk_Ranking,3),1);
testMS = zeros(size(Risk_Ranking,3),1);
testEIG = zeros(size(Risk_Ranking,3),1);
testSEQ = zeros(size(Risk_Ranking,3),1);
testTC = zeros(size(Risk_Ranking,3),1);
testTC_BR = zeros(size(Risk_Ranking,3),1);
testATT = zeros(size(Risk_Ranking,3),1);
testATT_BR = zeros(size(Risk_Ranking,3),1);
testATT_MS = zeros(size(Risk_Ranking,3),1);

for i = 1:size(Risk_Ranking,3)
    testBR(i,1) = isequal(Risk_Ranking(:,:,i),BernRangLotteries(:,:,i));
end
for i = 1:size(Risk_Ranking,3)
    testCRP(i,1) = isequal(Risk_Ranking(:,:,i),countrevsolLotteries(:,:,i));
end
for i = 1:size(Risk_Ranking,3)
    testCC(i,1) = isequal(Risk_Ranking(:,:,i),countsolLotteries(:,:,i));
end
for i = 1:size(Risk_Ranking,3)
    testMS(i,1) = isequal(Risk_Ranking(:,:,i),minswapssolLotteries(:,:,i));
end
for i = 1:size(Risk_Ranking,3)
    testEIG(i,1) = isequal(Risk_Ranking(:,:,i),eigensolLotteries(:,:,i));
end
for i = 1:size(Risk_Ranking,3)
    testSEQ(i,1) = isequal(Risk_Ranking(:,:,i),seqsolLotteries(:,:,i));
end
for i = 1:size(Risk_Ranking,3)
    testTC(i,1) = isequal(Risk_Ranking(:,:,i),trcoreLotteries(:,:,i));
end
for i = 1:size(Risk_Ranking,3)
    testTC_BR(i,1) = isequal(Risk_Ranking(:,:,i),trcoreLotteries_BR(:,:,i));
end
for i = 1:size(Risk_Ranking,3)
    testATT(i,1) = isequal(Risk_Ranking(:,:,i),Attention_pref(:,:,i));
end
for i = 1:size(Risk_Ranking,3)
    testATT_BR(i,1) = isequal(Risk_Ranking(:,:,i),Att_BR_Lotteries_acyclic(:,:,i));
end
for i = 1:size(Risk_Ranking,3)
    testATT_MS(i,1) = isequal(Risk_Ranking(:,:,i),Att_MS_Lotteries_acyclic(:,:,i));
end


WRI_BR = sum(testBR)/N;
WRI_CRP = sum(testCRP)/N;
WRI_CC = sum(testCC)/N;
WRI_MS = sum(testMS)/N;
WRI_EIG = sum(testEIG)/N;
WRI_SEQ = sum(testSEQ)/N;
WRI_TC = sum(testTC)/N;
WRI_TC_BR = sum(testTC_BR)/N;
WRI_ATT = sum(testATT)/N;
WRI_ATT_BR = sum(testATT_BR)/N;
WRI_ATT_MS = sum(testATT_MS)/N;


save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\WRI Identification Risk MAIN','WRI_BR','WRI_CC','WRI_CRP','WRI_EIG','WRI_TC','WRI_SEQ','WRI_MS','WRI_TC_BR','WRI_ATT','WRI_ATT_BR','WRI_ATT_MS');

%% UI Identification


winner_Rank=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(Risk_Ranking(i,:,z))==3
           winner_Rank(z,i)=1;
       else
           winner_Rank(z,i)=0;
       end
    end
end

winner_BR=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(BernRangLotteries(i,:,z))==3
           winner_BR(z,i)=1;
       else
           winner_BR(z,i)=0;
       end
    end
end

winner_CRP=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(countrevsolLotteries(i,:,z))==3
           winner_CRP(z,i)=1;
       else
           winner_CRP(z,i)=0;
       end
    end
end
winner_CC=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(countsolLotteries(i,:,z))==3
           winner_CC(z,i)=1;
       else
           winner_CC(z,i)=0;
       end
    end
end
winner_EIG=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(eigensolLotteries(i,:,z))==3
           winner_EIG(z,i)=1;
       else
           winner_EIG(z,i)=0;
       end
    end
end
winner_TC=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(trcoreLotteries(i,:,z))==3
           winner_TC(z,i)=1;
       else
           winner_TC(z,i)=0;
       end
    end
end
winner_SEQ=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(seqsolLotteries(i,:,z))==3
           winner_SEQ(z,i)=1;
       else
           winner_SEQ(z,i)=0;
       end
    end
end
winner_MS=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(minswapssolLotteries(i,:,z))==3
           winner_MS(z,i)=1;
       else
           winner_MS(z,i)=0;
       end
    end
end
winner_TC_BR=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(trcoreLotteries_BR(i,:,z))==3
           winner_TC_BR(z,i)=1;
       else
           winner_TC_BR(z,i)=0;
       end
    end
end
winner_ATT=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(Attention_pref(i,:,z))==3
           winner_ATT(z,i)=1;
       else
           winner_ATT(z,i)=0;
       end
    end
end
winner_ATT_BR=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(Att_BR_Lotteries_acyclic(i,:,z))==3
           winner_ATT_BR(z,i)=1;
       else
           winner_ATT_BR(z,i)=0;
       end
    end
end
winner_ATT_MS=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(Att_MS_Lotteries_acyclic(i,:,z))==3
           winner_ATT_MS(z,i)=1;
       else
           winner_ATT_MS(z,i)=0;
       end
    end
end

for z = 1:N
BR_Rank(z,1) = isequal(winner_BR(z,:),winner_Rank(z,:));
end
UI_BR = sum(BR_Rank)/N;
for z = 1:N
CRP_Rank(z,1) = isequal(winner_CRP(z,:),winner_Rank(z,:));
end
UI_CRP = sum(CRP_Rank)/N;
for z = 1:N
CC_Rank(z,1) = isequal(winner_CC(z,:),winner_Rank(z,:));
end
UI_CC = sum(CC_Rank)/N;
for z = 1:N
EIG_Rank(z,1) = isequal(winner_EIG(z,:),winner_Rank(z,:));
end
UI_EIG = sum(EIG_Rank)/N;
for z = 1:N
TC_Rank(z,1) = isequal(winner_TC(z,:),winner_Rank(z,:));
end
UI_TC = sum(TC_Rank)/N;
for z = 1:N
SEQ_Rank(z,1) = isequal(winner_SEQ(z,:),winner_Rank(z,:));
end
UI_SEQ = sum(SEQ_Rank)/N;
for z = 1:N
MS_Rank(z,1) = isequal(winner_MS(z,:),winner_Rank(z,:));
end
UI_MS = sum(MS_Rank)/N;
for z = 1:N
TC_BR_Rank(z,1) = isequal(winner_TC_BR(z,:),winner_Rank(z,:));
end
UI_TC_BR = sum(TC_BR_Rank)/N;
for z = 1:N
ATT_Rank(z,1) = isequal(winner_ATT(z,:),winner_Rank(z,:));
end
UI_ATT = sum(ATT_Rank)/N;
for z = 1:N
ATT_BR_Rank(z,1) = isequal(winner_ATT_BR(z,:),winner_Rank(z,:));
end
UI_ATT_BR = sum(ATT_BR_Rank)/N;
for z = 1:N
ATT_MS_Rank(z,1) = isequal(winner_ATT_MS(z,:),winner_Rank(z,:));
end
UI_ATT_MS = sum(ATT_MS_Rank)/N;

save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\UI Identification Risk MAIN','UI_BR','UI_CC','UI_CRP','UI_EIG','UI_TC','UI_SEQ','UI_MS','UI_ATT_MS','UI_ATT_BR','UI_ATT','UI_TC_BR');

%% Expected Identification


%%%%%%%%%% Bernheim and Rangel has to be completed in order to calculate 
%%%%%%%%%% the set identification or the set of maximal elements
%%%%%%%%%% that is different from the set of best elements in incomplete
%%%%%%%%%% relations and particularly in non-transitive relations


for z=1:size(BernRangLotteries,3)
for i=1:4
for j=1:4
     if BernRangLotteries(i,j,z)==BernRangLotteries(j,i,z) && i ~=j
        BernRangLotteries(i,j,z)=1;
        BernRangLotteries(j,i,z)=1;
     end
     if Attention_pref(i,j,z)==Attention_pref(j,i,z) && i ~=j
        Attention_pref(i,j,z)=1;
        Attention_pref(j,i,z)=1;
     end   
     if Att_MS_Lotteries_acyclic(i,j,z)==Att_MS_Lotteries_acyclic(j,i,z) && i ~=j
        Att_MS_Lotteries_acyclic(i,j,z)=1;
        Att_MS_Lotteries_acyclic(j,i,z)=1;
     end     
     if Att_BR_Lotteries_acyclic(i,j,z)==Att_BR_Lotteries_acyclic(j,i,z) && i ~=j
        Att_BR_Lotteries_acyclic(i,j,z)=1;
        Att_BR_Lotteries_acyclic(j,i,z)=1;
     end  
     if trcoreLotteries(i,j,z)==0 && trcoreLotteries(j,i,z)==0 && i~=j
        trcoreLotteries(i,j,z)=1;
        trcoreLotteries(j,i,z)=1;
     end     
     if trcoreLotteries_BR(i,j,z)==0 && trcoreLotteries_BR(j,i,z)==0 && i~=j
        trcoreLotteries_BR(i,j,z)=1;
        trcoreLotteries_BR(j,i,z)=1;
     end
end
end
end


winner_BR=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(BernRangLotteries(i,:,z))==3
           winner_BR(z,i)=1;
       else
           winner_BR(z,i)=0;
       end
    end
end

winner_ATT=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(Att_BR_Lotteries_acyclic(i,:,z))==3
           winner_ATT(z,i)=1;
       else
           winner_ATT(z,i)=0;
       end
    end
end


winner_ATT_MS=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(Att_MS_Lotteries_acyclic(i,:,z))==3
           winner_ATT_MS(z,i)=1;
       else
           winner_ATT_MS(z,i)=0;
       end
    end
end

winner_ATT_BR=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(Att_BR_Lotteries_acyclic(i,:,z))==3
           winner_ATT_BR(z,i)=1;
       else
           winner_ATT_BR(z,i)=0;
       end
    end
end

winner_TC_BR=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(trcoreLotteries_BR(i,:,z))==3
           winner_TC_BR(z,i)=1;
       else
           winner_TC_BR(z,i)=0;
       end
    end
end
winner_TC=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(trcoreLotteries(i,:,z))==3
           winner_TC(z,i)=1;
       else
           winner_TC(z,i)=0;
       end
    end
end


%%%%%%%%%%%%%%

max_CC_Rank = winner_CC - winner_Rank;
max_CRP_Rank = winner_CRP - winner_Rank;
max_MS_Rank = winner_MS - winner_Rank;
max_EIG_Rank = winner_EIG - winner_Rank;
max_SEQ_Rank = winner_SEQ - winner_Rank;
max_BR_Rank = winner_BR - winner_Rank;
max_TC_Rank = winner_TC - winner_Rank;
max_TC_BR_Rank = winner_TC_BR - winner_Rank;
max_ATT_Rank = winner_ATT - winner_Rank;
max_ATT_MS_Rank = winner_ATT_MS - winner_Rank;
max_ATT_BR_Rank = winner_ATT_BR - winner_Rank;

%%%%%%%%%

for z = 1:145
Max_CC_Rank(z,1) = all(max_CC_Rank(z,:)>=0);
Max_CRP_Rank(z,1) = all(max_CRP_Rank(z,:)>=0);
Max_MS_Rank(z,1) = all(max_MS_Rank(z,:)>=0);
Max_EIG_Rank(z,1) = all(max_EIG_Rank(z,:)>=0);
Max_SEQ_Rank(z,1) = all(max_SEQ_Rank(z,:)>=0);
Max_BR_Rank(z,1) = all(max_BR_Rank(z,:)>=0);
Max_TC_Rank(z,1) = all(max_TC_Rank(z,:)>=0);
Max_TC_BR_Rank(z,1) = all(max_TC_BR_Rank(z,:)>=0);
Max_ATT_Rank(z,1) = all(max_ATT_Rank(z,:)>=0);
Max_ATT_MS_Rank(z,1) = all(max_ATT_MS_Rank(z,:)>=0);
Max_ATT_BR_Rank(z,1) = all(max_ATT_BR_Rank(z,:)>=0);
end

SetId_BR = sum(Max_BR_Rank)/N;
SetId_CC = sum(Max_CC_Rank)/N;
SetId_CRP = sum(Max_CRP_Rank)/N;
SetId_MS = sum(Max_MS_Rank)/N;
SetId_EIG = sum(Max_EIG_Rank)/N;
SetId_SEQ = sum(Max_SEQ_Rank)/N;
SetId_TC = sum(Max_TC_Rank)/N;
SetId_TC_BR = sum(Max_TC_BR_Rank)/N;
SetId_ATT = sum(Max_ATT_Rank)/N;
SetId_ATT_MS = sum(Max_ATT_MS_Rank)/N;
SetId_ATT_BR = sum(Max_ATT_BR_Rank)/N;


Card_Max_CC = sum(winner_CC,2);
Card_Max_CRP = sum(winner_CRP,2);
Card_Max_MS = sum(winner_MS,2);
Card_Max_EIG = sum(winner_EIG,2);
Card_Max_SEQ = sum(winner_SEQ,2);
Card_Max_BR = sum(winner_BR,2);
Card_Max_TC = sum(winner_TC,2);
Card_Max_TC_BR = sum(winner_TC_BR,2);
Card_Max_ATT = sum(winner_ATT,2);
Card_Max_ATT_MS = sum(winner_ATT_MS,2);
Card_Max_ATT_BR = sum(winner_ATT_BR,2);

for z=1:145
    if BR_Rank(z,1)==1 || Max_BR_Rank(z,1) == 0
Card_Max_BR(z,1) = 0;
    end
end
for z=1:145
    if CC_Rank(z,1)==1 || Max_CC_Rank(z,1) == 0
Card_Max_CC(z,1) = 0;
    end
end
for z=1:145
    if CRP_Rank(z,1)==1 || Max_CRP_Rank(z,1) == 0
Card_Max_CRP(z,1) = 0;
    end
end
for z=1:145
    if TC_Rank(z,1)==1 || Max_TC_Rank(z,1) == 0
Card_Max_TC(z,1) = 0;
    end
end
for z=1:145
    if SEQ_Rank(z,1)==1 || Max_SEQ_Rank(z,1) == 0
Card_Max_SEQ(z,1) = 0;
    end
end
for z=1:145
    if EIG_Rank(z,1)==1 || Max_EIG_Rank(z,1) == 0
Card_Max_EIG(z,1) = 0;
    end
end
for z=1:145
    if MS_Rank(z,1)==1 || Max_MS_Rank(z,1) == 0
Card_Max_MS(z,1) = 0;
    end
end
for z=1:145
    if TC_BR_Rank(z,1)==1 || Max_TC_BR_Rank(z,1) == 0
Card_Max_TC_BR(z,1) = 0;
    end
end
for z=1:145
    if ATT_Rank(z,1)==1 || Max_ATT_Rank(z,1) == 0
Card_Max_ATT(z,1) = 0;
    end
end
for z=1:145
    if ATT_MS_Rank(z,1)==1 || Max_ATT_MS_Rank(z,1) == 0
Card_Max_ATT_MS(z,1) = 0;
    end
end
for z=1:145
    if ATT_BR_Rank(z,1)==1 || Max_ATT_BR_Rank(z,1) == 0
Card_Max_ATT_BR(z,1) = 0;
    end
end

Card_Max_CC(Card_Max_CC==0)= [];
Card_Max_CRP(Card_Max_CRP==0)= [];
Card_Max_MS(Card_Max_MS==0)= [];
Card_Max_EIG(Card_Max_EIG==0)= [];
Card_Max_SEQ(Card_Max_SEQ==0)= [];
Card_Max_BR(Card_Max_BR==0)= [];
Card_Max_TC(Card_Max_TC==0)= [];
Card_Max_TC_BR(Card_Max_TC_BR==0)= [];
Card_Max_ATT(Card_Max_ATT==0)= [];
Card_Max_ATT_BR(Card_Max_ATT_BR==0)= [];
Card_Max_ATT_MS(Card_Max_ATT_MS==0)= [];

Card_Max_CC = 1./Card_Max_CC;
Card_Max_CRP = 1./Card_Max_CRP;
Card_Max_MS = 1./Card_Max_MS;
Card_Max_BR = 1./Card_Max_BR;
Card_Max_TC = 1./Card_Max_TC;
Card_Max_EIG = 1./Card_Max_EIG;
Card_Max_SEQ = 1./Card_Max_SEQ;
Card_Max_TC_BR = 1./Card_Max_TC_BR;
Card_Max_ATT = 1./Card_Max_ATT;
Card_Max_ATT_BR = 1./Card_Max_ATT_BR;
Card_Max_ATT_MS = 1./Card_Max_ATT_MS;

Card_Max_CC = sum(Card_Max_CC) + sum(CC_Rank);
Card_Max_CRP = sum(Card_Max_CRP) + sum(CRP_Rank);
Card_Max_MS = sum(Card_Max_MS) + sum(MS_Rank);
Card_Max_BR = sum(Card_Max_BR) + sum(BR_Rank);
Card_Max_TC = sum(Card_Max_TC) + sum(TC_Rank);
Card_Max_SEQ = sum(Card_Max_SEQ) + sum(SEQ_Rank);
Card_Max_EIG = sum(Card_Max_EIG) + sum(EIG_Rank);
Card_Max_TC_BR = sum(Card_Max_TC_BR) + sum(TC_BR_Rank);
Card_Max_ATT = sum(Card_Max_ATT) + sum(ATT_Rank);
Card_Max_ATT_MS = sum(Card_Max_ATT_MS) + sum(ATT_MS_Rank);
Card_Max_ATT_BR = sum(Card_Max_ATT_BR) + sum(ATT_BR_Rank);


EI_BR = Card_Max_BR/N;
EI_CC = Card_Max_CC/N;
EI_CRP = Card_Max_CRP/N;
EI_EIG = Card_Max_EIG/N;
EI_TC = Card_Max_TC/N;
EI_MS = Card_Max_MS/N;
EI_SEQ = Card_Max_SEQ/N;
EI_TC_BR = Card_Max_TC_BR/N;
EI_ATT = Card_Max_ATT/N;
EI_ATT_MS = Card_Max_ATT_MS/N;
EI_ATT_BR = Card_Max_ATT_BR/N;

save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\EI Identification Risk MAIN','EI_BR','EI_CC','EI_CRP','EI_EIG','EI_TC','EI_SEQ','EI_MS','EI_TC_BR','EI_ATT_BR','EI_ATT_MS','EI_ATT');



%% Symmetric DIfference and Reverse Asymmetry

Diff_CRP = countrevsolLotteries - Risk_Ranking;
Diff_CC = countsolLotteries - Risk_Ranking;
Diff_EIG = eigensolLotteries - Risk_Ranking;
Diff_SEQ = seqsolLotteries - Risk_Ranking;
Diff_TC = trcoreLotteries - Risk_Ranking;
Diff_BR = BernRangLotteries - Risk_Ranking;
Diff_MS = minswapssolLotteries - Risk_Ranking;
Diff_TC_BR = trcoreLotteries_BR - Risk_Ranking;
Diff_ATT = Attention_pref - Risk_Ranking;
Diff_ATT_MS = Att_MS_Lotteries_acyclic - Risk_Ranking;
Diff_ATT_BR = Att_BR_Lotteries_acyclic - Risk_Ranking;


SD_CRP = sum(sum(sum(abs(Diff_CRP)))); 
SD_CC = sum(sum(sum(abs(Diff_CC)))); 
SD_EIG = sum(sum(sum(abs(Diff_EIG)))); 
SD_SEQ = sum(sum(sum(abs(Diff_SEQ)))); 
SD_TC = sum(sum(sum(abs(Diff_TC)))); 
SD_BR = sum(sum(sum(abs(Diff_BR)))); 
SD_MS = sum(sum(sum(abs(Diff_MS)))); 
SD_TC_BR = sum(sum(sum(abs(Diff_TC_BR)))); 
SD_ATT = sum(sum(sum(abs(Diff_ATT)))); 
SD_ATT_MS = sum(sum(sum(abs(Diff_ATT_MS))));
SD_ATT_BR = sum(sum(sum(abs(Diff_ATT_BR))));

save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\SD Identification Risk MAIN','SD_BR','SD_CC','SD_CRP','SD_EIG','SD_TC','SD_SEQ','SD_MS','SD_TC_BR','SD_ATT','SD_ATT_MS','SD_ATT_BR');

for z=1:N
l_CRP(:,:,z)=transpose(Diff_CRP(:,:,z)).*Diff_CRP(:,:,z);
l_CC(:,:,z)=transpose(Diff_CC(:,:,z)).*Diff_CC(:,:,z);
l_EIG(:,:,z)=transpose(Diff_EIG(:,:,z)).*Diff_EIG(:,:,z);
l_SEQ(:,:,z)=transpose(Diff_SEQ(:,:,z)).*Diff_SEQ(:,:,z);
l_TC(:,:,z)=transpose(Diff_TC(:,:,z)).*Diff_TC(:,:,z);
l_BR(:,:,z)=transpose(Diff_BR(:,:,z)).*Diff_BR(:,:,z);
l_MS(:,:,z)=transpose(Diff_MS(:,:,z)).*Diff_MS(:,:,z);
l_TC_BR(:,:,z)=transpose(Diff_TC_BR(:,:,z)).*Diff_TC_BR(:,:,z);
l_ATT(:,:,z)=transpose(Diff_ATT(:,:,z)).*Diff_ATT(:,:,z);
l_ATT_BR(:,:,z)=transpose(Diff_ATT_BR(:,:,z)).*Diff_ATT_BR(:,:,z);
l_ATT_MS(:,:,z)=transpose(Diff_ATT_MS(:,:,z)).*Diff_ATT_MS(:,:,z);
end

l_CRP(l_CRP>0)=0;
l_CC(l_CC>0)=0;
l_EIG(l_EIG>0)=0;
l_SEQ(l_SEQ>0)=0;
l_TC(l_TC>0)=0;
l_BR(l_BR>0)=0;
l_MS(l_MS>0)=0;
l_TC_BR(l_TC_BR>0)=0;
l_ATT(l_ATT>0)=0;
l_ATT_BR(l_ATT_BR>0)=0;
l_ATT_MS(l_ATT_MS>0)=0;

for z=1:N
    m_CRP(1,z) = (sum(sum(l_CRP(:,:,z)))*-1)/2;
    m_CC(1,z) = (sum(sum(l_CC(:,:,z)))*-1)/2;
    m_EIG(1,z) = (sum(sum(l_EIG(:,:,z)))*-1)/2;
    m_SEQ(1,z) = (sum(sum(l_SEQ(:,:,z)))*-1)/2;
    m_TC(1,z) = (sum(sum(l_TC(:,:,z)))*-1)/2;
    m_BR(1,z) = (sum(sum(l_BR(:,:,z)))*-1)/2;    
    m_MS(1,z) = (sum(sum(l_MS(:,:,z)))*-1)/2;     
    m_TC_BR(1,z) = (sum(sum(l_TC_BR(:,:,z)))*-1)/2;  
    m_ATT(1,z) = (sum(sum(l_ATT(:,:,z)))*-1)/2;  
    m_ATT_BR(1,z) = (sum(sum(l_ATT_BR(:,:,z)))*-1)/2;  
    m_ATT_MS(1,z) = (sum(sum(l_ATT_MS(:,:,z)))*-1)/2;  
end    

RA_CRP = sum(m_CRP);
RA_CC = sum(m_CC);
RA_EIG = sum(m_EIG);
RA_SEQ = sum(m_SEQ);
RA_TC = sum(m_TC);
RA_BR = sum(m_BR);
RA_MS = sum(m_MS);
RA_TC_BR = sum(m_TC_BR);
RA_ATT = sum(m_ATT);
RA_ATT_BR = sum(m_ATT_BR);
RA_ATT_MS = sum(m_ATT_MS);

save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\RA Identification Risk MAIN','RA_BR','RA_CC','RA_CRP','RA_EIG','RA_TC','RA_SEQ','RA_MS','RA_TC_BR','RA_ATT','RA_ATT_BR','RA_ATT_MS');

%% Set identification for WRI

[~,~,~,~,~,linear,~,~] = binaryrelations(4);

for i=1:145
    if m_BR(i)==0
        set_BR(i)=0;
        for j=1:24
            temp = BernRangLotteries(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_BR(i) = set_BR(i) + 1;
            else
            end
        end
    elseif m_BR(i)>0
        set_BR(i)=0;
    end
end


for i=1:145
    if m_MS(i)==0
        set_MS(i)=0;
        for j=1:24
            temp = minswapssolLotteries(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_MS(i) = set_MS(i) + 1;
            else
            end
        end
    elseif m_MS(i)>0
        set_MS(i)=0;
    end
end


for i=1:145
    if m_EIG(i)==0
        set_EIG(i)=0;
        for j=1:24
            temp = eigensolLotteries(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_EIG(i) = set_EIG(i) + 1;
            else
            end
        end
    elseif m_EIG(i)>0
        set_EIG(i)=0;
    end
end

for i=1:145
    if m_CC(i)==0
        set_CC(i)=0;
        for j=1:24
            temp = countsolLotteries(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_CC(i) = set_CC(i) + 1;
            else
            end
        end
    elseif m_CC(i)>0
        set_CC(i)=0;
    end
end


for i=1:145
    if m_CRP(i)==0
        set_CRP(i)=0;
        for j=1:24
            temp = countrevsolLotteries(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_CRP(i) = set_CRP(i) + 1;
            else
            end
        end
    elseif m_CRP(i)>0
        set_CRP(i)=0;
    end
end


for i=1:145
    if m_SEQ(i)==0
        set_SEQ(i)=0;
        for j=1:24
            temp = seqsolLotteries(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_SEQ(i) = set_SEQ(i) + 1;
            else
            end
        end
    elseif m_SEQ(i)>0
        set_SEQ(i)=0;
    end
end

for i=1:145
    if m_TC(i)==0
        set_TC(i)=0;
        for j=1:24
            temp = trcoreLotteries(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_TC(i) = set_TC(i) + 1;
            else
            end
        end
    elseif m_TC(i)>0
        set_TC(i)=0;
    end
end

for i=1:145
    if m_TC_BR(i)==0
        set_TC_BR(i)=0;
        for j=1:24
            temp = trcoreLotteries_BR(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_TC_BR(i) = set_TC_BR(i) + 1;
            else
            end
        end
    elseif m_TC_BR(i)>0
        set_TC_BR(i)=0;
    end
end

for i=1:145
    if m_ATT(i)==0
        set_ATT(i)=0;
        for j=1:24
            temp = Attention_pref(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_ATT(i) = set_ATT(i) + 1;
            else
            end
        end
    elseif m_ATT(i)>0
        set_ATT(i)=0;
    end
end

for i=1:145
    if m_ATT_BR(i)==0
        set_ATT_BR(i)=0;
        for j=1:24
            temp = Att_BR_Lotteries_acyclic(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_ATT_BR(i) = set_ATT_BR(i) + 1;
            else
            end
        end
    elseif m_ATT_BR(i)>0
        set_ATT_BR(i)=0;
    end
end

for i=1:145
    if m_ATT_MS(i)==0
        set_ATT_MS(i)=0;
        for j=1:24
            temp = Att_MS_Lotteries_acyclic(:,:,i) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_ATT_MS(i) = set_ATT_MS(i) + 1;
            else
            end
        end
    elseif m_ATT_MS(i)>0
        set_ATT_MS(i)=0;
    end
end

setWRI_BR = sum(set_BR>0)/145;
setWRI_CRP = sum(set_CRP>0)/145;
setWRI_CC = sum(set_CC>0)/145;
setWRI_MS = sum(set_MS>0)/145;
setWRI_EIG = sum(set_EIG>0)/145;
setWRI_SEQ = sum((set_SEQ>0))/145;
setWRI_TC = sum((set_TC>0))/145;
setWRI_TC_BR = sum((set_TC_BR>0))/145;
setWRI_ATT = sum((set_ATT>0))/145;
setWRI_ATT_BR = sum((set_ATT_BR>0))/145;
setWRI_ATT_MS = sum((set_ATT_MS>0))/145;


exp_BR = sum(1./set_BR(set_BR>0))/145;
exp_CRP = sum(1./set_CRP(set_CRP>0))/145;
exp_CC = sum(1./set_CC(set_CC>0))/145;
exp_MS = sum(1./set_MS(set_MS>0))/145;
exp_EIG = sum(1./set_EIG(set_EIG>0))/145;
exp_SEQ = sum(1./set_SEQ(set_SEQ>0))/145;
exp_TC = sum(1./set_TC(set_TC>0))/145;
exp_TC_BR = sum(1./set_TC_BR(set_TC_BR>0))/145;
exp_ATT = sum(1./set_ATT(set_ATT>0))/145;
exp_ATT_BR = sum(1./set_ATT_BR(set_ATT_BR>0))/145;
exp_ATT_MS = sum(1./set_ATT_MS(set_ATT_MS>0))/145;

save('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\SET_WRI Identification Risk MAIN','exp_BR','exp_CC','exp_CRP','exp_EIG','exp_TC','exp_SEQ','exp_MS','exp_TC_BR','exp_ATT','exp_ATT_BR','exp_ATT_MS');


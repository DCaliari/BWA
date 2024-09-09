clear
clc

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Risk Ranking.mat')
load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Revealed Pref ALL\Revealed Preference Risk\Variables Risk ALL.mat')

[~,~,~,~,~,linear,~,~] = binaryrelations(4);

N = 145;
Dom = 25;
S = {'a','b','c','d'};

%%%%%%%% Best elements collected preferences
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
%%%%%%%%%%%

%Bin = 0.1;
%Ter = 0.3;
%Quat = 0.6;
%AD = 0.4;
%Big = 0.4;
%count = 0;

Bin = -0.1:0.1:0.6;
Ter = 0.4:0.1:1;
Quat = 0.4:0.1:1;
AD = 0.4:0.1:1;
Big = 0.3:0.1:1;
count = 0;



Result = zeros(size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2),2);
Exp_WCRP = zeros(size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2),1);
Weights = zeros(1,5,size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2));
EntireId = zeros(size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2),1);
RA = zeros(size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2),1);
Ent_Exp = zeros(size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2),1);
SymmDiff = zeros(size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2),1);
WCRP = cell(size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2),1);
UI_WCRP = cell(size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2),1);
exp_OW = zeros(size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2),1);
Exp_Exp = zeros(size(Bin,2)*size(Ter,2)*size(Quat,2)*size(Big,2)*size(AD,2),1);


for t1=1:size(Bin,2)
for t2=1:size(Ter,2)
for t3=1:size(Quat,2)
for t4=1:size(Big,2)
for t5=1:size(AD,2)
    count = count + 1;

eaRb=zeros(N,Dom);
eaRc=zeros(N,Dom);
eaRd=zeros(N,Dom);
ebRc=zeros(N,Dom);
ebRd=zeros(N,Dom);
ebRa=zeros(N,Dom);
ecRa=zeros(N,Dom);
ecRb=zeros(N,Dom);
ecRd=zeros(N,Dom);
edRa=zeros(N,Dom);
edRb=zeros(N,Dom);
edRc=zeros(N,Dom);
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(aRb,1)
        eaRb(z,i)=aRb(z,i)*Bin(1,t1);
        eaRb(z,j)=aRb(z,j)*Ter(1,t2);
        eaRb(z,11)=aRb(z,11)*Quat(1,t3);
        eaRb(z,k) = aRb(z,k)*Big(1,t4);
        eaRb(z,r) = aRb(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(aRb,1)
        eaRc(z,i)=aRc(z,i)*Bin(1,t1);
        eaRc(z,j)=aRc(z,j)*Ter(1,t2);
        eaRc(z,11)=aRc(z,11)*Quat(1,t3);
        eaRc(z,k) = aRc(z,k)*Big(1,t4);
        eaRc(z,r) = aRc(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(aRb,1)
        eaRd(z,i)=aRd(z,i)*Bin(1,t1);
        eaRd(z,j)=aRd(z,j)*Ter(1,t2);
        eaRd(z,11)=aRd(z,11)*Quat(1,t3);
        eaRd(z,k) = aRd(z,k)*Big(1,t4);
        eaRd(z,r) = aRd(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(aRb,1)
        ebRa(z,i)=bRa(z,i)*Bin(1,t1);
        ebRa(z,j)=bRa(z,j)*Ter(1,t2);
        ebRa(z,11)=bRa(z,11)*Quat(1,t3);
        ebRa(z,k) = bRa(z,k)*Big(1,t4);
        ebRa(z,r) = bRa(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(aRb,1)
        ebRc(z,i)=bRc(z,i)*Bin(1,t1);
        ebRc(z,j)=bRc(z,j)*Ter(1,t2);
        ebRc(z,11)=bRc(z,11)*Quat(1,t3);
        ebRc(z,k) = bRc(z,k)*Big(1,t4);
        ebRc(z,r) = bRc(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(aRb,1)
        ebRd(z,i)=bRd(z,i)*Bin(1,t1);
        ebRd(z,j)=bRd(z,j)*Ter(1,t2);
        ebRd(z,11)=bRd(z,11)*Quat(1,t3);
        ebRd(z,k) = bRd(z,k)*Big(1,t4);
        ebRd(z,r) = bRd(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(aRb,1)
        ecRa(z,i)=cRa(z,i)*Bin(1,t1);
        ecRa(z,j)=cRa(z,j)*Ter(1,t2);
        ecRa(z,11)=cRa(z,11)*Quat(1,t3);
        ecRa(z,k) = cRa(z,k)*Big(1,t4);
        ecRa(z,r) = cRa(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(aRb,1)
        ecRb(z,i)=cRb(z,i)*Bin(1,t1);
        ecRb(z,j)=cRb(z,j)*Ter(1,t2);
        ecRb(z,11)=cRb(z,11)*Quat(1,t3);
        ecRb(z,k) = cRb(z,k)*Big(1,t4);
        ecRb(z,r) = cRb(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(aRb,1)
        ecRd(z,i)=cRd(z,i)*Bin(1,t1);
        ecRd(z,j)=cRd(z,j)*Ter(1,t2);
        ecRd(z,11)=cRd(z,11)*Quat(1,t3);
        ecRd(z,k) = cRd(z,k)*Big(1,t4);
        ecRd(z,r) = cRd(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
       for r=12:15
    for z=1:size(aRb,1)
        edRa(z,i)=dRa(z,i)*Bin(1,t1);
        edRa(z,j)=dRa(z,j)*Ter(1,t2);
        edRa(z,11)=dRa(z,11)*Quat(1,t3);
        edRa(z,k) = dRa(z,k)*Big(1,t4);
        edRa(z,r) = dRa(z,r)*AD(1,t5);
    end
       end
    end
    end
end
for i=1:6
        for j=7:10
        for k=16:25
        for r=12:15
           for z=1:size(aRb,1)
        edRb(z,i)=dRb(z,i)*Bin(1,t1);
        edRb(z,j)=dRb(z,j)*Ter(1,t2);
        edRb(z,11)=dRb(z,11)*Quat(1,t3);
        edRb(z,k) = dRb(z,k)*Big(1,t4);
        edRb(z,r) = dRb(z,r)*AD(1,t5);
           end
        end
        end
        end
end
for i=1:6
    for j=7:10
        for k=16:25
            for r=12:15
    for z=1:size(aRb,1)
        edRc(z,i)=dRc(z,i)*Bin(1,t1);
        edRc(z,j)=dRc(z,j)*Ter(1,t2);
        edRc(z,11)=dRc(z,11)*Quat(1,t3);
        edRc(z,k) = dRc(z,k)*Big(1,t4);
        edRc(z,r) = dRc(z,r)*AD(1,t5);
    end
           end
        end
    end
end



ChAC= sum(eaRc,2);
ChCA= sum(ecRa,2);
ChAB= sum(eaRb,2);
ChBA= sum(ebRa,2);
ChBC= sum(ebRc,2);
ChCB= sum(ecRb,2);
ChAD= sum(eaRd,2);
ChDA= sum(edRa,2);
ChDB= sum(edRb,2);
ChBD= sum(ebRd,2);
ChDC= sum(edRc,2);
ChCD= sum(ecRd,2);

%%%%%%%% Construct the modified CRP relation

ecountrev = zeros(size(S,2),size(S,2),N);
for z = 1:N
    ecountrev(1,2,z) = ChAB(z,1);
    ecountrev(1,3,z) = ChAC(z,1);
    ecountrev(1,4,z) = ChAD(z,1);
    ecountrev(2,3,z) = ChBC(z,1);
    ecountrev(2,4,z) = ChBD(z,1);
    ecountrev(3,4,z) = ChCD(z,1);
    ecountrev(2,1,z) = ChBA(z,1);
    ecountrev(3,1,z) = ChCA(z,1);
    ecountrev(3,2,z) = ChCB(z,1);
    ecountrev(4,1,z) = ChDA(z,1);
    ecountrev(4,2,z) = ChDB(z,1);
    ecountrev(4,3,z) = ChDC(z,1);
end

ecountrevsol = zeros(size(S,2),size(S,2),N);
for z=1:N
    for i = 1:size(S,2)
        for j = 1:size(S,2)
         if i~=j && ecountrev(i,j,z) > ecountrev(j,i,z)
                 ecountrevsol(i,j,z) = 1;
                 ecountrevsol(j,i,z) = 0;
         elseif i~=j && ecountrev(j,i,z) > ecountrev(i,j,z)
                 ecountrevsol(j,i,z) = 1;
                 ecountrevsol(i,j,z) = 0;
         elseif i~=j && ecountrev(j,i,z) == ecountrev(i,j,z)
                 ecountrevsol(i,j,z) = 1;
                 ecountrevsol(j,i,z) = 1; 
         elseif i==j
                 ecountrevsol(i,j,z) = 0;
         end
        end
    end
end
WCRP{count,1} = ecountrevsol;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


winner_WCRP=zeros(size(ecountrevsol,3),4);
for z=1:size(ecountrevsol,3)
    for i=1:4
       if sum(ecountrevsol(i,:,z))==3
           winner_WCRP(z,i)=1;
       else
           winner_WCRP(z,i)=0;
       end
    end
end

for z = 1:N
WCRP_Rank(z,1) = isequal(winner_WCRP(z,:),winner_Rank(z,:));
end
UI_WCRP{count,1} = WCRP_Rank;


WCRP_W = sum(WCRP_Rank);

Result(count,1) = WCRP_W;

max_WCRP_Rank = winner_WCRP - winner_Rank;
for z = 1:N
    Max_WCRP_Rank(z,1) = all(max_WCRP_Rank(z,:)>=0);
end

CaRd_Max_WCRP = sum(winner_WCRP,2);

for z=1:N
    if WCRP_Rank(z,1)==1 || Max_WCRP_Rank(z,1) == 0
        CaRd_Max_WCRP(z,1) = 0;
    end
end

CaRd_Max_WCRP(CaRd_Max_WCRP==0)=[];
CaRd_Max_WCRP = 1./CaRd_Max_WCRP;
Exp_WCRP(count,1) = sum(CaRd_Max_WCRP) + WCRP_W;

Result(count,2) = sum(Max_WCRP_Rank);

Weights(1,:,count) = [Bin(1,t1), Ter(1,t2), Quat(1,t3), Big(1,t4), AD(1,t5)];


l=zeros(size(S,2), size(S,2), N);
m=zeros(1,N);
Difference = ecountrevsol - Risk_Ranking;

for z=1:N
    l(:,:,z)=transpose(Difference(:,:,z)).*Difference(:,:,z);
end
l(l>0)=0;

for z=1:N
m(1,z) = (sum(sum(l(:,:,z)))*-1)/2;
end    
RA(count,1)=sum(m);
SymmDiff(count,1) = sum(sum(sum(abs(ecountrevsol - Risk_Ranking)))); 

for z=1:N
    if m(z)==0
        set_OW(z)=0;
        for j=1:24
            temp = ecountrevsol(:,:,z) - linear(:,:,j);
            if isempty(temp(temp<0))
            set_OW(z) = set_OW(z) + 1;
            else
            end
        end
    elseif m(z)>0
        set_OW(z)=0;
    end
end

exp_OW(count,1) = sum(1./set_OW(set_OW>0));

testOW = zeros(size(Risk_Ranking,3),1);
for i = 1:size(Risk_Ranking,3)
    testOW(i,1) = isequal(Risk_Ranking(:,:,i),WCRP{count,1}(:,:,i));
end

EntireId(count,1) = sum(testOW);

Ent_Exp(count,1) = sum(testOW) + sum(CaRd_Max_WCRP) + WCRP_W;

Exp_Exp(count,1) = exp_OW(count) + sum(CaRd_Max_WCRP) + WCRP_W;

end
count
end
end
end
end

EntExpResult = cat(2,Exp_WCRP,EntireId);

ExpRes = max(Exp_WCRP);
MinSymmDiff = min(SymmDiff);
Unique = max(Result(:,1));
EntExp = max(Ent_Exp);
RASD = 2*RA;
RASD = cat(2,RASD,SymmDiff);
RASD = sum(RASD,2);
MinRASD = min(RASD);
MaxExpExp = max(Exp_Exp);
MaxExp = max(Exp_Exp);

RA_Weights = Weights;
EntExp_Weights = Weights;
Unique_Weights = Weights;
Exp_Weights = Weights;
ExpExp_Weights = Weights;
Diff_Weights = Weights;
EntId_Weights = Weights;
MaxEntireId = max(EntireId);
ENTIRE_WCRP = WCRP;
ENTEXP_WCRP = WCRP;
RA_WCRP = WCRP;
ExpExp_WCRP = WCRP;

count=-1;
for z=1:size(Result,1)
    if Exp_Exp(z,1) ~= MaxExpExp
        count = count+1;
        r = z-count;
        ExpExp_WCRP{z,1}=[];
        ExpExp_Weights(:,:,r)=[];
    end
end

count=-1;
for z=1:size(Result,1)
    if RASD(z,1) ~= MinRASD
        count = count+1;
        r = z-count;
        RA_WCRP{z,1}=[];
        RA_Weights(:,:,r)=[];
    end
end
count=-1;
for z=1:size(Result,1)
    if Ent_Exp(z,1) ~= EntExp
        count = count+1;
        r = z-count;
        ENTEXP_WCRP{z,1}=[];
        EntExp_Weights(:,:,r)=[];
    end
end
count=-1;
for z=1:size(Result,1)
    if Result(z,1) ~= Unique
        count = count+1;
        r = z-count;
        Unique_Weights(:,:,r)=[];
    end
end
count=-1;
for z=1:size(Result,1)
    if Exp_WCRP(z,1) ~= ExpRes
        count = count+1;
        r = z-count;
        Exp_Weights(:,:,r)=[];
    end
end
count=-1;
for z=1:size(Result,1)
    if SymmDiff(z,1) ~= MinSymmDiff
        count = count+1;
        r = z-count;
        Diff_Weights(:,:,r)=[];
    end
end
count=-1;
for z=1:size(Result,1)
    if EntireId(z,1) ~= MaxEntireId
        count = count+1;
        r = z-count;
        ENTIRE_WCRP{z,1}=[];
        EntId_Weights(:,:,r)=[];
    end
end
count=-1;
for z=1:size(Result,1)
    if Exp_WCRP(z,1) ~= ExpRes
        count = count+1;
        r = z-count;
        WCRP{z,1}=[];
        UI_WCRP{z,1}=[];
    end
end

WCRP = WCRP(~cellfun('isempty',WCRP));
UI_WCRP = UI_WCRP(~cellfun('isempty',UI_WCRP));
ENTIRE_WCRP = ENTIRE_WCRP(~cellfun('isempty',ENTIRE_WCRP));
ExpExp_WCRP = ExpExp_WCRP(~cellfun('isempty',ExpExp_WCRP));

save('Identification\Optimal Weights\Optimal Weights Risk','Diff_Weights','ENTIRE_WCRP','ENTEXP_WCRP','EntExp','EntExp_Weights',...
    'EntId_Weights','Exp_Weights','MaxEntireId','MinRASD','MinSymmDiff','RA_Weights','Unique','Unique_Weights','WCRP','ExpRes');




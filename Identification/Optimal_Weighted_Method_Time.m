clear
clc

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Time Ranking.mat')
load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Revealed Pref ALL\Revealed Preference Time\Variables Time ALL.mat')

[~,~,~,~,~,linear,~,~] = binaryrelations(4);

N = 145;
Dom = 25;
S = {'x','y','z','w'};

%%%%%%%% Best elements collected preferences
winner_Rank=zeros(N,4);
for z=1:N
    for i=1:4
       if sum(Time_Ranking(i,:,z))==3
           winner_Rank(z,i)=1;
       else
           winner_Rank(z,i)=0;
       end
    end
end
%%%%%%%%%%%

%Bin = 0.9;
%Ter = 1;
%Quat = 0.4;
%AD = -0.2;
%Big = 0.8;
%count = 0;

Bin = 0.4:0.1:1;
Ter = 0.4:0.1:1;
Quat = 0:0.1:1;
AD = -0.4:0.1:0.5;
Big = 0.3:0.1:1;
count = 0;


%Bin = -0.4:0.1:1;
%Ter = -0.4:0.1:1;
%Quat = -0.4:0.1:1;
%AD = -0.4:0.1:1;
%Big = -0.4:0.1:1;
%count = 0;

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

exRy=zeros(N,Dom);
exRz=zeros(N,Dom);
exRw=zeros(N,Dom);
eyRz=zeros(N,Dom);
eyRw=zeros(N,Dom);
eyRx=zeros(N,Dom);
ezRx=zeros(N,Dom);
ezRy=zeros(N,Dom);
ezRw=zeros(N,Dom);
ewRx=zeros(N,Dom);
ewRy=zeros(N,Dom);
ewRz=zeros(N,Dom);
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(xRy,1)
        exRy(z,i)=xRy(z,i)*Bin(1,t1);
        exRy(z,j)=xRy(z,j)*Ter(1,t2);
        exRy(z,11)=xRy(z,11)*Quat(1,t3);
        exRy(z,k) = xRy(z,k)*Big(1,t4);
        exRy(z,r) = xRy(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(xRy,1)
        exRz(z,i)=xRz(z,i)*Bin(1,t1);
        exRz(z,j)=xRz(z,j)*Ter(1,t2);
        exRz(z,11)=xRz(z,11)*Quat(1,t3);
        exRz(z,k) = xRz(z,k)*Big(1,t4);
        exRz(z,r) = xRz(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(xRy,1)
        exRw(z,i)=xRw(z,i)*Bin(1,t1);
        exRw(z,j)=xRw(z,j)*Ter(1,t2);
        exRw(z,11)=xRw(z,11)*Quat(1,t3);
        exRw(z,k) = xRw(z,k)*Big(1,t4);
        exRw(z,r) = xRw(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(xRy,1)
        eyRx(z,i)=yRx(z,i)*Bin(1,t1);
        eyRx(z,j)=yRx(z,j)*Ter(1,t2);
        eyRx(z,11)=yRx(z,11)*Quat(1,t3);
        eyRx(z,k) = yRx(z,k)*Big(1,t4);
        eyRx(z,r) = yRx(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(xRy,1)
        eyRz(z,i)=yRz(z,i)*Bin(1,t1);
        eyRz(z,j)=yRz(z,j)*Ter(1,t2);
        eyRz(z,11)=yRz(z,11)*Quat(1,t3);
        eyRz(z,k) = yRz(z,k)*Big(1,t4);
        eyRz(z,r) = yRz(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(xRy,1)
        eyRw(z,i)=yRw(z,i)*Bin(1,t1);
        eyRw(z,j)=yRw(z,j)*Ter(1,t2);
        eyRw(z,11)=yRw(z,11)*Quat(1,t3);
        eyRw(z,k) = yRw(z,k)*Big(1,t4);
        eyRw(z,r) = yRw(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(xRy,1)
        ezRx(z,i)=zRx(z,i)*Bin(1,t1);
        ezRx(z,j)=zRx(z,j)*Ter(1,t2);
        ezRx(z,11)=zRx(z,11)*Quat(1,t3);
        ezRx(z,k) = zRx(z,k)*Big(1,t4);
        ezRx(z,r) = zRx(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(xRy,1)
        ezRy(z,i)=zRy(z,i)*Bin(1,t1);
        ezRy(z,j)=zRy(z,j)*Ter(1,t2);
        ezRy(z,11)=zRy(z,11)*Quat(1,t3);
        ezRy(z,k) = zRy(z,k)*Big(1,t4);
        ezRy(z,r) = zRy(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
        for r=12:15
    for z=1:size(xRy,1)
        ezRw(z,i)=zRw(z,i)*Bin(1,t1);
        ezRw(z,j)=zRw(z,j)*Ter(1,t2);
        ezRw(z,11)=zRw(z,11)*Quat(1,t3);
        ezRw(z,k) = zRw(z,k)*Big(1,t4);
        ezRw(z,r) = zRw(z,r)*AD(1,t5);
    end
        end
    end
    end
end
for i=1:6
    for j=7:10
    for k=16:25
       for r=12:15
    for z=1:size(xRy,1)
        ewRx(z,i)=wRx(z,i)*Bin(1,t1);
        ewRx(z,j)=wRx(z,j)*Ter(1,t2);
        ewRx(z,11)=wRx(z,11)*Quat(1,t3);
        ewRx(z,k) = wRx(z,k)*Big(1,t4);
        ewRx(z,r) = wRx(z,r)*AD(1,t5);
    end
       end
    end
    end
end
for i=1:6
        for j=7:10
        for k=16:25
        for r=12:15
           for z=1:size(xRy,1)
        ewRy(z,i)=wRy(z,i)*Bin(1,t1);
        ewRy(z,j)=wRy(z,j)*Ter(1,t2);
        ewRy(z,11)=wRy(z,11)*Quat(1,t3);
        ewRy(z,k) = wRy(z,k)*Big(1,t4);
        ewRy(z,r) = wRy(z,r)*AD(1,t5);
           end
        end
        end
        end
end
for i=1:6
    for j=7:10
        for k=16:25
            for r=12:15
    for z=1:size(xRy,1)
        ewRz(z,i)=wRz(z,i)*Bin(1,t1);
        ewRz(z,j)=wRz(z,j)*Ter(1,t2);
        ewRz(z,11)=wRz(z,11)*Quat(1,t3);
        ewRz(z,k) = wRz(z,k)*Big(1,t4);
        ewRz(z,r) = wRz(z,r)*AD(1,t5);
    end
           end
        end
    end
end



ChXZ= sum(exRz,2);
ChZX= sum(ezRx,2);
ChXY= sum(exRy,2);
ChYX= sum(eyRx,2);
ChYZ= sum(eyRz,2);
ChZY= sum(ezRy,2);
ChXW= sum(exRw,2);
ChWX= sum(ewRx,2);
ChWY= sum(ewRy,2);
ChYW= sum(eyRw,2);
ChWZ= sum(ewRz,2);
ChZW= sum(ezRw,2);

%%%%%%%% Construct the modified CRP relation

ecountrev = zeros(size(S,2),size(S,2),N);
for z = 1:N
    ecountrev(1,2,z) = ChXY(z,1);
    ecountrev(1,3,z) = ChXZ(z,1);
    ecountrev(1,4,z) = ChXW(z,1);
    ecountrev(2,3,z) = ChYZ(z,1);
    ecountrev(2,4,z) = ChYW(z,1);
    ecountrev(3,4,z) = ChZW(z,1);
    ecountrev(2,1,z) = ChYX(z,1);
    ecountrev(3,1,z) = ChZX(z,1);
    ecountrev(3,2,z) = ChZY(z,1);
    ecountrev(4,1,z) = ChWX(z,1);
    ecountrev(4,2,z) = ChWY(z,1);
    ecountrev(4,3,z) = ChWZ(z,1);
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

CxRw_Max_WCRP = sum(winner_WCRP,2);

for z=1:N
    if WCRP_Rank(z,1)==1 || Max_WCRP_Rank(z,1) == 0
        CxRw_Max_WCRP(z,1) = 0;
    end
end

CxRw_Max_WCRP(CxRw_Max_WCRP==0)=[];
CxRw_Max_WCRP = 1./CxRw_Max_WCRP;
Exp_WCRP(count,1) = sum(CxRw_Max_WCRP) + WCRP_W;

Result(count,2) = sum(Max_WCRP_Rank);

Weights(1,:,count) = [Bin(1,t1), Ter(1,t2), Quat(1,t3), Big(1,t4), AD(1,t5)];


l=zeros(size(S,2), size(S,2), N);
m=zeros(1,N);
Difference = ecountrevsol - Time_Ranking;

for z=1:N
    l(:,:,z)=transpose(Difference(:,:,z)).*Difference(:,:,z);
end
l(l>0)=0;

for z=1:N
m(1,z) = (sum(sum(l(:,:,z)))*-1)/2;
end    
RA(count,1)=sum(m);
SymmDiff(count,1) = sum(sum(sum(abs(ecountrevsol - Time_Ranking)))); 

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

testOW = zeros(size(Time_Ranking,3),1);
for i = 1:size(Time_Ranking,3)
    testOW(i,1) = isequal(Time_Ranking(:,:,i),WCRP{count,1}(:,:,i));
end

EntireId(count,1) = sum(testOW);

Ent_Exp(count,1) = sum(testOW) + sum(CxRw_Max_WCRP) + WCRP_W;

Exp_Exp(count,1) = exp_OW(count) + sum(CxRw_Max_WCRP) + WCRP_W;

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
MaxExp = max(exp_OW);


RA_Weights = Weights;
EntExp_Weights = Weights;
Unique_Weights = Weights;
Exp_Weights = Weights;
Diff_Weights = Weights;
EntId_Weights = Weights;
MaxEntireId = max(EntireId);
ENTIRE_WCRP = WCRP;
ENTEXP_WCRP = WCRP;
RA_WCRP = WCRP;
ExpExp_Weights = Weights;
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
        ExpExp_Weights(:,:,r)=[];
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

save('C:\Users\tew394\Dropbox\JOB MARKET PAPER\Codes\Identification\Optimal Weights\Optimal Weights Time','Diff_Weights','ENTIRE_WCRP','ENTEXP_WCRP','EntExp','EntExp_Weights',...
    'EntId_Weights','Exp_Weights','MaxEntireId','MinRASD','MinSymmDiff','RA_Weights','Unique','Unique_Weights','WCRP','ExpRes');




IdentificationTimeAllRisk
[~,~,~,~,~,linear,~,~] = binaryrelations(4);

classTRUE=zeros(N,1);
classBR=zeros(N,1);
classCRP=zeros(N,1);
classCC=zeros(N,1);
classMS=zeros(N,1);
classEIG=zeros(N,1);
classTC=zeros(N,1);

for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),Risk_Ranking(:,:,i))
        classTRUE(i,1)=j;
    end
    end
end

for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),BernRangLotteries(:,:,i))
        classBR(i,1)=j;
    end
    end
end
for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),countrevsolLotteries(:,:,i))
        classCRP(i,1)=j;
    end
    end
end
for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),countsolLotteries(:,:,i))
        classCC(i,1)=j;
    end
    end
end
for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),minswapssolLotteries(:,:,i))
        classMS(i,1)=j;
    end
    end
end
for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),eigensolLotteries(:,:,i))
        classEIG(i,1)=j;
    end
    end
end
for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),trcoreLotteries(:,:,i))
        classTC(i,1)=j;
    end
    end
end


%% create the same test but for expected identification

for i=1:145
    wTRUE(i,1) = find(winner_Rank(i,:)==1);
end


wCC = sum(winner_CC,2);
wCRP = sum(winner_CRP,2);
wMS = sum(winner_MS,2);
wEIG = sum(winner_EIG,2);
wBR = sum(winner_BR,2);
wTC = sum(winner_TC,2);

%% test for accuracy and set-identification - McNemar


for i=1:145
    if wBR(i,1)==1
    wwBR(i,1) = find(winner_BR(i,:)==1);
    else
    wwBR(i,1)=0;
    end
end
for i=1:145
    if wCRP(i,1)==1
    wwCRP(i,1) = find(winner_CRP(i,:)==1);
    else
    wwCRP(i,1)=0;
    end
end
for i=1:145
    if wCC(i,1)==1
    wwCC(i,1) = find(winner_CC(i,:)==1);
    else
    wwCC(i,1)=0;
    end
end
for i=1:145
    if wEIG(i,1)==1
    wwEIG(i,1) = find(winner_EIG(i,:)==1);
    else
    wwEIG(i,1)=0;
    end
end
for i=1:145
    if wMS(i,1)==1
    wwMS(i,1) = find(winner_MS(i,:)==1);
    else
    wwMS(i,1)=0;
    end
end
for i=1:145
    if wTC(i,1)==1
    wwTC(i,1) = find(winner_TC(i,:)==1);
    else
    wwTC(i,1)=0;
    end
end

%[acrp, bcrp,ccrp, dcrp] = testcholdout(wwCRP,wwBR,wTRUE)

%[acrp, bcrp,ccrp, dcrp] = testcholdout(classCRP,classBR,classTRUE)

for i=1:145
    if Max_BR_Rank(i,1)==1
    mBR(i,1) = wTRUE(i,1);
    else
    mBR(i,1)=0;
    end
end
for i=1:145
    if Max_CRP_Rank(i,1)==1
    mCRP(i,1) = wTRUE(i,1);
    else
    mCRP(i,1)=0;
    end
end
for i=1:145
    if Max_CC_Rank(i,1)==1
    mCC(i,1) = wTRUE(i,1);
    else
    mCC(i,1)=0;
    end
end
for i=1:145
    if Max_TC_Rank(i,1)==1
    mTC(i,1) = wTRUE(i,1);
    else
    mTC(i,1)=0;
    end
end
for i=1:145
    if Max_MS_Rank(i,1)==1
    mMS(i,1) = wTRUE(i,1);
    else
    mMS(i,1)=0;
    end
end
for i=1:145
    if Max_EIG_Rank(i,1)==1
    mEIG(i,1) = wTRUE(i,1);
    else
    mEIG(i,1)=0;
    end
end



%[acrp, bcrp,ccrp, dcrp] = testcholdout(mCRP,mBR,wTRUE)



for i=1:145
    if set_BR(1,i)>0
    mmBR(i,1) = classTRUE(i,1);
    else
    mmBR(i,1)=0;
    end
end
for i=1:145
    if set_CRP(1,i)>0
    mmCRP(i,1) = classTRUE(i,1);
    else
    mmCRP(i,1)=0;
    end
end
for i=1:145
    if set_MS(1,i)>0
    mmMS(i,1) = classTRUE(i,1);
    else
    mmMS(i,1)=0;
    end
end
for i=1:145
    if set_TC(1,i)>0
    mmTC(i,1) = classTRUE(i,1);
    else
    mmTC(i,1)=0;
    end
end
for i=1:145
    if set_CC(1,i)>0
    mmCC(i,1) = classTRUE(i,1);
    else
    mmCC(i,1)=0;
    end
end
for i=1:145
    if set_EIG(1,i)>0
    mmEIG(i,1) = classTRUE(i,1);
    else
    mmEIG(i,1)=0;
    end
end

%[acrp, bcrp,ccrp, dcrp] = testcholdout(mmCRP,mmBR,classTRUE)


%% Bootstrap UI

for m=1:100000
    y = randi(145,145,1);
    temp_classCRP = classCRP(y);
    temp_classMS = classMS(y);
    temp_classTC = classTC(y);
    temp_classEIG = classEIG(y);
    temp_classCC = classCC(y);
    temp_classBR = classBR(y);
    temp_classTRUE = classTRUE(y);
[suCRP(m),pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(temp_classCRP,temp_classBR,temp_classTRUE);
[suCC(m),pCC(m),e1CC(m),e2(m)]=testcholdout(temp_classCC,temp_classBR,temp_classTRUE);
[suTC(m),pTC(m),e1TC(m),e2(m)]=testcholdout(temp_classTC,temp_classBR,temp_classTRUE);
[suEIG(m),pEIG(m),e1EIG(m),e2(m)]=testcholdout(temp_classEIG,temp_classBR,temp_classTRUE);
[suMS(m),pMS(m),e1MS(m),e2(m)]=testcholdout(temp_classMS,temp_classBR,temp_classTRUE);
end

STerrorUI_WRI_all = [std((1-e1CRP)), std((1-e1MS)), std((1-e1TC)), std((1-e1EIG)), std((1-e1CC)), std((1-e2BR))];

idDiffCRP = - e1CRP' + e2BR';
idDiffCC = - e1CC' + e2BR';
idDiffTC = - e1TC' + e2BR';
idDiffEIG = - e1EIG' + e2BR';
idDiffMS = - e1MS' + e2BR';

tCRPBR_UI_WRI_5perc = prctile(idDiffCRP,5)
tCRPBR_UI_WRI_1perc = prctile(idDiffCRP,1)

idDiffCRPCC = e1CC' - e1CRP';
idDiffCRPEIG = e1EIG' - e1CRP';

tCRPCC_UI_WRI_5perc = prctile(idDiffCRPCC,5)

tCRPEIG_UI_WRI_5perc = prctile(idDiffCRPEIG,5)


for m=1:100000
    y = randi(145,145,1);
    temp_wwCRP = wwCRP(y);
    temp_wwMS = wwMS(y);
    temp_wwTC = wwTC(y);
    temp_wwEIG = wwEIG(y);
    temp_wwCC = wwCC(y);
    temp_wwBR = wwBR(y);
    temp_wwTRUE = wTRUE(y);
[suCRP(m),pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(temp_wwCRP,temp_wwBR,temp_wwTRUE);
[suCC(m),pCC(m),e1CC(m),e2(m)]=testcholdout(temp_wwCC,temp_wwBR,temp_wwTRUE);
[suTC(m),pTC(m),e1TC(m),e2(m)]=testcholdout(temp_wwTC,temp_wwBR,temp_wwTRUE);
[suEIG(m),pEIG(m),e1EIG(m),e2(m)]=testcholdout(temp_wwEIG,temp_wwBR,temp_wwTRUE);
[suMS(m),pMS(m),e1MS(m),e2(m)]=testcholdout(temp_wwMS,temp_wwBR,temp_wwTRUE);
end

STerrorUI_UI_all = [std((1-e1CRP)), std((1-e1MS)), std((1-e1TC)), std((1-e1EIG)), std((1-e1CC)), std((1-e2BR))];

idDiffCRP = - e1CRP' + e2BR';
idDiffCC = - e1CC' + e2BR';
idDiffTC = - e1TC' + e2BR';
idDiffEIG = - e1EIG' + e2BR';
idDiffMS = - e1MS' + e2BR';

tCRPBR_UI_UI_5perc = prctile(idDiffCRP,5)
tCRPBR_UI_UI_1perc = prctile(idDiffCRP,1)

idDiffCRPCC = e1CC' - e1CRP';
idDiffCRPEIG = e1EIG' - e1CRP';

tCRPCC_UI_UI_5perc = prctile(idDiffCRPCC,5)

tCRPEIG_UI_UI_5perc = prctile(idDiffCRPEIG,5)





for m=1:100000
    y = randi(145,145,1);
    temp_mmCRP = mmCRP(y);
    temp_mmMS = mmMS(y);
    temp_mmTC = mmTC(y);
    temp_mmEIG = mmEIG(y);
    temp_mmCC = mmCC(y);
    temp_mmBR = mmBR(y);
    temp_mmTRUE = classTRUE(y);
[suCRP(m),pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(temp_mmCRP,temp_mmBR,temp_mmTRUE);
[suCC(m),pCC(m),e1CC(m),e2(m)]=testcholdout(temp_mmCC,temp_mmBR,temp_mmTRUE);
[suTC(m),pTC(m),e1TC(m),e2(m)]=testcholdout(temp_mmTC,temp_mmBR,temp_mmTRUE);
[suEIG(m),pEIG(m),e1EIG(m),e2(m)]=testcholdout(temp_mmEIG,temp_mmBR,temp_mmTRUE);
[suMS(m),pMS(m),e1MS(m),e2(m)]=testcholdout(temp_mmMS,temp_mmBR,temp_mmTRUE);
end

STerrorSet_WRI_all = [std((1-e1CRP)), std((1-e1MS)), std((1-e1TC)), std((1-e1EIG)), std((1-e1CC)), std((1-e2BR))];

idDiffCRP = - e1CRP' + e2BR';
idDiffCC = - e1CC' + e2BR';
idDiffTC = - e1TC' + e2BR';
idDiffEIG = - e1EIG' + e2BR';
idDiffMS = - e1MS' + e2BR';

tCRPBR_Set_WRI_5perc = prctile(idDiffCRP,5)
tCRPBR_Set_WRI_1perc = prctile(idDiffCRP,1)

idDiffCRPCC = e1CC' - e1CRP';
idDiffCRPEIG = e1EIG' - e1CRP';

tCRPCC_Set_WRI_5perc = prctile(idDiffCRPCC,5)

tCRPEIG_Set_WRI_5perc = prctile(idDiffCRPEIG,5)





for m=1:100000
    y = randi(145,145,1);
    temp_mCRP = mCRP(y);
    temp_mMS = mMS(y);
    temp_mTC = mTC(y);
    temp_mEIG = mEIG(y);
    temp_mCC = mCC(y);
    temp_mBR = mBR(y);
    temp_mTRUE = wTRUE(y);
[suCRP(m),pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(temp_mCRP,temp_mBR,temp_mTRUE);
[suCC(m),pCC(m),e1CC(m),e2(m)]=testcholdout(temp_mCC,temp_mBR,temp_mTRUE);
[suTC(m),pTC(m),e1TC(m),e2(m)]=testcholdout(temp_mTC,temp_mBR,temp_mTRUE);
[suEIG(m),pEIG(m),e1EIG(m),e2(m)]=testcholdout(temp_mEIG,temp_mBR,temp_mTRUE);
[suMS(m),pMS(m),e1MS(m),e2(m)]=testcholdout(temp_mMS,temp_mBR,temp_mTRUE);
end

STerrorSet_UI_all = [std((1-e1CRP)), std((1-e1MS)), std((1-e1TC)), std((1-e1EIG)), std((1-e1CC)), std((1-e2BR))];

idDiffCRP = - e1CRP' + e2BR';
idDiffCC = - e1CC' + e2BR';
idDiffTC = - e1TC' + e2BR';
idDiffEIG = - e1EIG' + e2BR';
idDiffMS = - e1MS' + e2BR';

tCRPBR_Set_UI_5perc = prctile(idDiffCRP,5)
tCRPBR_Set_UI_1perc = prctile(idDiffCRP,1)


idDiffCRPCC = e1CC' - e1CRP';
idDiffCRPEIG = e1EIG' - e1CRP';

tCRPCC_Set_UI_5perc = prctile(idDiffCRPCC,5)

tCRPEIG_Set_UI_5perc = prctile(idDiffCRPEIG,5)



%% simulate standard errors and plot



for m=1:100000
    y = randi(145,145,1);
    temp_set_CRP = set_CRP(y);
    temp_set_TC = set_TC(y);
    temp_set_MS = set_MS(y);
    temp_set_EIG = set_EIG(y);
    temp_set_CC = set_CC(y);
    temp_set_BR = set_BR(y);
    temp_classTRUE = classTRUE(y);
    for i=1:N
        x = rand;
        if temp_set_CRP(1,i)>0 && x<1/temp_set_CRP(1,i)
            tempCRP(i,1) = temp_classTRUE(i,1);
        else
            tempCRP(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_set_CC(1,i)>0 && x<1/temp_set_CC(1,i)
            tempCC(i,1) = temp_classTRUE(i,1);
        else
            tempCC(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_set_TC(1,i)>0 && x<1/temp_set_TC(1,i)
            tempTC(i,1) = temp_classTRUE(i,1);
        else
            tempTC(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_set_EIG(1,i)>0 && x<1/temp_set_EIG(1,i)
            tempEIG(i,1) = temp_classTRUE(i,1);
        else
            tempEIG(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_set_MS(1,i)>0 && x<1/temp_set_MS(1,i)
            tempMS(i,1) = temp_classTRUE(i,1);
        else
            tempMS(i,1) = 0;
        end
    end    
    for i=1:N
        x = rand;
        if temp_set_BR(1,i)>0 && x<1/temp_set_BR(1,i)
            tempBR(i,1) = temp_classTRUE(i,1);
        else
            tempBR(i,1) = 0;
        end
    end
[suCRP(m),pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(tempCRP,tempBR,temp_classTRUE);
[suCC(m),pCC(m),e1CC(m),e2(m)]=testcholdout(tempCC,tempBR,temp_classTRUE);
[suTC(m),pTC(m),e1TC(m),e2(m)]=testcholdout(tempTC,tempBR,temp_classTRUE);
[suEIG(m),pEIG(m),e1EIG(m),e2(m)]=testcholdout(tempEIG,tempBR,temp_classTRUE);
[suMS(m),pMS(m),e1MS(m),e2(m)]=testcholdout(tempMS,tempBR,temp_classTRUE);
end


FalsePositivesWRI_all = [e1CRP', e1MS', e1TC', e1EIG', e1CC', e2BR'];
FalsePositivesWRI_all = mean(FalsePositivesWRI_all);
STerrorWRI_all = [std(e1CRP), std(e1MS), std(e1TC), std(e1EIG), std(e1CC), std(e2BR)];

idDiffCRP = - e1CRP' + e2BR';
idDiffCC = - e1CC' + e2BR';
idDiffTC = - e1TC' + e2BR';
idDiffEIG = - e1EIG' + e2BR';
idDiffMS = - e1MS' + e2BR';

tCRPBR_EI_WRI_5perc = prctile(idDiffCRP,5)
tCRPBR_EI_WRI_1perc = prctile(idDiffCRP,1)

idDiffCRPCC = e1CC' - e1CRP';
idDiffCRPEIG = e1EIG' - e1CRP';

tCRPCC_EI_WRI_5perc = prctile(idDiffCRPCC,5)

tCRPEIG_EI_WRI_5perc = prctile(idDiffCRPEIG,5)


for m=1:100000
    y = randi(145,145,1);
    temp_Max_CRP_Rank = Max_CRP_Rank(y);
    temp_Max_MS_Rank = Max_MS_Rank(y);
    temp_Max_TC_Rank = Max_TC_Rank(y);
    temp_Max_EIG_Rank = Max_EIG_Rank(y);
    temp_Max_CC_Rank = Max_CC_Rank(y);
    temp_Max_BR_Rank = Max_BR_Rank(y);
    temp_wCRP = wCRP(y);
    temp_wMS = wMS(y);
    temp_wTC = wTC(y);
    temp_wEIG = wEIG(y);
    temp_wCC = wCC(y); 
    temp_wBR = wBR(y);
    temp_wTRUE = wTRUE(y);
    for i=1:N
        x = rand;
        if temp_Max_CRP_Rank(i,1)==1 && x<1/temp_wCRP(i,1)
            tempCRP(i,1) = temp_wTRUE(i,1);
        else
            tempCRP(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_Max_CC_Rank(i,1)==1 && x<1/temp_wCC(i,1)
            tempCC(i,1) = temp_wTRUE(i,1);
        else
            tempCC(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_Max_TC_Rank(i,1)==1 && x<1/temp_wTC(i,1)
            tempTC(i,1) = temp_wTRUE(i,1);
        else
            tempTC(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_Max_EIG_Rank(i,1)==1 && x<1/temp_wEIG(i,1)
            tempEIG(i,1) = temp_wTRUE(i,1);
        else
            tempEIG(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_Max_MS_Rank(i,1)==1 && x<1/temp_wMS(i,1)
            tempMS(i,1) = temp_wTRUE(i,1);
        else
            tempMS(i,1) = 0;
        end
    end    
    for i=1:N
        x = rand;
        if temp_Max_BR_Rank(i,1)==1 && x<1/temp_wBR(i,1)
            tempBR(i,1) = temp_wTRUE(i,1);
        else
            tempBR(i,1) = 0;
        end
    end
[~,pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(tempCRP,tempBR,temp_wTRUE);
[~,pCC(m),e1CC(m),e2(m)]=testcholdout(tempCC,tempBR,temp_wTRUE);
[~,pTC(m),e1TC(m),e2(m)]=testcholdout(tempTC,tempBR,temp_wTRUE);
[~,pEIG(m),e1EIG(m),e2(m)]=testcholdout(tempEIG,tempBR,temp_wTRUE);
[~,pMS(m),e1MS(m),e2(m)]=testcholdout(tempMS,tempBR,temp_wTRUE);
end


idDiffCRP = - e1CRP' + e2BR';
idDiffCC = - e1CC' + e2BR';
idDiffTC = - e1TC' + e2BR';
idDiffEIG = - e1EIG' + e2BR';
idDiffMS = - e1MS' + e2BR';

tCRPBR_EI_UI_5perc = prctile(idDiffCRP,5)
tCRPBR_EI_UI_1perc = prctile(idDiffCRP,1)

idDiffCRPCC = e1CC' - e1CRP';
idDiffCRPEIG = e1EIG' - e1CRP';

tCRPCC_EI_UI_5perc = prctile(idDiffCRPCC,5)

tCRPEIG_EI_UI_5perc = prctile(idDiffCRPEIG,5)


FalsePositivesEI_all = [e1CRP', e1MS', e1TC', e1EIG', e1CC', e2BR'];
FalsePositivesEI_all = mean(FalsePositivesEI_all);
STerrorEI_all = [std(e1CRP), std(e1MS), std(e1TC), std(e1EIG), std(e1CC), std(e2BR)];

UI_CRP_all = UI_CRP;
UI_MS_all = UI_MS;
UI_TC_all = UI_TC;
UI_EIG_all = UI_EIG;
UI_CC_all = UI_CC;
UI_BR_all = UI_BR;

WRI_CRP_all = WRI_CRP;
WRI_MS_all = WRI_MS;
WRI_TC_all = WRI_TC;
WRI_EIG_all = WRI_EIG;
WRI_CC_all = WRI_CC;
WRI_BR_all = WRI_BR;

setId_CRP_all = SetId_CRP;
setId_MS_all = SetId_MS;
setId_TC_all = SetId_TC;
setId_EIG_all = SetId_EIG;
setId_CC_all = SetId_CC;
setId_BR_all = SetId_BR;

setWRI_CRP_all = setWRI_CRP;
setWRI_MS_all = setWRI_MS;
setWRI_TC_all = setWRI_TC;
setWRI_EIG_all = setWRI_EIG;
setWRI_CC_all = setWRI_CC;
setWRI_BR_all = setWRI_BR;


save ID_all_Risk STerrorSet_UI_all STerrorSet_WRI_all STerrorUI_UI_all STerrorUI_WRI_all FalsePositivesEI_all STerrorEI_all FalsePositivesWRI_all STerrorWRI_all UI_CRP_all UI_MS_all UI_TC_all UI_EIG_all UI_CC_all UI_BR_all WRI_CRP_all WRI_MS_all WRI_TC_all WRI_EIG_all WRI_CC_all WRI_BR_all setId_CRP_all setId_MS_all setId_TC_all setId_EIG_all setId_CC_all setId_BR_all setWRI_CRP_all setWRI_MS_all setWRI_TC_all setWRI_EIG_all setWRI_CC_all setWRI_BR_all                             

%% MAIN

IdentificationTimeMainRisk
[~,~,~,~,~,linear,~,~] = binaryrelations(4);

load ID_all_Risk


classTRUE=zeros(N,1);
classBR=zeros(N,1);
classCRP=zeros(N,1);
classCC=zeros(N,1);
classMS=zeros(N,1);
classEIG=zeros(N,1);
classTC=zeros(N,1);

for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),Risk_Ranking(:,:,i))
        classTRUE(i,1)=j;
    end
    end
end

for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),BernRangLotteries(:,:,i))
        classBR(i,1)=j;
    end
    end
end
for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),countrevsolLotteries(:,:,i))
        classCRP(i,1)=j;
    end
    end
end
for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),countsolLotteries(:,:,i))
        classCC(i,1)=j;
    end
    end
end
for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),minswapssolLotteries(:,:,i))
        classMS(i,1)=j;
    end
    end
end
for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),eigensolLotteries(:,:,i))
        classEIG(i,1)=j;
    end
    end
end
for i = 1:size(Risk_Ranking,3)
    for j=1:24
    if isequal(linear(:,:,j),trcoreLotteries(:,:,i))
        classTC(i,1)=j;
    end
    end
end


%% create the same test but for expected identification

for i=1:145
    wTRUE(i,1) = find(winner_Rank(i,:)==1);
end

wCC = sum(winner_CC,2);
wCRP = sum(winner_CRP,2);
wMS = sum(winner_MS,2);
wEIG = sum(winner_EIG,2);
wBR = sum(winner_BR,2);
wTC = sum(winner_TC,2);



for i=1:145
    if wBR(i,1)==1
    wwBR(i,1) = find(winner_BR(i,:)==1);
    else
    wwBR(i,1)=0;
    end
end
for i=1:145
    if wCRP(i,1)==1
    wwCRP(i,1) = find(winner_CRP(i,:)==1);
    else
    wwCRP(i,1)=0;
    end
end
for i=1:145
    if wCC(i,1)==1
    wwCC(i,1) = find(winner_CC(i,:)==1);
    else
    wwCC(i,1)=0;
    end
end
for i=1:145
    if wEIG(i,1)==1
    wwEIG(i,1) = find(winner_EIG(i,:)==1);
    else
    wwEIG(i,1)=0;
    end
end
for i=1:145
    if wMS(i,1)==1
    wwMS(i,1) = find(winner_MS(i,:)==1);
    else
    wwMS(i,1)=0;
    end
end
for i=1:145
    if wTC(i,1)==1
    wwTC(i,1) = find(winner_TC(i,:)==1);
    else
    wwTC(i,1)=0;
    end
end

%[acrp, bcrp,ccrp, dcrp] = testcholdout(wwCRP,wwBR,wTRUE)

%[acrp, bcrp,ccrp, dcrp] = testcholdout(classCRP,classBR,classTRUE)

for i=1:145
    if Max_BR_Rank(i,1)==1
    mBR(i,1) = wTRUE(i,1);
    else
    mBR(i,1)=0;
    end
end
for i=1:145
    if Max_CRP_Rank(i,1)==1
    mCRP(i,1) = wTRUE(i,1);
    else
    mCRP(i,1)=0;
    end
end
for i=1:145
    if Max_CC_Rank(i,1)==1
    mCC(i,1) = wTRUE(i,1);
    else
    mCC(i,1)=0;
    end
end
for i=1:145
    if Max_TC_Rank(i,1)==1
    mTC(i,1) = wTRUE(i,1);
    else
    mTC(i,1)=0;
    end
end
for i=1:145
    if Max_MS_Rank(i,1)==1
    mMS(i,1) = wTRUE(i,1);
    else
    mMS(i,1)=0;
    end
end
for i=1:145
    if Max_EIG_Rank(i,1)==1
    mEIG(i,1) = wTRUE(i,1);
    else
    mEIG(i,1)=0;
    end
end



%[acrp, bcrp,ccrp, dcrp] = testcholdout(mCRP,mBR,wTRUE)



for i=1:145
    if set_BR(1,i)>0
    mmBR(i,1) = classTRUE(i,1);
    else
    mmBR(i,1)=0;
    end
end
for i=1:145
    if set_CRP(1,i)>0
    mmCRP(i,1) = classTRUE(i,1);
    else
    mmCRP(i,1)=0;
    end
end
for i=1:145
    if set_MS(1,i)>0
    mmMS(i,1) = classTRUE(i,1);
    else
    mmMS(i,1)=0;
    end
end
for i=1:145
    if set_TC(1,i)>0
    mmTC(i,1) = classTRUE(i,1);
    else
    mmTC(i,1)=0;
    end
end
for i=1:145
    if set_CC(1,i)>0
    mmCC(i,1) = classTRUE(i,1);
    else
    mmCC(i,1)=0;
    end
end
for i=1:145
    if set_EIG(1,i)>0
    mmEIG(i,1) = classTRUE(i,1);
    else
    mmEIG(i,1)=0;
    end
end

%% Bootstrap UI

for m=1:100000
    y = randi(145,145,1);
    temp_classCRP = classCRP(y);
    temp_classMS = classMS(y);
    temp_classTC = classTC(y);
    temp_classEIG = classEIG(y);
    temp_classCC = classCC(y);
    temp_classBR = classBR(y);
    temp_classTRUE = classTRUE(y);
[suCRP(m),pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(temp_classCRP,temp_classBR,temp_classTRUE);
[suCC(m),pCC(m),e1CC(m),e2(m)]=testcholdout(temp_classCC,temp_classBR,temp_classTRUE);
[suTC(m),pTC(m),e1TC(m),e2(m)]=testcholdout(temp_classTC,temp_classBR,temp_classTRUE);
[suEIG(m),pEIG(m),e1EIG(m),e2(m)]=testcholdout(temp_classEIG,temp_classBR,temp_classTRUE);
[suMS(m),pMS(m),e1MS(m),e2(m)]=testcholdout(temp_classMS,temp_classBR,temp_classTRUE);
end

STerrorUI_WRI_main = [std((1-e1CRP)), std((1-e1MS)), std((1-e1TC)), std((1-e1EIG)), std((1-e1CC)), std((1-e2BR))];

for m=1:100000
    y = randi(145,145,1);
    temp_wwCRP = wwCRP(y);
    temp_wwMS = wwMS(y);
    temp_wwTC = wwTC(y);
    temp_wwEIG = wwEIG(y);
    temp_wwCC = wwCC(y);
    temp_wwBR = wwBR(y);
    temp_wwTRUE = wTRUE(y);
[suCRP(m),pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(temp_wwCRP,temp_wwBR,temp_wwTRUE);
[suCC(m),pCC(m),e1CC(m),e2(m)]=testcholdout(temp_wwCC,temp_wwBR,temp_wwTRUE);
[suTC(m),pTC(m),e1TC(m),e2(m)]=testcholdout(temp_wwTC,temp_wwBR,temp_wwTRUE);
[suEIG(m),pEIG(m),e1EIG(m),e2(m)]=testcholdout(temp_wwEIG,temp_wwBR,temp_wwTRUE);
[suMS(m),pMS(m),e1MS(m),e2(m)]=testcholdout(temp_wwMS,temp_wwBR,temp_wwTRUE);
end

STerrorUI_UI_main = [std((1-e1CRP)), std((1-e1MS)), std((1-e1TC)), std((1-e1EIG)), std((1-e1CC)), std((1-e2BR))];


for m=1:100000
    y = randi(145,145,1);
    temp_mmCRP = mmCRP(y);
    temp_mmMS = mmMS(y);
    temp_mmTC = mmTC(y);
    temp_mmEIG = mmEIG(y);
    temp_mmCC = mmCC(y);
    temp_mmBR = mmBR(y);
    temp_mmTRUE = classTRUE(y);
[suCRP(m),pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(temp_mmCRP,temp_mmBR,temp_mmTRUE);
[suCC(m),pCC(m),e1CC(m),e2(m)]=testcholdout(temp_mmCC,temp_mmBR,temp_mmTRUE);
[suTC(m),pTC(m),e1TC(m),e2(m)]=testcholdout(temp_mmTC,temp_mmBR,temp_mmTRUE);
[suEIG(m),pEIG(m),e1EIG(m),e2(m)]=testcholdout(temp_mmEIG,temp_mmBR,temp_mmTRUE);
[suMS(m),pMS(m),e1MS(m),e2(m)]=testcholdout(temp_mmMS,temp_mmBR,temp_mmTRUE);
end

STerrorSet_WRI_main = [std((1-e1CRP)), std((1-e1MS)), std((1-e1TC)), std((1-e1EIG)), std((1-e1CC)), std((1-e2BR))];

for m=1:100000
    y = randi(145,145,1);
    temp_mCRP = mCRP(y);
    temp_mMS = mMS(y);
    temp_mTC = mTC(y);
    temp_mEIG = mEIG(y);
    temp_mCC = mCC(y);
    temp_mBR = mBR(y);
    temp_mTRUE = wTRUE(y);
[suCRP(m),pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(temp_mCRP,temp_mBR,temp_mTRUE);
[suCC(m),pCC(m),e1CC(m),e2(m)]=testcholdout(temp_mCC,temp_mBR,temp_mTRUE);
[suTC(m),pTC(m),e1TC(m),e2(m)]=testcholdout(temp_mTC,temp_mBR,temp_mTRUE);
[suEIG(m),pEIG(m),e1EIG(m),e2(m)]=testcholdout(temp_mEIG,temp_mBR,temp_mTRUE);
[suMS(m),pMS(m),e1MS(m),e2(m)]=testcholdout(temp_mMS,temp_mBR,temp_mTRUE);
end

STerrorSet_UI_main = [std((1-e1CRP)), std((1-e1MS)), std((1-e1TC)), std((1-e1EIG)), std((1-e1CC)), std((1-e2BR))];


%% simulate standard errors and plot

for m=1:100000
    y = randi(145,145,1);
    temp_set_CRP = set_CRP(y);
    temp_set_TC = set_TC(y);
    temp_set_MS = set_MS(y);
    temp_set_EIG = set_EIG(y);
    temp_set_CC = set_CC(y);
    temp_set_BR = set_BR(y);
    temp_classTRUE = classTRUE(y);
    for i=1:N
        x = rand;
        if temp_set_CRP(1,i)>0 && x<1/temp_set_CRP(1,i)
            tempCRP(i,1) = temp_classTRUE(i,1);
        else
            tempCRP(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_set_CC(1,i)>0 && x<1/temp_set_CC(1,i)
            tempCC(i,1) = temp_classTRUE(i,1);
        else
            tempCC(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_set_TC(1,i)>0 && x<1/temp_set_TC(1,i)
            tempTC(i,1) = temp_classTRUE(i,1);
        else
            tempTC(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_set_EIG(1,i)>0 && x<1/temp_set_EIG(1,i)
            tempEIG(i,1) = temp_classTRUE(i,1);
        else
            tempEIG(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_set_MS(1,i)>0 && x<1/temp_set_MS(1,i)
            tempMS(i,1) = temp_classTRUE(i,1);
        else
            tempMS(i,1) = 0;
        end
    end    
    for i=1:N
        x = rand;
        if temp_set_BR(1,i)>0 && x<1/temp_set_BR(1,i)
            tempBR(i,1) = temp_classTRUE(i,1);
        else
            tempBR(i,1) = 0;
        end
    end
[suCRP(m),pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(tempCRP,tempBR,temp_classTRUE);
[suCC(m),pCC(m),e1CC(m),e2(m)]=testcholdout(tempCC,tempBR,temp_classTRUE);
[suTC(m),pTC(m),e1TC(m),e2(m)]=testcholdout(tempTC,tempBR,temp_classTRUE);
[suEIG(m),pEIG(m),e1EIG(m),e2(m)]=testcholdout(tempEIG,tempBR,temp_classTRUE);
[suMS(m),pMS(m),e1MS(m),e2(m)]=testcholdout(tempMS,tempBR,temp_classTRUE);
end



FalsePositivesWRI_main = [e1CRP', e1MS', e1TC', e1EIG', e1CC', e2BR'];
FalsePositivesWRI_main = mean(FalsePositivesWRI_main);
STerrorWRI_main = [std(e1CRP), std(e1MS), std(e1TC), std(e1EIG), std(e1CC), std(e2BR)];


idDiffCRP = - e1CRP' + e2BR';
idDiffCC = - e1CC' + e2BR';
idDiffTC = - e1TC' + e2BR';
idDiffEIG = - e1EIG' + e2BR';
idDiffMS = - e1MS' + e2BR';

prctile(idDiffCRP,99)
prctile(idDiffCRP,1)

idDiffCRPCC = e1CC' - e1CRP';
idDiffCRPEIG = e1EIG' - e1CRP';

prctile(idDiffCRPCC,95)
prctile(idDiffCRPCC,5)

prctile(idDiffCRPEIG,99)
prctile(idDiffCRPEIG,1)


for m=1:100000
    y = randi(145,145,1);
    temp_Max_CRP_Rank = Max_CRP_Rank(y);
    temp_Max_MS_Rank = Max_MS_Rank(y);
    temp_Max_TC_Rank = Max_TC_Rank(y);
    temp_Max_EIG_Rank = Max_EIG_Rank(y);
    temp_Max_CC_Rank = Max_CC_Rank(y);
    temp_Max_BR_Rank = Max_BR_Rank(y);
    temp_wCRP = wCRP(y);
    temp_wMS = wMS(y);
    temp_wTC = wTC(y);
    temp_wEIG = wEIG(y);
    temp_wCC = wCC(y); 
    temp_wBR = wBR(y);
    temp_wTRUE = wTRUE(y);
    for i=1:N
        x = rand;
        if temp_Max_CRP_Rank(i,1)==1 && x<1/temp_wCRP(i,1)
            tempCRP(i,1) = temp_wTRUE(i,1);
        else
            tempCRP(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_Max_CC_Rank(i,1)==1 && x<1/temp_wCC(i,1)
            tempCC(i,1) = temp_wTRUE(i,1);
        else
            tempCC(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_Max_TC_Rank(i,1)==1 && x<1/temp_wTC(i,1)
            tempTC(i,1) = temp_wTRUE(i,1);
        else
            tempTC(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_Max_EIG_Rank(i,1)==1 && x<1/temp_wEIG(i,1)
            tempEIG(i,1) = temp_wTRUE(i,1);
        else
            tempEIG(i,1) = 0;
        end
    end
    for i=1:N
        x = rand;
        if temp_Max_MS_Rank(i,1)==1 && x<1/temp_wMS(i,1)
            tempMS(i,1) = temp_wTRUE(i,1);
        else
            tempMS(i,1) = 0;
        end
    end    
    for i=1:N
        x = rand;
        if temp_Max_BR_Rank(i,1)==1 && x<1/temp_wBR(i,1)
            tempBR(i,1) = temp_wTRUE(i,1);
        else
            tempBR(i,1) = 0;
        end
    end
[~,pCRP(m),e1CRP(m),e2BR(m)]=testcholdout(tempCRP,tempBR,temp_wTRUE);
[~,pCC(m),e1CC(m),e2(m)]=testcholdout(tempCC,tempBR,temp_wTRUE);
[~,pTC(m),e1TC(m),e2(m)]=testcholdout(tempTC,tempBR,temp_wTRUE);
[~,pEIG(m),e1EIG(m),e2(m)]=testcholdout(tempEIG,tempBR,temp_wTRUE);
[~,pMS(m),e1MS(m),e2(m)]=testcholdout(tempMS,tempBR,temp_wTRUE);
end


FalsePositivesEI_main = [e1CRP', e1MS', e1TC', e1EIG', e1CC', e2BR'];
FalsePositivesEI_main= mean(FalsePositivesEI_main);
STerrorEI_main = [std(e1CRP), std(e1MS), std(e1TC), std(e1EIG), std(e1CC), std(e2BR)];



%% bar plot of expected false-positives


FalsePositivesEI = [FalsePositivesEI_all; FalsePositivesEI_main];
STerrorEI = [STerrorEI_all; STerrorEI_main];

FalsePositivesWRI = [FalsePositivesWRI_all; FalsePositivesWRI_main];
STerrorWRI = [STerrorWRI_all; STerrorWRI_main];

% cat = categorical({'Cheaters', 'Honest', 'Tempted'});
% errorbar(cat,phat_type,phat_type-ci_type(1,:),ci_type(2,:)-phat_type,'LineStyle','none')


name = {'\color{blue}\bf CRP', '\color{blue}\bf MS', '\color{blue}\bf TC', '\color{red}\bf EIG', '\color{red}\bf CC', 'BR'};
x=1:1:6;

subplot(1,2,1)
hb = bar(x,FalsePositivesEI);
set(gca,'FontName','Times','xticklabel',name)
ylim([0 1])
hold on
for k = 1:numel(hb)
    XEP(k,:) = hb(k).XEndPoints;
    YEP(k,:) = hb(k).YEndPoints;
    errorbar(XEP(k,:),YEP(k,:),STerrorEI(k,:),STerrorEI(k,:),'.k')   % the y means (assumes columns are observations)
end
legend('ALL','MAIN','','','Location','northwest')
hold off
hb(1).FaceColor = '#f46d43';
hb(2).FaceColor = '#abdda4';
title('Most-preferred Alternative')
subplot(1,2,2)
hb = bar(x,FalsePositivesWRI);
set(gca,'FontName','Times','xticklabel',name)
ylim([0 1])
hold on
for k = 1:numel(hb)
    XEP(k,:) = hb(k).XEndPoints;
    YEP(k,:) = hb(k).YEndPoints;
    errorbar(XEP(k,:),YEP(k,:),STerrorWRI(k,:),STerrorWRI(k,:),'.k')   % the y means (assumes columns are observations)
end
legend('ALL','MAIN','','','Location','northwest')
hold off
hb(1).FaceColor = '#f46d43';
hb(2).FaceColor = '#abdda4';
title('Welfare Preference')




%% bar plot of expected accuracy and coarseness

STerrorUI_UI = [STerrorUI_UI_all; STerrorUI_UI_main];

STerrorUI_WRI = [STerrorUI_WRI_all; STerrorUI_WRI_main];

UI_best_all = [UI_CRP_all, UI_MS_all, UI_TC_all, UI_EIG_all, UI_CC_all, UI_BR_all];

WRI_best_all = [WRI_CRP_all, WRI_MS_all, WRI_TC_all, WRI_EIG_all, WRI_CC_all, WRI_BR_all];

UI_best_main = [UI_CRP, UI_MS, UI_TC, UI_EIG, UI_CC, UI_BR];

WRI_best_main = [WRI_CRP, WRI_MS, WRI_TC, WRI_EIG, WRI_CC, WRI_BR];

UI_best = [UI_best_all;UI_best_main];
WRI_best = [WRI_best_all;WRI_best_main];

% cat = categorical({'Cheaters', 'Honest', 'Tempted'});
% errorbar(cat,phat_type,phat_type-ci_type(1,:),ci_type(2,:)-phat_type,'LineStyle','none')


name = {'\color{blue}\bf CRP', '\color{blue}\bf MS', '\color{blue}\bf TC', '\color{red}\bf EIG', '\color{red}\bf CC', 'BR'};
x=1:1:6;

subplot(1,2,1)
hb = bar(x,UI_best);
set(gca,'FontName','Times','xticklabel',name)
ylim([0 1])
hold on
for k = 1:numel(hb)
    XEP(k,:) = hb(k).XEndPoints;
    YEP(k,:) = hb(k).YEndPoints;
    errorbar(XEP(k,:),YEP(k,:),STerrorUI_UI(k,:),STerrorUI_UI(k,:),'.k')   % the y means (assumes columns are observations)
end
% legend('ALL','MAIN','','','Location','northwest')
hold off
hb(1).FaceColor = '#f46d43';
hb(2).FaceColor = '#abdda4';
title('Most-preferred Alternative')
subplot(1,2,2)
hb = bar(x,WRI_best);
set(gca,'FontName','Times','xticklabel',name)
ylim([0 1])
hold on
for k = 1:numel(hb)
    XEP(k,:) = hb(k).XEndPoints;
    YEP(k,:) = hb(k).YEndPoints;
    errorbar(XEP(k,:),YEP(k,:),STerrorUI_WRI(k,:),STerrorUI_WRI(k,:),'.k')   % the y means (assumes columns are observations)
end
legend('ALL','MAIN','','','Location','northwest')
hold off
hb(1).FaceColor = '#f46d43';
hb(2).FaceColor = '#abdda4';
title('Welfare Preference')





% UI_best_all = [UI_CRP_all, UI_MS_all, UI_TC_all, UI_EIG_all, UI_CC_all, UI_BR_all];
% 
% WRI_best_all = [WRI_CRP_all, WRI_MS_all, WRI_TC_all, WRI_EIG_all, WRI_CC_all, WRI_BR_all];
% 
% UI_best_main = [UI_CRP, UI_MS, UI_TC, UI_EIG, UI_CC, UI_BR];
% 
% WRI_best_main = [WRI_CRP, WRI_MS, WRI_TC, WRI_EIG, WRI_CC, WRI_BR];
% 
% UI_best = [UI_best_all;UI_best_main];
% WRI_best = [WRI_best_all;WRI_best_main];
% 
% 
% % cat = categorical({'Cheaters', 'Honest', 'Tempted'});
% % errorbar(cat,phat_type,phat_type-ci_type(1,:),ci_type(2,:)-phat_type,'LineStyle','none')
% 
% 
% name = {'CRP', 'MS', 'TC', 'EIG', 'CC', 'BR'};
% x=1:1:6;
% 
% subplot(1,2,1)
% hb = bar(x,UI_best);
% set(gca,'FontName','Risks','xticklabel',name)
% ylim([0 1])
% % legend('ALL','MAIN','','','Location','northeast')
% hb(1).FaceColor = '#f46d43';
% hb(2).FaceColor = '#abdda4';
% title('Most-preferred Alternative')
% subplot(1,2,2)
% hb = bar(x,WRI_best);
% set(gca,'FontName','Risks','xticklabel',name)
% ylim([0 1])
% legend('ALL','MAIN','','','Location','northeast')
% hb(1).FaceColor = '#f46d43';
% hb(2).FaceColor = '#abdda4';
% title('Welfare Preference')


%% bar plot of expected accuracy and coarseness


setId_best_all = [setId_CRP_all, setId_MS_all, setId_TC_all, setId_EIG_all, setId_CC_all, setId_BR_all];

setWRI_best_all = [setWRI_CRP_all, setWRI_MS_all, setWRI_TC_all, setWRI_EIG_all, setWRI_CC_all, setWRI_BR_all];

setId_best_main = [SetId_CRP, SetId_MS, SetId_TC, SetId_EIG, SetId_CC, SetId_BR];

setWRI_best_main = [setWRI_CRP, setWRI_MS, setWRI_TC, setWRI_EIG, setWRI_CC, setWRI_BR];

STerrorSet_UI = [STerrorUI_UI_all; STerrorUI_UI_main];

STerrorSet_WRI = [STerrorUI_WRI_all; STerrorUI_WRI_main];

setId_best = [setId_best_all;setId_best_main];
setWRI_best = [setWRI_best_all;setWRI_best_main];


% cat = categorical({'Cheaters', 'Honest', 'Tempted'});
% errorbar(cat,phat_type,phat_type-ci_type(1,:),ci_type(2,:)-phat_type,'LineStyle','none')


name = {'\color{blue}\bf CRP', '\color{blue}\bf MS', '\color{blue}\bf TC', '\color{red}\bf EIG', '\color{red}\bf CC', 'BR'};
x=1:1:6;

subplot(1,2,1)
hb = bar(x,setId_best);
set(gca,'FontName','Times','xticklabel',name)
ylim([0 1])
hold on
for k = 1:numel(hb)
    XEP(k,:) = hb(k).XEndPoints;
    YEP(k,:) = hb(k).YEndPoints;
    errorbar(XEP(k,:),YEP(k,:),STerrorSet_UI(k,:),STerrorUI_UI(k,:),'.k')   % the y means (assumes columns are observations)
end
legend('ALL','MAIN','','','Location','northwest')
hold off
hb(1).FaceColor = '#f46d43';
hb(2).FaceColor = '#abdda4';
title('Most-preferred Alternative')
subplot(1,2,2)
hb = bar(x,setWRI_best);
set(gca,'FontName','Times','xticklabel',name)
ylim([0 1])
hold on
for k = 1:numel(hb)
    XEP(k,:) = hb(k).XEndPoints;
    YEP(k,:) = hb(k).YEndPoints;
    errorbar(XEP(k,:),YEP(k,:),STerrorSet_WRI(k,:),STerrorUI_WRI(k,:),'.k')   % the y means (assumes columns are observations)
end
legend('ALL','MAIN','','','Location','northwest')
hold off
hb(1).FaceColor = '#f46d43';
hb(2).FaceColor = '#abdda4';
title('Welfare Preference')


% 
% name = {'CRP', 'MS', 'TC', 'EIG', 'CC', 'BR'};
% x=1:1:6;
% 
% subplot(1,2,1)
% hb = bar(x,setId_best);
% set(gca,'FontName','Risks','xticklabel',name)
% ylim([0 1])
% % legend('ALL','MAIN','','','Location','northwestoutside')
% hb(1).FaceColor = '#f46d43';
% hb(2).FaceColor = '#abdda4';
% title('Most-preferred Alternative')
% subplot(1,2,2)
% hb = bar(x,setWRI_best);
% set(gca,'FontName','Risks','xticklabel',name)
% ylim([0 1])
% legend('ALL','MAIN','','','Location','northwest')
% hb(1).FaceColor = '#f46d43';
% hb(2).FaceColor = '#abdda4';
% title('Welfare Preference')














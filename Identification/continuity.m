%% load choices with four elements %%

clear 
clc

load('C:\Users\tew394\Documents\4elementsexample\choice.mat')
choice = [choice(:,6),choice(:,5),choice(:,4),choice(:,3),choice(:,2),choice(:,1),...
    choice(:,10),choice(:,9),choice(:,8),choice(:,7),choice(:,11)];

%% create a series of domains eliminating one set each time %%
%% this is equivalent to a definition of continuity with delta=1 %%
S = {'x','y','z','w'}; % set of alternatives
N = size(S,2); % number of alternatives
Ns = 11; % number of sets
Ch = 2^6*3^4*4;
Rel = 12;% choice function space size
ind_dom = 1:1:Ns;
ind_dom = repmat(ind_dom,11,1);
ind_dom = ind_dom.*((eye(Ns)+1)==1);
ind = zeros(Ns,Ns-1);
for i=1:Ns
    temp = ind_dom(i,:);
    temp = temp(temp~=0);
    ind(i,:) = temp;
end

domains = cell(1,Ns);

for i=1:Ns
domains{1,i} = choice(:,ind(i,:));
end

clearvars -except S Ns N Ch domains Rel

%% create the revealed preference matrix for each domains and choice functions

%%%%%%%%%%%%%% In this file I create the matrices for simple counting
%%%%%%%%%%%%%% and counting revealed preference using the MAIN sets.

%%%%%%%%%%%%%% find the elements in choices

X = cell(1,Ns);
Y = cell(1,Ns);
Z = cell(1,Ns);
W = cell(1,Ns);

for s=1:Ns
X{1,s} = cell(Ch,Ns-1);
Y{1,s} = cell(Ch,Ns-1);
Z{1,s} = cell(Ch,Ns-1);
W{1,s} = cell(Ch,Ns-1);
end
for s=1:Ns    
for i=1:Ch
    for j=1:Ns-1 
        X{1,s}(i,j) = {find(strcmp(domains{1,s}(i,j),S{1}))};
        Y{1,s}(i,j) = {find(strcmp(domains{1,s}(i,j),S{2}))};
        Z{1,s}(i,j) = {find(strcmp(domains{1,s}(i,j),S{3}))};
        W{1,s}(i,j) = {find(strcmp(domains{1,s}(i,j),S{4}))};
    end
end
end


XemptyIndex =  cell(1,Ns);
YemptyIndex =  cell(1,Ns);
ZemptyIndex =  cell(1,Ns);
WemptyIndex =  cell(1,Ns);

for s=1:Ns
XemptyIndex{1,s} =cellfun(@isempty,X{1,s});
YemptyIndex{1,s} =cellfun(@isempty,Y{1,s});
ZemptyIndex{1,s} =cellfun(@isempty,Z{1,s});
WemptyIndex{1,s} =cellfun(@isempty,W{1,s});

X{1,s}(XemptyIndex{1,s}) = {0};
Y{1,s}(YemptyIndex{1,s}) = {0};
Z{1,s}(ZemptyIndex{1,s}) = {0};
W{1,s}(WemptyIndex{1,s}) = {0};
end
%%%%%%%%%%%% create a 0-1 matrix with choices of {x,y,z,w}
Xn = cell(1,Ns);
Yn = cell(1,Ns);
Zn = cell(1,Ns);
Wn = cell(1,Ns);
for s=1:Ns
Xn{1,s} = cell2mat(X{1,s});
Yn{1,s} = cell2mat(Y{1,s});
Zn{1,s} = cell2mat(Z{1,s});
Wn{1,s} = cell2mat(W{1,s});
end

clear XemptyIndex YemptyIndex ZemptyIndex WemptyIndex
%%%%%%%%%%%% Definition of the Domain. In this case, MAIN sets.
Domain = cell(1,Ns);
for i=1:Ch
Domain{1,1}(i,:) = {{'x','z'},{'x','w'},{'y','z'},{'y','w'},{'z','w'},{'x','y','z'},{'x','y','w'},{'x','z','w'},{'y','z','w'},{'x','y','z','w'}};
Domain{1,2}(i,:) = {{'x','y'},{'x','w'},{'y','z'},{'y','w'},{'z','w'},{'x','y','z'},{'x','y','w'},{'x','z','w'},{'y','z','w'},{'x','y','z','w'}};
Domain{1,3}(i,:) = {{'x','y'},{'x','z'},{'y','z'},{'y','w'},{'z','w'},{'x','y','z'},{'x','y','w'},{'x','z','w'},{'y','z','w'},{'x','y','z','w'}};
Domain{1,4}(i,:) = {{'x','y'},{'x','z'},{'x','w'},{'y','w'},{'z','w'},{'x','y','z'},{'x','y','w'},{'x','z','w'},{'y','z','w'},{'x','y','z','w'}};
Domain{1,5}(i,:) = {{'x','y'},{'x','z'},{'x','w'},{'y','z'},{'z','w'},{'x','y','z'},{'x','y','w'},{'x','z','w'},{'y','z','w'},{'x','y','z','w'}};
Domain{1,6}(i,:) = {{'x','y'},{'x','z'},{'x','w'},{'y','z'},{'y','w'},{'x','y','z'},{'x','y','w'},{'x','z','w'},{'y','z','w'},{'x','y','z','w'}};
Domain{1,7}(i,:) = {{'x','y'},{'x','z'},{'x','w'},{'y','z'},{'y','w'},{'z','w'},{'x','y','w'},{'x','z','w'},{'y','z','w'},{'x','y','z','w'}};
Domain{1,8}(i,:) = {{'x','y'},{'x','z'},{'x','w'},{'y','z'},{'y','w'},{'z','w'},{'x','y','z'},{'x','z','w'},{'y','z','w'},{'x','y','z','w'}};
Domain{1,9}(i,:) = {{'x','y'},{'x','z'},{'x','w'},{'y','z'},{'y','w'},{'z','w'},{'x','y','z'},{'x','y','w'},{'y','z','w'},{'x','y','z','w'}};
Domain{1,10}(i,:) = {{'x','y'},{'x','z'},{'x','w'},{'y','z'},{'y','w'},{'z','w'},{'x','y','z'},{'x','y','w'},{'x','z','w'},{'x','y','z','w'}};
Domain{1,11}(i,:) = {{'x','y'},{'x','z'},{'x','w'},{'y','z'},{'y','w'},{'z','w'},{'x','y','z'},{'x','y','w'},{'x','z','w'},{'y','z','w'}};
end

%%%%%%%%%%%% 0-1 Matrix --> if elements belong to the sets.
Xin = cell(1,Ns);
Yin = cell(1,Ns);
Zin = cell(1,Ns);
Win = cell(1,Ns);
for s=1:Ns
Xin{1,s} = cell(Ch,Ns-1);
Yin{1,s} = cell(Ch,Ns-1);
Zin{1,s} = cell(Ch,Ns-1);
Win{1,s} = cell(Ch,Ns-1);
end

for s=1:Ns
for i=1:Ch
    for j=1:Ns-1
        Xin{1,s}(i,j) = {find(strcmp(Domain{1,s}{i,j},S{1}))};
        Yin{1,s}(i,j) = {find(strcmp(Domain{1,s}{i,j},S{2}))};
        Zin{1,s}(i,j) = {find(strcmp(Domain{1,s}{i,j},S{3}))};
        Win{1,s}(i,j) = {find(strcmp(Domain{1,s}{i,j},S{4}))};
    end
end
end

for s=1:Ns
for i=1:Ch
    for j=1:Ns-1
        if Xin{1,s}{i,j}>0
            Xin{1,s}{i,j} = 1;
        else 
            Xin{1,s}{i,j} = 0;
        end
        if Yin{1,s}{i,j}>0
            Yin{1,s}{i,j} = 1;
        else 
            Yin{1,s}{i,j} = 0;
        end
        if Zin{1,s}{i,j}>0
            Zin{1,s}{i,j} = 1;
        else 
            Zin{1,s}{i,j} = 0;
        end
        if Win{1,s}{i,j}>0
            Win{1,s}{i,j} = 1;
        else 
            Win{1,s}{i,j} = 0;
        end        
    end
end
end
for s=1:Ns
Xin{1,s} = cell2mat(Xin{1,s});
Yin{1,s} = cell2mat(Yin{1,s});
Zin{1,s} = cell2mat(Zin{1,s});
Win{1,s} = cell2mat(Win{1,s});
end

%%%%%%%%%%%%%%%%%%% Revealed Preference creator
xRz = cell(1,Ns);
zRx = cell(1,Ns);
yRx = cell(1,Ns);
xRy = cell(1,Ns);
yRz = cell(1,Ns);
zRy = cell(1,Ns);
xRw = cell(1,Ns);
yRw = cell(1,Ns);
zRw = cell(1,Ns);
wRx = cell(1,Ns);
wRy = cell(1,Ns);
wRz = cell(1,Ns);

for s=1:Ns
xRz{1,s} = zeros(Ch,Ns-1);
zRx{1,s} = zeros(Ch,Ns-1);
yRx{1,s} = zeros(Ch,Ns-1);
xRy{1,s} = zeros(Ch,Ns-1);
yRz{1,s} = zeros(Ch,Ns-1);
zRy{1,s} = zeros(Ch,Ns-1);
xRw{1,s} = zeros(Ch,Ns-1);
yRw{1,s} = zeros(Ch,Ns-1);
zRw{1,s} = zeros(Ch,Ns-1);
wRx{1,s} = zeros(Ch,Ns-1);
wRy{1,s} = zeros(Ch,Ns-1);
wRz{1,s} = zeros(Ch,Ns-1);
end

for s=1:Ns
for i=1:Ch
    for j=1:Ns-1
        if Xn{1,s}(i,j) == Yin{1,s}(i,j)  && Xn{1,s}(i,j) ==1
            xRy{1,s}(i,j) = 1;
        else
            xRy{1,s}(i,j) = 0;
        end   
        if Yn{1,s}(i,j) == Xin{1,s}(i,j) && Yn{1,s}(i,j) ==1 
            yRx{1,s}(i,j) = 1;
        else
            yRx{1,s}(i,j) = 0;
        end        
        if Xn{1,s}(i,j) == Zin{1,s}(i,j) && Xn{1,s}(i,j) ==1 
            xRz{1,s}(i,j) = 1;
        else
            xRz{1,s}(i,j) = 0;
        end
        if Zn{1,s}(i,j) == Xin{1,s}(i,j)  && Zn{1,s}(i,j) ==1 
            zRx{1,s}(i,j) = 1;
        else
            zRx{1,s}(i,j) = 0;
        end
        if Yn{1,s}(i,j) == Zin{1,s}(i,j)  && Yn{1,s}(i,j) ==1 
            yRz{1,s}(i,j) = 1;
        else
            yRz{1,s}(i,j) = 0;
        end
        if Zn{1,s}(i,j) == Yin{1,s}(i,j)  && Zn{1,s}(i,j) ==1 
            zRy{1,s}(i,j) = 1;
        else
            zRy{1,s}(i,j) = 0;
        end
        if Xn{1,s}(i,j) == Win{1,s}(i,j) && Xn{1,s}(i,j) ==1 
            xRw{1,s}(i,j) = 1;
        else
            xRw{1,s}(i,j) = 0;
        end
        if Wn{1,s}(i,j) == Xin{1,s}(i,j)  && Wn{1,s}(i,j) ==1 
            wRx{1,s}(i,j) = 1;
        else
            wRx{1,s}(i,j) = 0;
        end
        if Yn{1,s}(i,j) == Win{1,s}(i,j) && Yn{1,s}(i,j) ==1 
            yRw{1,s}(i,j) = 1;
        else
            yRw{1,s}(i,j) = 0;
        end      
        if Wn{1,s}(i,j) == Yin{1,s}(i,j)  && Wn{1,s}(i,j) ==1
            wRy{1,s}(i,j) = 1;
        else
            wRy{1,s}(i,j) = 0;
        end
        if Wn{1,s}(i,j) == Zin{1,s}(i,j)  && Wn{1,s}(i,j) ==1 
           wRz{1,s}(i,j) = 1;
        else
            wRz{1,s}(i,j) = 0;
        end
        if Zn{1,s}(i,j) == Win{1,s}(i,j)  && Zn{1,s}(i,j) ==1 
            zRw{1,s}(i,j) = 1;
        else
            zRw{1,s}(i,j) = 0;
        end
    end
end
end



%%%%%%%%%% Simple Counting
ChX = cell(1,Ns);
ChY = cell(1,Ns);
ChZ = cell(1,Ns);
ChW = cell(1,Ns);

ChXZ = cell(1,Ns);
ChZX = cell(1,Ns);
ChXY = cell(1,Ns);
ChYX = cell(1,Ns);
ChYZ = cell(1,Ns);
ChZY = cell(1,Ns);
ChXW = cell(1,Ns);
ChWX = cell(1,Ns);
ChWY = cell(1,Ns);
ChYW = cell(1,Ns);
ChWZ = cell(1,Ns);
ChZW = cell(1,Ns);

choicearray = cell(1,Ns);

Revealed = cell(1,Ns);
for s=1:Ns
ChX{1,s} = sum(Xn{1,s},2);
ChY{1,s} = sum(Yn{1,s},2);
ChZ{1,s} = sum(Zn{1,s},2);
ChW{1,s} = sum(Wn{1,s},2);

%%%%%%%%% Counting Revealed Preference

ChXZ{1,s}= sum(xRz{1,s},2);
ChZX{1,s}= sum(zRx{1,s},2);
ChXY{1,s}= sum(xRy{1,s},2);
ChYX{1,s}= sum(yRx{1,s},2);
ChYZ{1,s}= sum(yRz{1,s},2);
ChZY{1,s}= sum(zRy{1,s},2);
ChXW{1,s}= sum(xRw{1,s},2);
ChWX{1,s}= sum(wRx{1,s},2);
ChWY{1,s}= sum(wRy{1,s},2);
ChYW{1,s}= sum(yRw{1,s},2);
ChWZ{1,s}= sum(wRz{1,s},2);
ChZW{1,s}= sum(zRw{1,s},2);

choicearray{1,s} = cat(2,ChX{1,s},ChY{1,s},ChZ{1,s},ChW{1,s});

Revealed{1,s} = cat(2,ChXY{1,s},ChXZ{1,s},ChXW{1,s},ChYX{1,s},ChYZ{1,s},ChYW{1,s},ChZX{1,s},ChZY{1,s},ChZW{1,s},ChWX{1,s},ChWY{1,s},ChWZ{1,s});
end

clear X Y Z W Xn Yn Zn Wn Xin Yin Zin Win 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% number of WARP violations

WARPxyzw = cell(1,Ns);
WARPxy = cell(1,Ns);
WARPxz = cell(1,Ns);
WARPxw = cell(1,Ns);
WARPyz = cell(1,Ns);
WARPyw = cell(1,Ns);
WARPzw = cell(1,Ns);
WARP = cell(1,Ns);

for s=1:Ns
WARPxyzw{1,s} = zeros(size(Revealed{1,s},1),1);

WARPxy{1,s} = zeros(size(Revealed,1),1);
WARPxz{1,s} = zeros(size(Revealed,1),1);
WARPxw{1,s} = zeros(size(Revealed,1),1);
WARPyz{1,s} = zeros(size(Revealed,1),1);
WARPyw{1,s} = zeros(size(Revealed,1),1);
WARPzw{1,s} = zeros(size(Revealed,1),1);
end
for s=1:Ns
for z=1:size(Revealed{1,s},1)
    WARPxy{1,s}(z,1)=Revealed{1,s}(z,1)*Revealed{1,s}(z,4);
    WARPxz{1,s}(z,1)=Revealed{1,s}(z,2)*Revealed{1,s}(z,7);
    WARPxw{1,s}(z,1)=Revealed{1,s}(z,3)*Revealed{1,s}(z,10);
    WARPyz{1,s}(z,1)=Revealed{1,s}(z,5)*Revealed{1,s}(z,8);
    WARPyw{1,s}(z,1)=Revealed{1,s}(z,6)*Revealed{1,s}(z,11);
    WARPzw{1,s}(z,1)=Revealed{1,s}(z,9)*Revealed{1,s}(z,12);
    WARPxyzw{1,s}(z,1) = Revealed{1,s}(z,1)*Revealed{1,s}(z,4)+Revealed{1,s}(z,2)*Revealed{1,s}(z,7)+Revealed{1,s}(z,3)*Revealed{1,s}(z,10)+Revealed{1,s}(z,5)*Revealed{1,s}(z,8)+Revealed{1,s}(z,6)*Revealed{1,s}(z,11)+Revealed{1,s}(z,9)*Revealed{1,s}(z,12);
end
WARP{1,s} = sum(WARPxyzw{1,s},2);
end

clear WARPxy WARPxz WARPxw WARPyz WARPyw WARPzw WARPxyzw

%% counting revealed preference
countrev = cell(1,Ns);
for s = 1:Ns
    for z = 1:Ch
        countrev{1,s}(1,2,z) = ChXY{1,s}(z,1);
        countrev{1,s}(1,3,z) = ChXZ{1,s}(z,1);
        countrev{1,s}(1,4,z) = ChXW{1,s}(z,1);
        countrev{1,s}(2,3,z) = ChYZ{1,s}(z,1);
        countrev{1,s}(2,4,z) = ChYW{1,s}(z,1);
        countrev{1,s}(3,4,z) = ChZW{1,s}(z,1);
        countrev{1,s}(2,1,z) = ChYX{1,s}(z,1);
        countrev{1,s}(3,1,z) = ChZX{1,s}(z,1);
        countrev{1,s}(3,2,z) = ChZY{1,s}(z,1);
        countrev{1,s}(4,1,z) = ChWX{1,s}(z,1);
        countrev{1,s}(4,2,z) = ChWY{1,s}(z,1);
        countrev{1,s}(4,3,z) = ChWZ{1,s}(z,1);
    end
end

%% get the methods estimation for each choice function in each domain

%% Bernheim and Rangel Method
BernRang = cell(1,Ns);
for s=1:Ns
BernRang{1,s} = zeros(size(S,2),size(S,2),Ch);
end

for s=1:Ns
for i=1:Ch
    if sum(xRy{1,s}(i,:)) > 0 && sum(yRx{1,s}(i,:)) > 0  || sum(xRy{1,s}(i,:)) == 0 && sum(yRx{1,s}(i,:)) == 0
        BernRang{1,s}(1,2,i) = 0;
        BernRang{1,s}(2,1,i) = 0;
    elseif  sum(xRy{1,s}(i,:)) > 0 && sum(yRx{1,s}(i,:)) == 0
        BernRang{1,s}(1,2,i) = 1;
    elseif  sum(xRy{1,s}(i,:)) == 0 && sum(yRx{1,s}(i,:)) > 0
        BernRang{1,s}(2,1,i) = 1;
    end
end


for i=1:Ch
    if sum(xRz{1,s}(i,:)) > 0 && sum(zRx{1,s}(i,:)) > 0  || sum(xRz{1,s}(i,:)) == 0 && sum(zRx{1,s}(i,:)) == 0
        BernRang{1,s}(1,3,i) = 0;
        BernRang{1,s}(3,1,i) = 0;
    elseif  sum(xRz{1,s}(i,:)) > 0 && sum(zRx{1,s}(i,:)) == 0
        BernRang{1,s}(1,3,i) = 1;
    elseif  sum(xRz{1,s}(i,:)) == 0 && sum(zRx{1,s}(i,:)) > 0
        BernRang{1,s}(3,1,i) = 1;
    end
end


for i=1:Ch
    if sum(zRy{1,s}(i,:)) > 0 && sum(yRz{1,s}(i,:)) > 0  || sum(zRy{1,s}(i,:)) == 0 && sum(yRz{1,s}(i,:)) == 0
        BernRang{1,s}(2,3,i) = 0;
        BernRang{1,s}(3,2,i) = 0;
    elseif  sum(zRy{1,s}(i,:)) > 0 && sum(yRz{1,s}(i,:)) == 0
        BernRang{1,s}(3,2,i) = 1;
    elseif  sum(zRy{1,s}(i,:)) == 0 && sum(yRz{1,s}(i,:)) > 0
        BernRang{1,s}(2,3,i) = 1;
    end
end



for i=1:Ch
    if sum(xRw{1,s}(i,:)) > 0 && sum(wRx{1,s}(i,:)) > 0  || sum(xRw{1,s}(i,:)) == 0 && sum(wRx{1,s}(i,:)) == 0
        BernRang{1,s}(1,4,i) = 0;
       BernRang{1,s}(4,1,i) = 0;
    elseif  sum(xRw{1,s}(i,:)) > 0 && sum(wRx{1,s}(i,:)) == 0
        BernRang{1,s}(1,4,i) = 1;
    elseif  sum(xRw{1,s}(i,:)) == 0 && sum(wRx{1,s}(i,:)) > 0
        BernRang{1,s}(4,1,i) = 1;
    end
end


for i=1:Ch
    if sum(wRy{1,s}(i,:)) > 0 && sum(yRw{1,s}(i,:)) > 0  || sum(wRy{1,s}(i,:)) == 0 && sum(yRw{1,s}(i,:)) == 0
        BernRang{1,s}(4,2,i) = 0;
        BernRang{1,s}(2,4,i) = 0;
    elseif  sum(wRy{1,s}(i,:)) > 0 && sum(yRw{1,s}(i,:)) == 0
        BernRang{1,s}(4,2,i) = 1;
    elseif  sum(wRy{1,s}(i,:)) == 0 && sum(yRw{1,s}(i,:)) > 0
        BernRang{1,s}(2,4,i) = 1;
    end
end

for i=1:Ch
    if sum(zRw{1,s}(i,:)) > 0 && sum(wRz{1,s}(i,:)) > 0  || sum(zRw{1,s}(i,:)) == 0 && sum(wRz{1,s}(i,:)) == 0
        BernRang{1,s}(3,4,i) = 0;
        BernRang{1,s}(4,3,i) = 0;
    elseif  sum(zRw{1,s}(i,:)) > 0 && sum(wRz{1,s}(i,:)) == 0
        BernRang{1,s}(3,4,i) = 1;
    elseif  sum(zRw{1,s}(i,:)) == 0 && sum(wRz{1,s}(i,:)) > 0
        BernRang{1,s}(4,3,i) = 1;
    end
end
end

%% Counting methods
countsol = cell(1,Ns);
for s=1:Ns
countsol{1,s} = zeros(size(S,2),size(S,2),Ch);
end


for s=1:Ns
for z=1:Ch
    for i = 1:size(S,2)
        for   j = 1:size(S,2)
            if choicearray{1,s}(z,i) >= choicearray{1,s}(z,j)
                countsol{1,s}(i,j,z) = 1;
            else
                countsol{1,s}(i,j,z) = 0;
            end
        end
    end
end



for z=1:Ch
for i = 1:size(S,2)
    for j= 1:size(S,2)
        if i==j
            countsol{1,s}(i,j,z) = 0;
        else
        end
    end
end
end
end

countrevsol = cell(1,Ns);
for s=1:Ns
countrevsol{1,s} = zeros(size(S,2),size(S,2),Ch);
end

for s=1:Ns
    for z=1:Ch
        for i = 1:size(S,2)
            for j = 1:size(S,2)
             if i~=j && countrev{1,s}(i,j,z) > countrev{1,s}(j,i,z)
                     countrevsol{1,s}(i,j,z) = 1;
                     countrevsol{1,s}(j,i,z) = 0;
             elseif i~=j && countrev{1,s}(j,i,z) > countrev{1,s}(i,j,z)
                     countrevsol{1,s}(j,i,z) = 1;
                     countrevsol{1,s}(i,j,z) = 0;
             elseif i~=j && countrev{1,s}(j,i,z) == countrev{1,s}(i,j,z)
                     countrevsol{1,s}(i,j,z) = 1;
                     countrevsol{1,s}(j,i,z) = 1; 
             elseif i==j
                     countrevsol{1,s}(i,j,z) = 0;
             end
            end
        end
    end
end

clear ChX ChY ChZ ChW ChXY ChXZ ChXW ChYX ChYZ ChYW ChZX ChZY ChZW ChWX ChWY ChWZ

%% Eigenvector

outdegree = {'x','x','x','y','y','y','z','z','z','w','w','w'};
indegree = {'y','z','w','x','z','w','x','y','w','x','y','z'};

Revealedgraph = cell(1,Ns);

for r=1:Ns
for i=1:Ch % revealed preference graphs
    Revealedgraph{1,r}{1,i} = digraph(outdegree,indegree,Revealed{1,r}(i,:),S);
end
end
Adiacencyrevealedgraph = cell(1,Ns);
for r=1:Ns
for i=1:Ch %Adjacency matrices of revealed preference graphs
    nn = numnodes(Revealedgraph{1,r}{1,i});
    [s,t]=findedge(Revealedgraph{1,r}{1,i});
        Adiacencyrevealedgraph{1,r}{1,i} = sparse(s,t,Revealedgraph{1,r}{1,i}.Edges.Weight,nn,nn);
end
    

for i=1:size(Adiacencyrevealedgraph{1,r},2) %substitute zeros with positive numbers (Perron-Frobenius Theorem)
Adiacencyrevealedgraph{1,r}{1,i}(~Adiacencyrevealedgraph{1,r}{1,i}) = 0.001;
end

for i=1:size(Adiacencyrevealedgraph{1,r},2) %substitute sparse matrices with full matrices
Adiacencyrevealedgraph{1,r}{1,i}= full(Adiacencyrevealedgraph{1,r}{1,i});
end
end

Centrality = cell(1,Ns);
for r=1:Ns
Centrality{1,r} = cell(1,Ch);
end
for r=1:Ns
for i = 1:Ch
   Centrality{1,r}{1,i} = eigencentrality(Adiacencyrevealedgraph{1,r}{1,i});
end 
end
for r=1:Ns
for i = 1:Ch
     for j=1:size(Centrality{1,r}{1,1},1)
    if Centrality{1,r}{1,i}(j,1) < 0
     Centrality{1,r}{1,i}(j,1) = Centrality{1,r}{1,i}(j,1)*-1;
    end 
    end
end
end

eigensol = cell(1,Ns);
for r=1:Ns
eigensol{1,r} = zeros(size(S,2),size(S,2),Ch);
end

for r=1:Ns
for z = 1:Ch
for i = 1:size(S,2)
    for j = 1:size(S,2)
    if Centrality{1,r}{1,z}(i,1) - Centrality{1,r}{1,z}(j,1)>0.0001
        eigensol{1,r}(i,j,z) = 1;
    elseif abs(Centrality{1,r}{1,z}(i,1) - Centrality{1,r}{1,z}(j,1))<0.0001
        eigensol{1,r}(i,j,z) = 1;
        eigensol{1,r}(j,i,z) = 1;         
    end
    end
end
end
end

for r=1:Ns
for z=1:Ch
for i = 1:size(S,2)
    for j= 1:size(S,2)
        if i==j
            eigensol{1,r}(i,j,z) = 0;
        else
        end
    end
end
end
end

clear Adiacencyrevealedgraph Centrality Revealedgraph Domain domains

%% Transitive Core

trcore = cell(1,Ns);

for s=1:Ns
trcore{1,s} = zeros(size(S,2),size(S,2),Ch);
end
for s=1:Ns
for z=1:Ch
    if countrevsol{1,s}(1,2,z) >= countrevsol{1,s}(2,1,z) && countrevsol{1,s}(3,2,z) >= countrevsol{1,s}(3,1,z) && countrevsol{1,s}(1,3,z) >= countrevsol{1,s}(2,3,z) && countrevsol{1,s}(4,2,z) >= countrevsol{1,s}(4,1,z) && countrevsol{1,s}(1,4,z) >= countrevsol{1,s}(2,4,z)
    trcore{1,s}(1,2,z)=1;
    end
if countrevsol{1,s}(1,3,z) >= countrevsol{1,s}(3,1,z) && countrevsol{1,s}(2,3,z) >= countrevsol{1,s}(2,1,z) && countrevsol{1,s}(1,2,z) >= countrevsol{1,s}(3,2,z) && countrevsol{1,s}(4,3,z) >= countrevsol{1,s}(4,1,z) && countrevsol{1,s}(1,4,z) >= countrevsol{1,s}(3,4,z)
    trcore{1,s}(1,3,z)=1;
end    
if countrevsol{1,s}(1,4,z) >= countrevsol{1,s}(4,1,z) && countrevsol{1,s}(2,4,z) >= countrevsol{1,s}(2,1,z) && countrevsol{1,s}(1,2,z) >= countrevsol{1,s}(4,2,z) && countrevsol{1,s}(3,4,z) >= countrevsol{1,s}(3,1,z) && countrevsol{1,s}(1,3,z) >= countrevsol{1,s}(4,3,z)
    trcore{1,s}(1,4,z)=1;
 end  
 if countrevsol{1,s}(2,1,z) >= countrevsol{1,s}(1,2,z) && countrevsol{1,s}(3,1,z) >= countrevsol{1,s}(3,2,z) && countrevsol{1,s}(2,3,z) >= countrevsol{1,s}(1,3,z) && countrevsol{1,s}(4,1,z) >= countrevsol{1,s}(4,2,z) && countrevsol{1,s}(2,4,z) >= countrevsol{1,s}(1,4,z)
    trcore{1,s}(2,1,z)=1;
end    
if countrevsol{1,s}(2,3,z) >= countrevsol{1,s}(3,2,z) && countrevsol{1,s}(1,3,z) >= countrevsol{1,s}(1,2,z) && countrevsol{1,s}(2,1,z) >= countrevsol{1,s}(3,1,z) && countrevsol{1,s}(4,3,z) >= countrevsol{1,s}(4,2,z) && countrevsol{1,s}(2,4,z) >= countrevsol{1,s}(3,4,z)
    trcore{1,s}(2,3,z)=1;
 end  
 if countrevsol{1,s}(2,4,z) >= countrevsol{1,s}(4,2,z) && countrevsol{1,s}(1,4,z) >= countrevsol{1,s}(1,2,z) && countrevsol{1,s}(2,1,z) >= countrevsol{1,s}(4,1,z) && countrevsol{1,s}(3,4,z) >= countrevsol{1,s}(3,2,z) && countrevsol{1,s}(2,3,z) >= countrevsol{1,s}(4,3,z)
    trcore{1,s}(2,4,z)=1;
end    
if countrevsol{1,s}(3,1,z) >= countrevsol{1,s}(1,3,z) && countrevsol{1,s}(2,1,z) >= countrevsol{1,s}(2,3,z) && countrevsol{1,s}(3,2,z) >= countrevsol{1,s}(1,2,z) && countrevsol{1,s}(4,1,z) >= countrevsol{1,s}(4,3,z) && countrevsol{1,s}(3,4,z) >= countrevsol{1,s}(1,4,z)
    trcore{1,s}(3,1,z)=1;
 end  
 if countrevsol{1,s}(3,2,z) >= countrevsol{1,s}(2,3,z) && countrevsol{1,s}(1,2,z) >= countrevsol{1,s}(1,3,z) && countrevsol{1,s}(3,1,z) >= countrevsol{1,s}(2,1,z) && countrevsol{1,s}(4,2,z) >= countrevsol{1,s}(4,3,z) && countrevsol{1,s}(3,4,z) >= countrevsol{1,s}(2,4,z)
    trcore{1,s}(3,2,z)=1;
end    
if countrevsol{1,s}(3,4,z) >= countrevsol{1,s}(4,3,z) && countrevsol{1,s}(1,4,z) >= countrevsol{1,s}(1,3,z) && countrevsol{1,s}(3,1,z) >= countrevsol{1,s}(4,1,z) && countrevsol{1,s}(2,4,z) >= countrevsol{1,s}(2,3,z) && countrevsol{1,s}(3,2,z) >= countrevsol{1,s}(4,2,z)
    trcore{1,s}(3,4,z)=1;
 end  
 if countrevsol{1,s}(4,1,z) >= countrevsol{1,s}(1,4,z) && countrevsol{1,s}(2,1,z) >= countrevsol{1,s}(2,4,z) && countrevsol{1,s}(4,2,z) >= countrevsol{1,s}(1,2,z) && countrevsol{1,s}(3,1,z) >= countrevsol{1,s}(3,4,z) && countrevsol{1,s}(4,3,z) >= countrevsol{1,s}(1,3,z)
    trcore{1,s}(4,1,z)=1;
end    
if countrevsol{1,s}(4,2,z) >= countrevsol{1,s}(2,4,z) && countrevsol{1,s}(1,2,z) >= countrevsol{1,s}(1,4,z) && countrevsol{1,s}(4,1,z) >= countrevsol{1,s}(2,1,z) && countrevsol{1,s}(3,2,z) >= countrevsol{1,s}(3,4,z) && countrevsol{1,s}(4,3,z) >= countrevsol{1,s}(2,3,z)
    trcore{1,s}(4,2,z)=1;
 end  
 if countrevsol{1,s}(4,3,z) >= countrevsol{1,s}(3,4,z) && countrevsol{1,s}(1,3,z) >= countrevsol{1,s}(1,4,z) && countrevsol{1,s}(4,1,z) >= countrevsol{1,s}(3,1,z) && countrevsol{1,s}(2,3,z) >= countrevsol{1,s}(2,4,z) && countrevsol{1,s}(4,2,z) >= countrevsol{1,s}(3,2,z)
    trcore{1,s}(4,3,z)=1;
end
end
end

for s = 1:Ns
for z=1:Ch
   for i=1:size(S,2)
       for j=1:size(S,2)
           if trcore{1,s}(i,j,z)==0 && trcore{1,s}(j,i,z)==0 && i~=j
               trcore{1,s}(i,j,z)=1;
               trcore{1,s}(j,i,z)=1;
           end
       end
   end
end
end
save('C:\Users\tew394\Documents\Continuity of methods\solutions.mat','countrevsol','countsol','eigensol','trcore','BernRang')

clear countsol countrev countrevsol eigensol trcore BernRang

%% Minimum Swaps

weights = cell(1,Ns);
for s=1:Ns
weights{1,s} = zeros(Ch,Rel);
end

k = cell(1,Ns);
l = cell(1,Ns);

for s=1:Ns
for i=1:Ch %%%weights is the vector of weights for the digraph with nodes [s,t] 
    k{1,s}=sum(xRy{1,s},2);
    l{1,s}=sum(yRx{1,s},2);
    if k{1,s}(i,1) - l{1,s}(i,1) > 0
       weights{1,s}(i,1) = k{1,s}(i,1) - l{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) < 0
       weights{1,s}(i,2) = l{1,s}(i,1)-k{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) == 0   
       weights{1,s}(i,1) = 0;
       weights{1,s}(i,2) = 0;
    end
end
end
for s=1:Ns
for i=1:Ch
    k{1,s}=sum(xRz{1,s},2);
    l{1,s}=sum(zRx{1,s},2);
    if k{1,s}(i,1) - l{1,s}(i,1) > 0
       weights{1,s}(i,3) = k{1,s}(i,1) - l{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) < 0
       weights{1,s}(i,4) = l{1,s}(i,1)-k{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) == 0
       weights{1,s}(i,3) = 0;
       weights{1,s}(i,4) = 0;
    end
end
end
for s=1:Ns
for i=1:Ch
    k{1,s}=sum(yRz{1,s},2);
    l{1,s}=sum(zRy{1,s},2);
    if k{1,s}(i,1) - l{1,s}(i,1) > 0
       weights{1,s}(i,5) = k{1,s}(i,1) - l{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) < 0
       weights{1,s}(i,6) = l{1,s}(i,1)-k{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) == 0
       weights{1,s}(i,5) = 0;
       weights{1,s}(i,6) = 0;
    end
end
end
for s=1:Ns
for i=1:Ch
    k{1,s}=sum(xRw{1,s},2);
    l{1,s}=sum(wRx{1,s},2);
    if k{1,s}(i,1) - l{1,s}(i,1) > 0
       weights{1,s}(i,7) = k{1,s}(i,1) - l{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) < 0
       weights{1,s}(i,8) = l{1,s}(i,1)-k{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) == 0
       weights{1,s}(i,7) = 0;
       weights{1,s}(i,8) = 0;
    end
end
end
for s=1:Ns
for i=1:Ch
    k{1,s}=sum(yRw{1,s},2);
    l{1,s}=sum(wRy{1,s},2);
    if k{1,s}(i,1) - l{1,s}(i,1) > 0
       weights{1,s}(i,9) = k{1,s}(i,1) - l{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) < 0
       weights{1,s}(i,10) = l{1,s}(i,1)-k{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) == 0
       weights{1,s}(i,9) = 0;
       weights{1,s}(i,10) = 0;
    end
end
end
for s=1:Ns
for i=1:Ch
    k{1,s}=sum(zRw{1,s},2);
    l{1,s}=sum(wRz{1,s},2);
    if k{1,s}(i,1) - l{1,s}(i,1) > 0
       weights{1,s}(i,11) = k{1,s}(i,1) - l{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) < 0
       weights{1,s}(i,12) = l{1,s}(i,1)-k{1,s}(i,1);
    elseif k{1,s}(i,1)-l{1,s}(i,1) == 0
       weights{1,s}(i,11) = 0;
       weights{1,s}(i,12) = 0;
    end
end
end

s=[1,2,1,3,2,3,1,4,2,4,3,4];
t=[2,1,3,1,3,2,4,1,4,2,4,3];

g = cell(1,Ns);
for r=1:Ns
g{1,r}=cell(Ch,1);
end

for r=1:Ns
for i=1:Ch
g{1,r}{i,1}=digraph(s,t,weights{1,r}(i,:));
end
end

clear k l

for r=1:Ns
for i=1:Ch
    for j=1:Rel
        if weights{1,r}(i,j) == 0
            g{1,r}{i,1} = rmedge(g{1,r}{i,1},s(j),t(j));
        else
        end
    end
end
end

clear xRy xRz xRw yRx yRz yRw zRx zRy zRw wRx wRy wRz

sol_ac=cell(1,Ns);
sol_cy=cell(1,Ns);

for r=1:Ns
sol_ac{1,r}=cell(Ch,1);
sol_cy{1,r}=cell(Ch,1);
end

for r=1:Ns
for i=1:Ch
    if isdag(g{1,r}{i,1})==1
        sol_ac{1,r}{i,1} = g{1,r}{i,1};
    else
        sol_cy{1,r}{i,1} = g{1,r}{i,1};
    end
end
end

G=cell(1,Ns);
A=cell(1,Ns);
b=cell(1,Ns);

for r=1:Ns
G{1,r}=cell(Ch,1);
A{1,r}=cell(Ch,1);
b{1,r}=cell(Ch,1);
end

for r=1:Ns
for o=1:Ch
    if isempty(sol_cy{1,r}{o,1}) == 0
    it=0;
    for l=1:Rel
        G{1,r}{o,1}= rmedge(sol_cy{1,r}{o,1},s(l),t(l)); % I remove the first edge
        it=it+1;
        if isdag(G{1,r}{o,1})==1
            nn = numnodes(G{1,r}{o,1});
            [p,q] = findedge(G{1,r}{o,1});
            A{1,r}{o,1}{1,it} = sparse(p,q,G{1,r}{o,1}.Edges.Weight,nn,nn);
            b{1,r}{o,1}(1,it)=sum(sum(A{1,r}{o,1}{1,it})); % sum the weights of edges
        else 
        end
    end          
    end
end
end
%%%%%%%%%%%%% from here
for r=1:Ns
for i=1:Ch
    if isempty(A{1,r}{i,1})==1
        nn = numnodes(sol_ac{1,r}{i,1});
       [p,q] = findedge(sol_ac{1,r}{i,1});
        A{1,r}{i,1}{1,1} = sparse(p,q,sol_ac{1,r}{i,1}.Edges.Weight,nn,nn);
        b{1,r}{i,1}(1,1)=sum(sum(A{1,r}{i,1}{1,1}));
    else
    end
end
end



% continue from here!!

% for r=1:Ns
% for i=1:Ch
%     if isempty(A{1,r}{i,1})==1
%         nn = numnodes(sol_ac{1,r}{o,1});
%        [p,q] = findedge(sol_ac{1,r}{o,1});
%         A{1,r}{i,1} = sparse(p,q,sol_ac{1,r}{o,1}.Edges.Weight,nn,nn);
%     else
%     end
% end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% above here
% 
% G=cell(1,Ns);
% A=cell(1,Ns);
% B=cell(1,Ns);
% c=cell(1,Ns);
% b=cell(1,Ns);
% H=cell(1,Ns);
% C=cell(1,Ns);
% d=cell(1,Ns);
% F=cell(1,Ns);
% 
% for r=1:Ns
% G{1,r}=cell(Ch,1);
% A{1,r}=cell(Ch,1);
% B{1,r}=cell(Ch,1);
% c{1,r}=cell(Ch,1);
% b{1,r}=cell(Ch,1);
% H{1,r}=cell(Ch,1);
% C{1,r}=cell(Ch,1);
% d{1,r}=cell(Ch,1);
% F{1,r}=cell(Ch,1);
% end
% 
% 
% 
% for r=1:Ns
% for o=1:size(g{1,r},1)
% it=0;
% jt=0;
% kt=0;
% for i = 1:Rel
% G{1,r}{o,1}= rmedge(g{1,r}{o,1},s(i),t(i));
% it=it+1;
%     if isdag(G{1,r}{o,1}) == 1
%       nn = numnodes(G{1,r}{o,1});
%      [p,q] = findedge(G{1,r}{o,1});
%      A{1,r}{o,1}{1,it} = sparse(p,q,G{1,r}{o,1}.Edges.Weight,nn,nn);
%     b{1,r}{o,1}(1,it)=sum(sum(A{1,r}{o,1}{1,it}));
%      
%     elseif isdag(G{1,r}{o,1}) == 0
%        for j=1:Rel
%        if j ~=i
%        F{1,r}{o,1} = rmedge(G{1,r}{o,1},s(j),t(j));
%        jt=jt+1;
%             
%        if isdag(F{1,r}{o,1}) == 1
%        nn = numnodes(F{1,r}{o,1});
%        [p,q] = findedge(F{1,r}{o,1});
%        B{1,r}{o,1}{1,jt} = sparse(p,q,F{1,r}{o,1}.Edges.Weight,nn,nn);
%        c{1,r}{o,1}(1,jt)=sum(sum(B{1,r}{o,1}{1,jt}));
%         
%        elseif isdag(F{1,r}{o,1}) == 0
%             for u=1:Rel 
%                 if u~=j && u~=i
%                    H{1,r}{o,1} = rmedge(F{1,r}{o,1},s(u),t(u));
%                    kt=kt+1;
%         
%                     if isdag(H{1,r}{o,1}) == 1
%                        nn = numnodes(H{1,r}{o,1});
%                        [p,q] = findedge(H{1,r}{o,1});
%                        C{1,r}{o,1}{1,kt} = sparse(p,q,H{1,r}{o,1}.Edges.Weight,nn,nn);
%                        d{1,r}{o,1}(1,kt)=sum(sum(C{1,r}{o,1}{1,kt}));
%       
%                     end
%                 end
%             end
%        end
%        end
%        end
%     end
% end
% end
% end


E=cell(1,Ns);
R=cell(1,Ns);
kk=cell(1,Ns);
RESULT=cell(1,Ns);
ADJ=cell(1,Ns);
for s=1:Ns

E{1,s}=cell(Ch,1);
R{1,s}=cell(Ch,1);
kk{1,s}=cell(Ch,1);
RESULT{1,s}=cell(Ch,1);
ADJ{1,s}=cell(Ch,1);
end

a = cell(1,Ns);
for r=1:Ns
    a{1,r} = zeros(Ch,1);
end

for r=1:Ns
for o=1:Ch
a{1,r}(o,1)=max(b{1,r}{o,1});
end
end


for r=1:Ns
for o=1:Ch
    for i=1:size(A{1,r}{o,1},2)
    E{1,r}{o,1}{1,i} = full(A{1,r}{o,1}{1,i});
    end
end
end

for r=1:Ns
for o=1:Ch
for i=1:size(E{1,r}{o,1},2)
    R{1,r}{o,1}(1,i) = sum(sum(E{1,r}{o,1}{1,i}));
end
end
end

for r=1:Ns
for o=1:Ch
R{1,r}{o,1}(R{1,r}{o,1}<a{1,r}(o,1)) = 0 ;
end
end

for r=1:Ns
for o=1:Ch
kk{1,r}{o,1}=find(R{1,r}{o,1});
end
end

for r=1:Ns
for o=1:Ch
for i=1:size(kk{1,r}{o,1},2)
    RESULT{1,r}{o,1}{1,i} = digraph(A{1,r}{o,1}{1,kk{1,r}{o,1}(1,i)});
end
end
end


for r=1:Ns
for o=1:Ch
for i=1:size(RESULT{1,r}{o,1},2)
    RESULT{1,r}{o,1}{1,i} = transclosure(RESULT{1,r}{o,1}{1,i});
end
end
end

for r=1:Ns
for o=1:Ch
for i=1:size(RESULT{1,r}{o,1},2)
    ADJ{1,r}{o,1}{1,i} = adjacency(RESULT{1,r}{o,1}{1,i});
end 
end
end

for r=1:Ns
for o=1:Ch
ind = true(1,numel(ADJ{1,r}{o,1})); %// true indicates non-duplicate. Initiallization
for ii = 1:numel(ADJ{1,r}{o,1})-1
    for jj = ii+1:numel(ADJ{1,r}{o,1})
        if isequal(ADJ{1,r}{o,1}{ii}, ADJ{1,r}{o,1}{jj})
            ind(jj) = false; %// mark as duplicate
        end
    end
end
ADJ{1,r}{o,1} = ADJ{1,r}{o,1}(ind);
end
end
minswaps = cell(1,Ns);

for r=1:Ns
for o=1:Ch
    for i = 1:size(ADJ{1,r}{o,1},2)
    minswaps{1,r}{o,1}(:,:,i) = full(ADJ{1,r}{o,1}{1,i});
    end
end
end

for r=1:Ns
for o=1:Ch
    if size(minswaps{1,r}{o,1},2) > 1
        minswaps{1,r}{o,1} = sum(minswaps{1,r}{o,1},3);
    end
end
end


for r=1:Ns
for o=1:Ch
    for i = 1:size(S,2)
        for j = 1:size(S,2)
            if minswaps{1,r}{o,1}(i,j) == size(ADJ{1,r}{o,1},2)
                 minswaps{1,r}{o,1}(i,j) = 1;
            else
                minswaps{1,r}{o,1}(i,j) = 0;
            end
        end
    end
end
end

minswapssol = cell(1,Ns);
for r=1:Ns
minswapssol{1,r} = zeros(size(S,2),size(S,2),Ch);
end

for r=1:Ns
for i=1:Ch
minswapssol{1,r}(:,:,i) = minswaps{1,r}{i,1};
end
end

for r=1:Ns
for z=1:Ch
    for i=1:size(S,2)
    for j=1:size(S,2)
       if minswapssol{1,r}(i,j,z) == 0 && minswapssol{1,r}(j,i,z) == 0 && i~=j
          minswapssol{1,r}(i,j,z) = 1;
          minswapssol{1,r}(j,i,z) = 1;
       end
    end
    end
end
end
save('C:\Users\tew394\Documents\Continuity of methods\minswapssol.mat','minswapssol')

%% compare the rows to estimate the degree of continuity


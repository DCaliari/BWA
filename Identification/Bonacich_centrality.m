clear
clc

%% Eigenvector centrality

S = {'x','y','z','w'};
outdegree = {'x','x','x','y','y','y','z','z','z','w','w','w'};
indegree = {'y','z','w','x','z','w','x','y','w','x','y','z'};

Revealed = [2,3,4,2,1,3,4,5,2,1,3,0];

Revealedgraph = digraph(outdegree,indegree,Revealed,S);

nn = numnodes(Revealedgraph);
[s,t]=findedge(Revealedgraph);
Adiacencyrevealedgraph = sparse(s,t,Revealedgraph.Edges.Weight,nn,nn);
    

Adiacencyrevealedgraph(~Adiacencyrevealedgraph) = 0.001;
Adiacencyrevealedgraph = full(Adiacencyrevealedgraph);
Centrality = eigencentrality(Adiacencyrevealedgraph);

for j=1:size(Centrality,1)
    if Centrality(j,1) < 0
     Centrality(j,1) = Centrality(j,1)*-1;
    end 
end

for i = 1:size(S,2)
    for j = 1:size(S,2)
    if Centrality(i,1) > Centrality(j,1)
        eigensol(i,j) = 1;
    elseif Centrality(i,1) == Centrality(j,1)
        eigensol(i,j) = 1;
        eigensol(j,i) = 1;         
    end
    end
end

for i = 1:size(S,2)
    for j= 1:size(S,2)
        if i==j
            eigensol(i,j) = 0;
        else
        end
    end
end

%% Bonacich centrality
e = (1./eig(Adiacencyrevealedgraph));
beta=0:0.01:e(1);
for i=1:size(beta,2)
bonacich(:,i)=inv(eye(4)-beta(i)*Adiacencyrevealedgraph)*ones(4,1)
end
for i=1:size(beta,2)
bonacich(:,i)=bonacich(:,i)./sum(bonacich(:,i));
end

e_cent=inv(eye(4)-(e(1))*Adiacencyrevealedgraph)*ones(4,1);
e_cent=e_cent./sum(e_cent);
test = (Centrality./sum(Centrality)-e_cent);



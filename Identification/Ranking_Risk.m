%%%%%%%%% Import the Reported Individual rankings %%%%%%%%%%%

[numbers, RiskRanking, everything] = xlsread('C:\Users\tew394\Dropbox\JOB MARKET PAPER\Codes\Identification\Ranking DATA','Risk Ranking','A1:D145');

Risk_Ranking = zeros(4,4,size(RiskRanking,1));

%%%%%%%%% Transform the cell matrix RiskRanking %%%%%%%%%%%%%
%%%%%%%%% into the adjacency 0-1 matrix Risk_Ranking %%%%%%%%

for i = 1:size(RiskRanking,1)
    if RiskRanking{i,1} == 'a' %%% Focus on best element 'a'
        Risk_Ranking(1,2,i)=1;
        Risk_Ranking(1,3,i)=1;
        Risk_Ranking(1,4,i)=1;
        if RiskRanking{i,2}=='b' %%% Second best element 'b'
            Risk_Ranking(2,3,i)=1;
            Risk_Ranking(2,4,i)=1;
            if RiskRanking{i,3} == 'c' %%% Third best element 'c'
                Risk_Ranking(3,4,i)=1;
            end
            if RiskRanking{i,3} == 'd' %%% Third best element 'd'
                Risk_Ranking(4,3,i)=1;
            end
        end
        if RiskRanking{i,2}=='c'
            Risk_Ranking(3,2,i)=1;
            Risk_Ranking(3,4,i)=1;
            if RiskRanking{i,3}=='b'
                Risk_Ranking(2,4,i)=1;
            end
            if RiskRanking{i,3}=='d'
                Risk_Ranking(4,2,i)=1;
            end
        end
        if RiskRanking{i,2}=='d'
            Risk_Ranking(4,2,i)=1;
            Risk_Ranking(4,3,i)=1;
            if RiskRanking{i,3}=='b'
                Risk_Ranking(2,3,i)=1;
            end
            if RiskRanking{i,3}=='c'
                Risk_Ranking(3,2,i)=1;
            end 
        end
    end
end

for i = 1:size(RiskRanking,1)
    if RiskRanking{i,1} == 'b'
        Risk_Ranking(2,1,i)=1;
        Risk_Ranking(2,3,i)=1;
        Risk_Ranking(2,4,i)=1;
        if RiskRanking{i,2}=='a'
            Risk_Ranking(1,3,i)=1;
            Risk_Ranking(1,4,i)=1;
            if RiskRanking{i,3} == 'c'
                Risk_Ranking(3,4,i)=1;
            end
            if RiskRanking{i,3} == 'd'
                Risk_Ranking(4,3,i)=1;
            end
        end
        if RiskRanking{i,2}=='c'
            Risk_Ranking(3,1,i)=1;
            Risk_Ranking(3,4,i)=1;
            if RiskRanking{i,3}=='a'
                Risk_Ranking(1,4,i)=1;
            end
            if RiskRanking{i,3}=='d'
                Risk_Ranking(4,1,i)=1;
            end
        end
        if RiskRanking{i,2}=='d'
            Risk_Ranking(4,1,i)=1;
            Risk_Ranking(4,3,i)=1;
            if RiskRanking{i,3}=='a'
                Risk_Ranking(1,3,i)=1;
            end
            if RiskRanking{i,3}=='c'
                Risk_Ranking(3,1,i)=1;
            end
        end
    end
end


for i = 1:size(RiskRanking,1)
    if RiskRanking{i,1} == 'c'
        Risk_Ranking(3,1,i)=1;
        Risk_Ranking(3,2,i)=1;
        Risk_Ranking(3,4,i)=1;
        if RiskRanking{i,2}=='a'
            Risk_Ranking(1,2,i)=1;
            Risk_Ranking(1,4,i)=1;
            if RiskRanking{i,3} == 'b'
                Risk_Ranking(2,4,i)=1;
            end
            if RiskRanking{i,3} == 'd'
                Risk_Ranking(4,2,i)=1;
            end
        end
        if RiskRanking{i,2}=='b'
            Risk_Ranking(2,1,i)=1;
            Risk_Ranking(2,4,i)=1;
            if RiskRanking{i,3}=='a'
                Risk_Ranking(1,4,i)=1;
            end
            if RiskRanking{i,3}=='d'
                Risk_Ranking(4,1,i)=1;
            end
        end
        if RiskRanking{i,2}=='d'
            Risk_Ranking(4,1,i)=1;
            Risk_Ranking(4,2,i)=1;
            if RiskRanking{i,3}=='a'
                Risk_Ranking(1,2,i)=1;
            end
            if RiskRanking{i,3}=='b'
                Risk_Ranking(2,1,i)=1;
            end
        end
    end
end


for i = 1:size(RiskRanking,1)
    if RiskRanking{i,1} == 'd'
        Risk_Ranking(4,1,i)=1;
        Risk_Ranking(4,2,i)=1;
        Risk_Ranking(4,3,i)=1;
        if RiskRanking{i,2}=='a'
            Risk_Ranking(1,2,i)=1;
            Risk_Ranking(1,3,i)=1;
            if RiskRanking{i,3} == 'b'
                Risk_Ranking(2,3,i)=1;
            end
            if RiskRanking{i,3} == 'c'
                Risk_Ranking(3,2,i)=1;
            end
        end
        if RiskRanking{i,2}=='b'
            Risk_Ranking(2,1,i)=1;
            Risk_Ranking(2,3,i)=1;
            if RiskRanking{i,3}=='a'
                Risk_Ranking(1,3,i)=1;
            end
            if RiskRanking{i,3}=='c'
                Risk_Ranking(3,1,i)=1;
            end
        end
        if RiskRanking{i,2}=='c'
            Risk_Ranking(3,1,i)=1;
            Risk_Ranking(3,2,i)=1;
            if RiskRanking{i,3}=='a'
                Risk_Ranking(1,2,i)=1;
            end
            if RiskRanking{i,3}=='b'
                Risk_Ranking(2,1,i)=1;
            end                
        end
    end
end
save('C:\Users\daniele\Dropbox\JOB MARKET PAPER\Codes\Identification\Risk Ranking','Risk_Ranking');


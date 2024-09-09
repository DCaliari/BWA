%%%%%%%%% Import the Reported Individual rankings %%%%%%%%%%%

[numbers, TimeRanking, everything] = xlsread('C:\Users\tew394\Dropbox\JOB MARKET PAPER\Codes\Identification\Ranking DATA','Time Ranking','A1:D145');

Time_Ranking = zeros(4,4,size(TimeRanking,1));

%%%%%%%%% Transform the cell matrix TimeRanking %%%%%%%%%%%%%
%%%%%%%%% into the adjacency 0-1 matrix Time_Ranking %%%%%%%%

for i = 1:size(TimeRanking,1)
    if TimeRanking{i,1} == 'x' %%% Focus on best element 'x'
        Time_Ranking(1,2,i)=1;
        Time_Ranking(1,3,i)=1;
        Time_Ranking(1,4,i)=1;
        if TimeRanking{i,2}=='y' %%% Second best element 'y'
            Time_Ranking(2,3,i)=1;
            Time_Ranking(2,4,i)=1;
            if TimeRanking{i,3} == 'z' %%% Third best element 'z'
                Time_Ranking(3,4,i)=1;
            end
            if TimeRanking{i,3} == 'w' %%% Third best element 'w'
                Time_Ranking(4,3,i)=1;
            end
        end
        if TimeRanking{i,2}=='z'
            Time_Ranking(3,2,i)=1;
            Time_Ranking(3,4,i)=1;
            if TimeRanking{i,3}=='y'
                Time_Ranking(2,4,i)=1;
            end
            if TimeRanking{i,3}=='w'
                Time_Ranking(4,2,i)=1;
            end
        end
        if TimeRanking{i,2}=='w'
            Time_Ranking(4,2,i)=1;
            Time_Ranking(4,3,i)=1;
            if TimeRanking{i,3}=='y'
                Time_Ranking(2,3,i)=1;
            end
            if TimeRanking{i,3}=='z'
                Time_Ranking(3,2,i)=1;
            end 
        end
    end
end

for i = 1:size(TimeRanking,1)
    if TimeRanking{i,1} == 'y'
        Time_Ranking(2,1,i)=1;
        Time_Ranking(2,3,i)=1;
        Time_Ranking(2,4,i)=1;
        if TimeRanking{i,2}=='x'
            Time_Ranking(1,3,i)=1;
            Time_Ranking(1,4,i)=1;
            if TimeRanking{i,3} == 'z'
                Time_Ranking(3,4,i)=1;
            end
            if TimeRanking{i,3} == 'w'
                Time_Ranking(4,3,i)=1;
            end
        end
        if TimeRanking{i,2}=='z'
            Time_Ranking(3,1,i)=1;
            Time_Ranking(3,4,i)=1;
            if TimeRanking{i,3}=='x'
                Time_Ranking(1,4,i)=1;
            end
            if TimeRanking{i,3}=='w'
                Time_Ranking(4,1,i)=1;
            end
        end
        if TimeRanking{i,2}=='w'
            Time_Ranking(4,1,i)=1;
            Time_Ranking(4,3,i)=1;
            if TimeRanking{i,3}=='x'
                Time_Ranking(1,3,i)=1;
            end
            if TimeRanking{i,3}=='z'
                Time_Ranking(3,1,i)=1;
            end
        end
    end
end


for i = 1:size(TimeRanking,1)
    if TimeRanking{i,1} == 'z'
        Time_Ranking(3,1,i)=1;
        Time_Ranking(3,2,i)=1;
        Time_Ranking(3,4,i)=1;
        if TimeRanking{i,2}=='x'
            Time_Ranking(1,2,i)=1;
            Time_Ranking(1,4,i)=1;
            if TimeRanking{i,3} == 'y'
                Time_Ranking(2,4,i)=1;
            end
            if TimeRanking{i,3} == 'w'
                Time_Ranking(4,2,i)=1;
            end
        end
        if TimeRanking{i,2}=='y'
            Time_Ranking(2,1,i)=1;
            Time_Ranking(2,4,i)=1;
            if TimeRanking{i,3}=='x'
                Time_Ranking(1,4,i)=1;
            end
            if TimeRanking{i,3}=='w'
                Time_Ranking(4,1,i)=1;
            end
        end
        if TimeRanking{i,2}=='w'
            Time_Ranking(4,1,i)=1;
            Time_Ranking(4,2,i)=1;
            if TimeRanking{i,3}=='x'
                Time_Ranking(1,2,i)=1;
            end
            if TimeRanking{i,3}=='y'
                Time_Ranking(2,1,i)=1;
            end
        end
    end
end


for i = 1:size(TimeRanking,1)
    if TimeRanking{i,1} == 'w'
        Time_Ranking(4,1,i)=1;
        Time_Ranking(4,2,i)=1;
        Time_Ranking(4,3,i)=1;
        if TimeRanking{i,2}=='x'
            Time_Ranking(1,2,i)=1;
            Time_Ranking(1,3,i)=1;
            if TimeRanking{i,3} == 'y'
                Time_Ranking(2,3,i)=1;
            end
            if TimeRanking{i,3} == 'z'
                Time_Ranking(3,2,i)=1;
            end
        end
        if TimeRanking{i,2}=='y'
            Time_Ranking(2,1,i)=1;
            Time_Ranking(2,3,i)=1;
            if TimeRanking{i,3}=='x'
                Time_Ranking(1,3,i)=1;
            end
            if TimeRanking{i,3}=='z'
                Time_Ranking(3,1,i)=1;
            end
        end
        if TimeRanking{i,2}=='z'
            Time_Ranking(3,1,i)=1;
            Time_Ranking(3,2,i)=1;
            if TimeRanking{i,3}=='x'
                Time_Ranking(1,2,i)=1;
            end
            if TimeRanking{i,3}=='y'
                Time_Ranking(2,1,i)=1;
            end                
        end
    end
end

save('C:\Users\daniele\Dropbox\JOB MARKET PAPER\Codes\Identification\Time Ranking','Time_Ranking');



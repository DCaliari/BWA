clear

S = {'x','y','z','w','mx','my','mz','mw','ix','iy','iz','iw','neu1','neu2'}; %%%create a set of alternatives

outdegree = {'x','x','x','y','y','y','z','z','z','w','w','w','x','x','x','x','y','y','y','y','z','z','z','z','w','w','w','w','mx','mx','mx','mx','my','my','my','my','mz','mz','mz','mz','mw','mw','mw','mw','x','x','x','x','y','y','y','y','z','z','z','z','w','w','w','w','ix','ix','ix','ix','iy','iy','iy','iy','iz','iz','iz','iz','iw','iw','iw','iw','ix','iy','ix','iz','ix','iw','iy','iz','iy','iw','iz','iw','mx','my','mx','mz','mx','mw','my','mz','my','mw','mz','mw','neu1','neu1','neu1','neu1','x','y','z','w','neu1','neu1','neu1','neu1','mx','my','mz','mw','neu1','neu1','neu1','neu1','ix','iy','iz','iw','neu2','neu2','neu2','neu2','x','y','z','w','neu2','neu2','neu2','neu2','mx','my','mz','mw','neu2','neu2','neu2','neu2','ix','iy','iz','iw','mx','mx','mx','mx','ix','iy','iz','iw','my','my','my','my','ix','iy','iz','iw','mz','mz','mz','mz','ix','iy','iz','iw','mw','mw','mw','mw','ix','iy','iz','iw','neu1','neu2'}; %%%outdegree and indegree for digraphs of binary relations
 
indegree = {'y','z','w','x','z','w','x','y','w','x','y','z','mx','my','mz','mw','mx','my','mz','mw','mx','my','mz','mw','mx','my','mz','mw','x','y','z','w','x','y','z','w','x','y','z','w','x','y','z','w','ix','iy','iz','iw','ix','iy','iz','iw','ix','iy','iz','iw','ix','iy','iz','iw','x','x','x','x','y','y','y','y','z','z','z','z','w','w','w','w','iy','ix','iz','ix','iw','ix','iz','iy','iw','iy','iw','iz','my','mx','mz','mx','mw','mx','mz','my','mw','my','mw','mz','x','y','z','w','neu1','neu1','neu1','neu1','mx','my','mz','mw','neu1','neu1','neu1','neu1','ix','iy','iz','iw','neu1','neu1','neu1','neu1','x','y','z','w','neu2','neu2','neu2','neu2','mx','my','mz','mw','neu2','neu2','neu2','neu2','ix','iy','iz','iw','neu2','neu2','neu2','neu2','ix','iy','iz','iw','mx','mx','mx','mx','ix','iy','iz','iw','my','my','my','my','ix','iy','iz','iw','mz','mz','mz','mz','ix','iy','iz','iw','mw','mw','mw','mw','neu2','neu1'};


%%%load experiment choices 

[numbers, choiceDelayed, everything] = xlsread('Dataset Creation - Sep','Delayed Plans Choices','A2:Y146');

choice_D_MAIN = choiceDelayed(:,1:11);

choice_D_Binary = choiceDelayed(:,1:6);

choice_D_Ternary = choiceDelayed(:,7:10);

choice_D_BinTer = choiceDelayed(:,1:10);

choice_D_BinQuat = choiceDelayed(:,[1:6 11]);

choice_D_TernQuat = choiceDelayed(:,7:11);

choice_D_Big = choiceDelayed(:,12:25);

choice_D_NoBinary = choiceDelayed(:,7:25);

choice_FirstOrder = choiceDelayed(:,[1:3 7 10:11 13:14 18:19 21:23]); 

choice_FirstOrder_SH = choiceDelayed(:,[4:6 8:9 11:12 15:17 20 24:25]); 

choice_SecondOrder = choiceDelayed(:,[1 3:4 8 10:11 13:14 16:18 22 24]);

choice_SecondOrder_SH = choiceDelayed(:,[2 5:7 9 11:12 15 19:21 23 25]);

choice_D_NoTernary = choiceDelayed(:,[1:6 11:25]);

choice_D_MAINAD = choiceDelayed(:,1:15);

choice_D_MAINBIG = choiceDelayed(:,[1:11 21:25]);

choice_D_other = choiceDelayed(:,[1:11 16:20]);

choice_D_withinBig = choiceDelayed(:,21:25);

choice_D_withinAD = choiceDelayed(:,12:15);

choice_D_withinOther = choiceDelayed(:,16:20);

choice_D_ADBIG = choiceDelayed(:,[12:15 21:25]);

save('Time Datasets\Datasets_Time','choice_D_MAIN','choiceDelayed',...
  'choice_D_Binary', 'choice_D_MAINAD','choice_D_MAINBIG','choice_D_Big','choice_D_withinBig','choice_D_withinAD','choice_D_ADBIG');


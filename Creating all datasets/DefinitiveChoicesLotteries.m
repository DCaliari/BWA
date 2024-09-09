    clear


S = {'a','b','c','d','f1a','f1b','f1c','f1d','f2a','f2b','f2c','f2d','sa','sb','sc','sd','simple'}; %%%create a set of alternatives

outdegree = {'a','a','a','b','b','b','c','c','c','d','d','d','a','a','a','a','b','b','b','b','c','c','c','c','d','d','d','d','f1a','f1a','f1a','f1a','f1b','f1b','f1b','f1b','f1c','f1c','f1c','f1c','f1d','f1d','f1d','f1d','a','a','a','a','b','b','b','b','c','c','c','c','d','d','d','d','f2a','f2a','f2a','f2a','f2b','f2b','f2b','f2b','f2c','f2c','f2c','f2c','f2d','f2d','f2d','f2d','a','a','a','a','b','b','b','b','c','c','c','c','d','d','d','d','sa','sa','sa','sa','sb','sb','sb','sb','sc','sc','sc','sc','sd','sd','sd','sd','simple','a','simple','b','simple','c','simple','d','simple','f1a','simple','f1b','simple','f1c','simple','f1d','simple','sa','simple','sb','simple','sc','simple','sd','simple','f2d','sa','sb','sa','sc','sa','sd','sb','sc','sb','sd','sc','sd','f1a','f1b','f1a','f1c','f1a','f1d','f1b','f1c','f1b','f1d','f1c','f1d','f2a','f2b','f2a','f2c','f2a','f2d','f2b','f2c','f2b','f2d','f2c','f2d','f1a','f1b','f1c','f1d','f2d','f2d','f2d','f2d','f2a','f2b','f2d','sc','sc','sc','f1a','f1a','f1a','f1a','sa','sb','sc','sd','f1c','f1c','f1c','f1c','sa','sb','sc','sd'}; %%%outdegree and indegree for digraphs of binary relations
 
indegree = {'b','c','d','a','c','d','a','b','d','a','b','c','f1a','f1b','f1c','f1d','f1a','f1b','f1c','f1d','f1a','f1b','f1c','f1d','f1a','f1b','f1c','f1d','a','b','c','d','a','b','c','d','a','b','c','d','a','b','c','d','f2a','f2b','f2c','f2d','f2a','f2b','f2c','f2d','f2a','f2b','f2c','f2d','f2a','f2b','f2c','f2d','a','a','a','a','b','b','b','b','c','c','c','c','d','d','d','d','sa','sb','sc','sd','sa','sb','sc','sd','sa','sb','sc','sd','sa','sb','sc','sd','a','b','c','d','a','b','c','d','a','b','c','d','a','b','c','d','a','simple','b','simple','c','simple','d','simple','f1a','simple','f1b','simple','f1c','simple','f1d','simple','sa','simple','sb','simple','sc','simple','sd','simple','f2d','simple','sb','sa','sc','sa','sd','sa','sc','sb','sd','sb','sd','sc','f1b','f1a','f1c','f1a','f1d','f1a','f1c','f1b','f1d','f1b','f1d','f1c','f2b','f2a','f2c','f2a','f2d','f2a','f2c','f2b','f2d','f2b','f2d','f2c','f2d','f2d','f2d','f2d','f1a','f1b','f1c','f1d','sc','sc','sc','f2a','f2b','f2d','sa','sb','sc','sd','f1a','f1a','f1a','f1a','sa','sb','sc','sd','f1c','f1c','f1c','f1c'};


%%%load experiment choices 

[numbers, choiceLotteries, everything] = xlsread('Dataset Creation - Sep','Lotteries Choices','A2:Y146');

choice_L_MAIN = choiceLotteries(:,1:11);

choice_L_Binary = choiceLotteries(:,1:6);

choice_L_Ternary = choiceLotteries(:,7:10);

choice_L_BinTer = choiceLotteries(:,1:10);

choice_L_BinQuat = choiceLotteries(:,[1:6 11]);

choice_L_TernQuat = choiceLotteries(:,7:11);

choice_L_Big = choiceLotteries(:,12:25);

choice_L_NoBinary = choiceLotteries(:,7:25);

choice_FirstOrder_FH = choiceLotteries(:,[1:3 7 10:11 13:14 16 19:20 22:23]); 

choice_FirstOrder_SH = choiceLotteries(:,[4:6 8:9 11:12 15 17:18 21 24:25]); 

choice_SecondOrder_FH = choiceLotteries(:,[1 3:4 8 10:11 13:14 18:19 21:22 24]);

choice_SecondOrder_SH = choiceLotteries(:,[2 5:7 9 11:12 15:17 20 23 25]);

choice_L_NoTernary = choiceLotteries(:,[1:6 11:25]);

choice_L_MAINAD = choiceLotteries(:,1:15);

choice_L_MAINBIG = choiceLotteries(:,[1:11 20:25]);

choice_L_withinBig = choiceLotteries(:,20:25);

choice_L_withinAD = choiceLotteries(:,12:15);

choice_L_ADBIG = choiceLotteries(:,[12:15 20:25]);

save('Risk Datasets\Datasets_Risk','choice_L_MAIN','choiceLotteries',...
  'choice_L_Binary', 'choice_L_MAINAD','choice_L_MAINBIG','choice_L_Big','choice_L_withinBig','choice_L_withinAD','choice_L_ADBIG');



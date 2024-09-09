load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Optimal Weights\Optimal Weights Time')

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Optimal Weights\Optimal Weights Risk.mat')

load 'C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data'\OW_time_expexp.mat

load 'C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data'\OW_risk_expexp.mat

UI_OW=Unique;
EI_OW=ExpRes;
WRI_OW=MaxEntireId;
exp_OW=MaxExp;

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\UI Identification Time ALL.mat')
load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\EI Identification Time ALL.mat')
load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\WRI Identification Time ALL.mat')
load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\SET_WRI Identification Time ALL.mat')

load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\UI Identification Risk ALL.mat')
load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\EI Identification Risk ALL.mat')
load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\WRI Identification Risk ALL.mat')
load('C:\Users\caliari\Dropbox\JOB MARKET PAPER\Codes\Identification\Identification Data\SET_WRI Identification Risk ALL.mat')

UI_BR=UI_BR*145;
UI_CRP=UI_CRP*145;
UI_MS=UI_MS*145;
UI_EIG=UI_EIG*145;
UI_TC=UI_TC*145;
UI_CC=UI_CC*145;
UI_SEQ=UI_SEQ*145;
UI_TC_BR=UI_TC_BR*145;
UI_ATT_BR=UI_ATT_BR*145;
UI_ATT_MS=UI_ATT_MS*145;

EI_BR=EI_BR*145;
EI_CRP=EI_CRP*145;
EI_MS=EI_MS*145;
EI_EIG=EI_EIG*145;
EI_TC=EI_TC*145;
EI_CC=EI_CC*145;
EI_SEQ=EI_SEQ*145;
EI_TC_BR=EI_TC_BR*145;
EI_ATT_BR=EI_ATT_BR*145;
EI_ATT_MS=EI_ATT_MS*145;

WRI_BR=WRI_BR*145;
WRI_CRP=WRI_CRP*145;
WRI_MS=WRI_MS*145;
WRI_EIG=WRI_EIG*145;
WRI_TC=WRI_TC*145;
WRI_CC=WRI_CC*145;
WRI_SEQ=WRI_SEQ*145;
WRI_TC_BR=WRI_TC_BR*145;
WRI_ATT_BR=WRI_ATT_BR*145;
WRI_ATT_MS=WRI_ATT_MS*145;

exp_BR=exp_BR*145;
exp_CRP=exp_CRP*145;
exp_MS=exp_MS*145;
exp_EIG=exp_EIG*145;
exp_TC=exp_TC*145;
exp_CC=exp_CC*145;
exp_SEQ=exp_SEQ*145;
exp_TC_BR=exp_TC_BR*145;
exp_ATT_BR=exp_ATT_BR*145;
exp_ATT_MS=exp_ATT_MS*145;

EE_BR = exp_BR + EI_BR;
EE_CRP = exp_CRP + EI_CRP;
EE_MS = exp_MS + EI_MS;
EE_EIG = exp_EIG + EI_EIG;
EE_CC = exp_CC + EI_CC;
EE_TC = exp_TC + EI_TC;
EE_SEQ = exp_SEQ + EI_SEQ;
EE_TC_BR = exp_TC_BR + EI_TC_BR;
EE_ATT_BR = exp_ATT_BR + EI_ATT_BR;
EE_ATT_MS = exp_ATT_MS + EI_ATT_MS;

EE_OW = MaxExpExp;

UI_COM = [((145-UI_BR) - (145-UI_CRP))/((145-UI_BR)-(145-UI_OW));((145-UI_BR) - (145-UI_MS))/((145-UI_BR)-(145-UI_OW));((145-UI_BR) - (145-UI_EIG))/((145-UI_BR)-(145-UI_OW));...
    ((145-UI_BR) - (145-UI_TC))/((145-UI_BR)-(145-UI_OW));((145-UI_BR) - (145-UI_CC))/((145-UI_BR)-(145-UI_OW));...
    ((145-UI_BR) - (145-UI_ATT_MS))/((145-UI_BR)-(145-UI_OW));((145-UI_BR) - (145-UI_ATT_BR))/((145-UI_BR)-(145-UI_OW));...
    ((145-UI_BR) - (145-UI_TC_BR))/((145-UI_BR)-(145-UI_OW));((145-UI_BR) - (145-UI_SEQ))/((145-UI_BR)-(145-UI_OW));...
    ((145-UI_BR) - (145-UI_OW))/((145-UI_BR)-(145-UI_OW));((145-UI_BR) - (145-UI_BR))/((145-UI_BR)-(145-UI_OW))];
    
EI_COM = [((145-EI_BR) - (145-EI_CRP))/((145-EI_BR)-(145-EI_OW));((145-EI_BR) - (145-EI_MS))/((145-EI_BR)-(145-EI_OW));((145-EI_BR) - (145-EI_EIG))/((145-EI_BR)-(145-EI_OW));...
    ((145-EI_BR) - (145-EI_TC))/((145-EI_BR)-(145-EI_OW));((145-EI_BR) - (145-EI_CC))/((145-EI_BR)-(145-EI_OW));...
    ((145-EI_BR) - (145-EI_ATT_MS))/((145-EI_BR)-(145-EI_OW));((145-EI_BR) - (145-EI_ATT_BR))/((145-EI_BR)-(145-EI_OW));...
    ((145-EI_BR) - (145-EI_TC_BR))/((145-EI_BR)-(145-EI_OW));((145-EI_BR) - (145-EI_SEQ))/((145-EI_BR)-(145-EI_OW));...
    ((145-EI_BR) - (145-EI_OW))/((145-EI_BR)-(145-EI_OW));((145-EI_BR) - (145-EI_BR))/((145-EI_BR)-(145-EI_OW))];

WRI_COM = [((145-WRI_BR) - (145-WRI_CRP))/((145-WRI_BR)-(145-WRI_OW));((145-WRI_BR) - (145-WRI_MS))/((145-WRI_BR)-(145-WRI_OW));((145-WRI_BR) - (145-WRI_EIG))/((145-WRI_BR)-(145-WRI_OW));...
    ((145-WRI_BR) - (145-WRI_TC))/((145-WRI_BR)-(145-WRI_OW));((145-WRI_BR) - (145-WRI_CC))/((145-WRI_BR)-(145-WRI_OW));...
    ((145-WRI_BR) - (145-WRI_ATT_MS))/((145-WRI_BR)-(145-WRI_OW));((145-WRI_BR) - (145-WRI_ATT_BR))/((145-WRI_BR)-(145-WRI_OW));...
    ((145-WRI_BR) - (145-WRI_TC_BR))/((145-WRI_BR)-(145-WRI_OW));((145-WRI_BR) - (145-WRI_SEQ))/((145-WRI_BR)-(145-WRI_OW));...
    ((145-WRI_BR) - (145-WRI_OW))/((145-WRI_BR)-(145-WRI_OW));((145-WRI_BR) - (145-WRI_BR))/((145-WRI_BR)-(145-WRI_OW))];

exp_COM = [((145-exp_BR) - (145-exp_CRP))/((145-exp_BR)-(145-exp_OW));((145-exp_BR) - (145-exp_MS))/((145-exp_BR)-(145-exp_OW));((145-exp_BR) - (145-exp_EIG))/((145-exp_BR)-(145-exp_OW));...
    ((145-exp_BR) - (145-exp_TC))/((145-exp_BR)-(145-exp_OW));((145-exp_BR) - (145-exp_CC))/((145-exp_BR)-(145-exp_OW));...
    ((145-exp_BR) - (145-exp_ATT_MS))/((145-exp_BR)-(145-exp_OW));((145-exp_BR) - (145-exp_ATT_BR))/((145-exp_BR)-(145-exp_OW));...
    ((145-exp_BR) - (145-exp_TC_BR))/((145-exp_BR)-(145-exp_OW));((145-exp_BR) - (145-exp_SEQ))/((145-exp_BR)-(145-exp_OW));...
    ((145-exp_BR) - (145-exp_OW))/((145-exp_BR)-(145-exp_OW));((145-exp_BR) - (145-exp_BR))/((145-exp_BR)-(145-exp_OW))];

EE_COM = [((145-EE_BR) - (145-EE_CRP))/((145-EE_BR)-(145-EE_OW));((145-EE_BR) - (145-EE_MS))/((145-EE_BR)-(145-EE_OW));((145-EE_BR) - (145-EE_EIG))/((145-EE_BR)-(145-EE_OW));...
    ((145-EE_BR) - (145-EE_TC))/((145-EE_BR)-(145-EE_OW));((145-EE_BR) - (145-EE_CC))/((145-EE_BR)-(145-EE_OW));...
    ((145-EE_BR) - (145-EE_ATT_MS))/((145-EE_BR)-(145-EE_OW));((145-EE_BR) - (145-EE_ATT_BR))/((145-EE_BR)-(145-EE_OW));...
    ((145-EE_BR) - (145-EE_TC_BR))/((145-EE_BR)-(145-EE_OW));((145-EE_BR) - (145-EE_SEQ))/((145-EE_BR)-(145-EE_OW));...
    ((145-EE_BR) - (145-EE_OW))/((145-EE_BR)-(145-EE_OW));((145-EE_BR) - (145-EE_BR))/((145-EE_BR)-(145-EE_OW))];


function [D]=ReadCRMprofiles_2023(dname,fname,crmNumStr)

% example call:
% dname='/Users/pna/Dropbox (UFL)/Data/Data06_BchPrfls/STJPZ/COUNTYWIDE (R001-R209)/';
% fname='SJ9902_CON_1.PRF';
% crmNumStr='195';
% [D]=TestReadCRMprofiles_2023(dname,fname,crmNumStr)
fid=fopen([dname fname]);
j=0;
% D.exist='yes';
while ~feof(fid)
    L=fgetl(fid);
    TF=contains(L,['R-' crmNumStr]);
    RF=contains(L,['T-' crmNumStr]);
    j=j+1;
    SF=TF+RF;
    if SF>=1
%         disp(['found it: ' fname ' ' crmNumStr])
%         if strcmp(fname,'SJ1709_COE_1_mod.LID'),L,end
        D.RMid=L(1:5); D.RMdate=L(9:15); 
        D.RMnorthingSPft=L(20:30); D.RMeastingSPft=L(32:42);
        D.RMazimuth=L(44:49); D.RMelev=L(50:54);
        [D.RM_lon,D.RM_lat]=sp_proj('florida east','inverse',...
            %str2num(D.RMeastingSPft),str2num(D.RMnorthingSPft),'sf');
        [D.RM_utmE,D.RM_utmN,D.RM_utmZone]=deg2utm(D.RM_lat,D.RM_lon);
        L=fgetl(fid);
        D.SurvDateOnshore=L(9:15); D.SurvDateOffshore=L(17:23);
        D.SurvNumDataPtsTotal=L(25:28);
        D.SurvNumDataPtsOnshore=L(31:33);
        D.SurvNumDataPtsOffshore=L(34:36);
        N=[];
        for k=1:ceil(str2num(D.SurvNumDataPtsTotal)/5)
            L=fgetl(fid);
            L(isletter(L))=[];
            N=[N str2num(L)];
            x=N(1:2:end);
            z=N(2:2:end);
        end
        D.x=x;
        D.z=z;
        clear x z N
    end
end
fclose(fid);


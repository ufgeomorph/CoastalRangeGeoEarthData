close all,clearvars

% Data obtained from:
% https://floridadep.gov/rcp/beach-survey-services/content/historic-shoreline-database

%set_pna_colors;

crmNumStr='57';
dname='UnZipped_ByCounty/STJPZ/COUNTYWIDE (R001-R209)/';

fns=PRF_Files;
clrs={'brown','brick','red','magenta','purple','blue','cyan','hunter','green','spring'};
for ii=1:length(fns)
    fname=fns{ii};
    [D{ii}]=ReadCRMprofiles_2023(dname,fname,crmNumStr);
    subplot(2,1,1)
    plot(D{ii}.x,D{ii}.z,'color',eval(['color.' clrs{ii}]),'linewidth',1.5),hold on
    subplot(2,1,2)
    plot(D{ii}.x,D{ii}.z,'color',eval(['color.' clrs{ii}]),'linewidth',1.5),hold on
    set(gca,'XLim',[-200 600])
end

subplot(2,1,1),grid on
set(gca,'FontSize',14),title(['Profile at R-' crmNumStr])
ylabel('Elevation (ft)')
legend('1972','1983','1993','1999','2003','2007','2011','2017','2019')
subplot(2,1,2),grid on
set(gca,'FontSize',14),title(['Dune and Intertidal Zone View'])
xlabel('Cross Shore Position (ft)'),ylabel('Elevation (ft)')

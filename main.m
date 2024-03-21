

M = readtable('data.txt'); %Citation:https://www.mathworks.com/matlabcentral/answers/351042-how-to-read-string-data-from-a-csv-file
rows = height(M); %citation: https://www.mathworks.com/matlabcentral/answers/585476-how-can-i-run-a-for-loop-through-the-rows-of-a-table

disp("Welcome to Florida Coastal Monument Search")
%{
url = "https://www.ngs.noaa.gov/cgi-bin/ds_mark.prl?PidBox=AR1759";
options = weboptions('Timeout', 30);
code = webread(url,options);
str = extractHTMLText(code)

Iterate through str to find:
    NAD 83(2011) POSITION
    NAD 83(2011) ELLIP HT
    NAVD 88 ORTHO HEIGHT
Then locate the first proceeding numerical character
Continue loading into a substring until the first " "
Save substrings into respective arrays

ERROR: Need extractHTMLText tool for above implementation
%}

prompt = "Please enter the 3 letter code for your county/region:";
x = input(prompt)
y = "PZ";
folder = append(x,y)
disp(folder)

dirA = "UnZipped_ByCounty/";
dirB = append(dirA, folder);
dirC = "/COUNTYWIDE (R001-R209)/";
dirPath = append(dirB,dirC);
%UnZipped_ByCounty/STJPZ/COUNTYWIDE (R001-R209)/

PRF_Files = dir(dirPath)
for i = 4:length(PRF_Files)
    disp(PRF_Files(i).name)
end



%{
prompt = "To search by county type 2, to search by ID type 1";
x = input(prompt)

if (x == 1)
    prompt = "Enter monument ID in quotes: ";
    ID = input(prompt)
    M(strcmp(M.UNIQUE_ID,ID),:) %Citation: https://www.mathworks.com/matlabcentral/answers/510612-how-to-search-a-table-for-a-string
end

if (x == 2)
    prompt = "Enter county name in quotes: ";
    county = input(prompt)
    M(strcmp(M.COUNTY, county),:)
    prompt = "Enter monument ID in quotes: ";
    ID = input(prompt)
    M(strcmp(M.UNIQUE_ID,ID),:)
end

prompt = "To search within a radius, type Y in quotes. Press any number to exit.";
x  = input(prompt);
if (x == "y")
    %Radius search
end
%}
%for row = 1:rows
%    disp(M(1,1))
%end
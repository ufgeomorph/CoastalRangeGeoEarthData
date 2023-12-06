a = Monument;
a.objectID = 1;
fprintf('%i\n', a.objectID)

M = readtable('data.txt') %Citation:https://www.mathworks.com/matlabcentral/answers/351042-how-to-read-string-data-from-a-csv-file
rows = height(M); %citation: https://www.mathworks.com/matlabcentral/answers/585476-how-can-i-run-a-for-loop-through-the-rows-of-a-table

disp("Welcome to Florida Coastal Monument Search")
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

%for row = 1:rows
%    disp(M(1,1))
%end
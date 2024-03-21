disp("NGS Read")
fid = fopen("NGS.txt", "r");
fidw = fopen("NGSdata.txt", "w");
tline = fgetl(fid);

%Citation: https://stackoverflow.com/questions/45282873/search-a-text-file-for-specific-words-using-matlab-and-add-string

while ischar(tline)
    tline = strtrim(tline);
    if length(tline) >= 70 && tline(9:14) == "NAD 83" && tline(22:29) == "POSITION"
        disp(tline(32:70))
        fprintf(fidw, tline(32:70));
    end
    if length(tline) >= 70 && tline(9:14) == "NAD 83" && tline(22:26) == "ELLIP"
        disp(tline(32:70))
        fprintf(fidw, tline(32:70));
    end
    if length(tline) >= 39 && tline(9:14) == "NAD 83" && tline(22:26) == "EPOCH"
        disp(tline(32:39))
        fprintf(fidw, tline(32:39));
    end
    tline = fgetl(fid);
end

fclose(fid);
fclose(fidw);
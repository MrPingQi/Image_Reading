function image = Readimage(file)
if nargin == 0
    pathname = Getpath;
    if pathname(end)~='\' 
        pathname = [pathname,'\'];
    end
    [File, Path] = uigetfile([pathname,...
        '*.jpg;*.png;*bmp;*.gif;*.tif;*.raw'], 'Pick an image');
    if ~strcmp(Getpath,pwd)
        rmpath(Getpath);
    end
    path(path,Path);
else
    ff = fliplr(file);
    for i=1:size(ff,2)
        if ff(i) == '\'
            break;
        end
    end
    Path = file(1:end-i+1);
    File = file(end-i+2:end);
end
image = imread([Path, File]);


function p = Getpath
p = matlabpath;
pp = fliplr(p);
for i=1:size(pp,2)
    if pp(i) == ';'
        break;
    end
end
p = pp(1:i-1);
p = fliplr(p);
% Read the image from the file
 [filename, pathname] = uigetfile('*.bmp;');
img = imread(filename);
%dimensions of the image
width=32;
heigth=32;
lista=[];

for i=1:heigth %scans all the rows
%     lista=[lista;];
        for j=1:width % scans every element from the current row
            val1=blanks(8);
            for k=1:3 % scans the 3 diferent colour matrix from the file, K=1Red, K=2Green, K=3Blue
                if (k==1 || k==2) %R and G have 3 bits, so it divide the 8bit colour value to take the 3 most significant bits
                    div=32;
                else div=64; %B have 2 bits, so in this case it only takes the 2 most significant bits
                end
                
                % Catch de value from the image of the respective row, colum and matrix from the picture and transform it to binary
                valaux1=double(img(i,j,k));
                valaux2=dec2bin(valaux1/div);
                
                % adds the '0' before the most significant bits if necesary and adds the 3 RGB values one after other in the same string
                if (length(valaux2)==1 && (k==1 || k==2)) %if R or G have only 1 bit adds 2 '0' before the value
                    val1=strcat(val1,char(48),char(48),valaux2);
                elseif(length(valaux2)==2 && (k==1 || k==2) ||...
                        (k==3 && length(valaux2)==1)) %if R or G have 2 bits, or B have 1 bit adds 1'0' before the value
                    val1=strcat(val1,char(48),valaux2);
                else
                    val1=strcat(val1,valaux2); % R, G or B have the full length
                end
                    
            end
            
            % make the list with all the RGB values that will end in the memory.
            lista=[lista; val1];
            
        end
end

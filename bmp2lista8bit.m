% Read the image from the file
 [filename, pathname] = uigetfile('*.bmp;');
img = imread(filename);
%dimensiones de la imagen
width=32;
heigth=32;
lista=[];

for i=1:heigth
%     lista=[lista;];
        for j=1:width
            val1=blanks(8);
            for k=1:3
                if (k==1 || k==2)
                    div=32;
                else div=64;
                end
                valaux1=double(img(i,j,k));
                valaux2=dec2bin(valaux1/div);
                
                if (length(valaux2)==1 && (k==1 || k==2))
                    val1=strcat(val1,char(48),char(48),valaux2);
                elseif(length(valaux2)==2 && (k==1 || k==2) ||...
                        (k==3 && length(valaux2)==1))
                    val1=strcat(val1,char(48),valaux2);
                else
                    val1=strcat(val1,valaux2);
                end
                    
            end
            
             lista=[lista; val1];
            
        end
end
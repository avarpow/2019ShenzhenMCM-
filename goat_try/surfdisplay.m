function surfdisplay(serve)
load('C:\Users\16692\Desktop\数学建模\raw_data.mat');
Mag = raw_data.LogMag;
Phase = raw_data.Phase;
Mag(find(isnan(Mag))) = 0;
Phase(find(isnan(Phase))) = 0;
Mag(find(isinf(Mag))) = 0;
Phase(find(isinf(Phase))) = 0;  
y1 = raw_data.AZ(:,1);
x1 = raw_data.EL(1,:);
x = 10.^(Mag(:,:,1,serve(1))/20).*cos(Phase(:,:,1,serve(1)));
y = 10.^(Mag(:,:,1,serve(1))/20).*sin(Phase(:,:,1,serve(1)));
for i = 2 : 32
    if(serve(i) == 0) 
        continue;
    end
x = x + 10.^(Mag(:,:,i,serve(i))/20).*cos(Phase(:,:,i,serve(i)));
y = y + 10.^(Mag(:,:,i,serve(i))/20).*sin(Phase(:,:,i,serve(i)));
end
ans = (x.^2 + y.^2).^(1/2);
ans = 20 * (log10(ans));    %对于每一个特定的染色体，生成整个图像的值；
surf(x1, y1, ans);
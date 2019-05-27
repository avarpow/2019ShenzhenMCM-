function objvalue = cal_objvalue(pop)
global Phase_cos
global Phase_sin
global Mag_pow10
range_AZ_min_index=(-20+180)/5+1;%��Χˮƽ����С�߽�
range_AZ_max_index= (20+180)/5+1;%��Χˮƽ�����߽�
range_EL_min_index=(-10+90)/5+1;%��Χ��������С�߽�
range_EL_max_index= (10+90)/5+1;%��Χ���������߽�
for j = 1 : 100
mix_field_average=0;
mix_field_cos=zeros(360/5+1,180/5+1);
mix_field_sin=zeros(360/5+1,180/5+1);
mix_field_value=zeros(360/5+1,180/5+1);
    for i = 1 : 32
 %   display(j);
 %   k = pop(1,1);
 %   display(pop(j,1));
        if(pop(j,i) == 0) %���������йرյ������ֱ������
            continue;
        end
    
       k = pop(j,i);   
    mix_field_cos = mix_field_cos + Mag_pow10(:,:,i,k).*Phase_cos(:,:,i,k);%ʸ�����Ӻ���
    mix_field_sin = mix_field_sin + Mag_pow10(:,:,i,k).*Phase_sin(:,:,i,k);%ʸ����������
    end
    mix_field_value = (mix_field_cos.^2 + mix_field_sin.^2).^(1/2);%��ǿ��ֵ����dbm��λ
    %mix_field_value = 20 * (log10(mix_field_value));
    for az = range_AZ_min_index:range_AZ_max_index
        for el = range_EL_min_index:range_EL_max_index
            mix_field_average = mix_field_average + mix_field_value(az,el);
        end
    end
    mix_field_average=mix_field_average/((range_AZ_max_index-range_AZ_min_index)+1)/((range_EL_max_index-range_EL_min_index)+1);
    mix_field_average=20 * (log10(mix_field_average));%ǿ��ֵת��Ϊdbm��λ
    %display(mix_field_average);
    %display(i)
    display(mix_field_average)
     %����dbm���źŷ��ȵ����㹫ʽ�Լ�ʸ����������Ӽ�������䳤��

        %����Ȩ�أ��ص㿼�ǣ�����Ӧ�Ⱥ�������Ҫ����Ϊ���������������������������ߵ�Ȩ�ؾͺܹؼ�
    % if (ans1 < 35)  %����Ŀ�겨��һ��ҪΪ35���ϣ���Ȼ�乱�׶�˲���½����ñ��ͳһ��ʵ��
    %     bj = 0;
    % else
    %     bj = 1;
    % end
    %Ȩ�أ�50/20��
   % display(ans1);
   % display(ans2);
    objvalue(1,j) = 1000/(1+exp(-(mix_field_average-30)));%exp(mix_field_average-20);%�����ض��ĵ�һ�ʵ�����λ�ý��м��㣻

end
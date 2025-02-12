function main()
init();
process=zeros(1,50000);%统计遗传算法的进步过程
x=(1:50000);
generation=300;
popsize = 100;  %种群大小
chromlenth = 32;    %染色体长度
pc = 0.7;   %交叉概率
pm = 0.15;  %变异概率
pop = initpop(popsize, chromlenth);  %染色体处理
for i = 1:generation
    %计算适应度值（函数值）
%     if(mod(i,500)==0)
%         fp=fopen([strrep(datestr(datetime),':','-'),'.txt'],'a');
%         for k = 1:100
%             fprintf(fp,'%d ',pop(k,:));
%             fprintf(fp,'\n');
%             fprintf(fp,'%d ',objvalue(k));
%             fprintf(fp,'\n');
%             fprintf(fp,'%d ',log(objvalue(k))+20);
%             fprintf(fp,'\n');      
%         end
%         fclose(fp)
%     end
    objvalue = cal_objvalue(pop);
    fitvalue = objvalue;
    %选择操作
    newpop = selection(pop,fitvalue);
    %交叉操作
    newpop = crossover(newpop,pc);
    %变异操作
    newpop = mutation(newpop,pm);
    %更新种群
    pop = newpop;
    %寻找最优解
    [bestindividual,bestfit] = best(pop,fitvalue);
    process(i)=bestfit;
    display(bestfit);
    display(i);
    figure(3);
    plot(x(1:i),process(1:i))
end
    serve = bestindividual;
    surfdisplay(serve); %生成最优排列的图像
    save txt serve;
    display(serve);




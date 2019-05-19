function main()
clear;
clc;
clc;
clear;
popsize = 100;
chromlenth = 32;
pc = 0.7;
pm = 0.01;
pop = initpop(popsize, chromlenth);  %染色体处理
for i = 1:100
    %计算适应度值（函数值）
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
    display(bestfit);
%     x2 = binary2decimal(bestindividual);
%     x1 = binary2decimal(newpop);
%     y1 = cal_objvalue(newpop);
%     if mod(i,10) == 0
%         figure;
%         fplot('10*sin(5*x)+7*abs(x-5)+10',[0 10]);
%         hold on;
%         plot(x1,y1,'*');
%         title(['迭代次数为n=' num2str(i)]);
%         %plot(x1,y1,'*');
%     end
end
    serve = bestindividual;
    surfdisplay(serve);
    display(serve);
end



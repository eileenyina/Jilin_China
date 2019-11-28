
%计算步长
%uX=15.2;
%for a=0.06:0.1:2.5
    
a=0.6
    uX=10;%cm
    %uX=0.152;
    %uX=0.0172;
    uT=1000000;%s
    M=150;
    N=9000;
    dx=uX/M;%x的步长
    dt=uT/N;%t的步长

    x=(0:M)*dx;
    t=(0:N)*dt;
    rou=7930;
    c=500;
    K=16;
    k=K/(c*rou);
    r=k*dt/dx/dx;%步长比
    r1=1-2*r;


    %计算初值和边值
U=zeros(M+1,N+1);
for i=1:N+1
    for j=1:M+1
        U(i,j)=25;
    end;
end;
% for i=1:M+1
%     U(i,1)=37;
% end
for j=1:N+1
    U(1,j)=42;
    U(M+1,j)=25;
end
    %逐层求解
    for j=1:N
        for i=2:M
            U(i,j+1)=r*U(i-1,j)+r1*U(i,j)+r*U(i+1,j);
        end
    end
%     MM=floor(M*(0.97+a)/(1.078+a));
%     M
%     if (U(12,3300)<=44)&&(U(12,3600)<47)
%             a
%             U(12,3300)
%             U(12,3600)
%     end
%    

%end
U=U';
UU=U(1:541,1:20);
TT=U(541,:);
TTT=TT(1,[1:20]);
xxx=1:20
kk=(TTT(2)-TT(3))/(xxx(3)-xxx(2))
fai=kk*K;
faiall=20.4*fai*4*10^-3*100
%heatmap(U)
% %%figureee;
% 
% mesh(x,t,U);  
% title('温度分布图像')
% ylabel('空间变量 x')
% xlabel('时间变量 t ')
% zlabel('温度 U')
% 
%xlswrite('problem1.xlsx',U);
% ss=U(uT,:);
% plot(xxx,ss)



% imagesc(UU);
% colormap(autumn);
% colorbar
% 
% figure
plot(xxx,TTT)
hold on

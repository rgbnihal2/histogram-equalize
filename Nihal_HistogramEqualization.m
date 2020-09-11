clc;
clear;
A=imread('DAC.jpeg');
B=A(:,:,1);
subplot(2,3,1);
imshow(B)
hold on;
title('Real image(greyscale)');
hold off;
subplot(2,3,4);
histogram(B)
subplot(2,3,2);
histeq(B,247)
hold on;
title('image(histeq function)');
hold off;
subplot(2,3,5);
histogram(histeq(B,247))
hold on;
axis([0 300 0 15*10^4]);
hold off;
D=B;
[r c]=size(B);
mul=r*c;
f=1:256;
for k=1:256
    f(k)=0;
end
Q=1:225;
for k=1:256
    Q(k)=0;
end
for i = 1:r
    for j=1:c
        p=B(i,j);
        f(p+1)=f(p+1)+1;
        Q(p+1)=Q(p+1)+1;
    end
end

sum=0;
for k=1:256
    sum=sum+f(k);
end
for k=1:256
    f(k)=f(k)/sum;
end
g=1:248;
for k=1:248
    g(k)=0;
end
sum=0;
for L=1:248
    sum=sum+f(L);
    g(L)=247*sum;
    g(L)=round(g(L));
end
for i=1:r
    for j=1:c
        for k=1:248
            if (D(i,j)==k)
                D(i,j)=g(k);
                break;
            end
        end
    end
end
subplot(2,3,3);
imshow(D)
hold on;
title('Amarta');
hold off;
subplot(2,3,6);
histogram(D)
hold on;
axis([0 300 0 15*10^4]);
hold off;
A = rgb2gray(im2double(imread('RamyFA1.jpg')));
A = imresize(A, [size(A,1)/4 size(A,2)/4]);
size(A)
figure(1), imagesc(A)
[x, y] = ginput(2);
B = A(y(1):y(2), x(1):x(2));
C=normxcorr2(B, A);
%C = imfilter(A, B, 'same');
figure(2), imagesc(C), colormap gray
hold all
Y = sort(C(:), 'descend');

a=[];
b=[];
val2=[];
for i = 1:30
    [g,h]=find(Y(i)==C);
    a = [a g];
    b = [b h];
    val2 = [val2 Y(i)];
end
for i=1:30
    for j = 1:30
        if i < j
            if i<length(a) && j<length(b)
                if abs(a(i) - a(j)) < x(2)-x(1) && abs(b(i) - b(j)) < y(2)-y(1)
                    if j+1<=length(a)
                        a(j)=[]; %= [a(1:j-1) a(j+1:length(a))];
                        b(j)=[];% = [b(1:j-1) b(j+1:length(b))];
                        val2(j) = [];
                    elseif j<=length(a)
                        a = a(1:j-1);
                        b = b(1:j-1);
                    end
                end
            end
        end
    end
end
x1 = a(1:5)
y1 = b(1:5)
v1 = val2(1:5)
figure(4),hold all
scatter(a(1:5),b(1:5), 'r')

D = rgb2gray(im2double(imread('TianhuiFA2.jpg')));
D = imresize(D, [size(D,1)/4 size(D,2)/4]);
E=normxcorr2(B, D);
figure(3), imshow(E), colormap gray
hold all
Z = sort(E(:), 'descend');
a=[];
b=[];
val=[];
for i = 1:15
    [g,h]=find(Z(i)==E);
    a = [a g];
    b = [b h];
    val = [val Z(i)];
end
x2=a(1:5)
y2=b(1:5)
v2=val(1:5)
scatter(a(1:5),b(1:5))

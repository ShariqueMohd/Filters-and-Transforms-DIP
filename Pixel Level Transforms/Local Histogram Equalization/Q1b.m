im = double(rgb2gray(imread('bell.jpg')));
[N, M] = size(im);

windowSize = 101;
Im = zeros(N+windowSize-1, M+windowSize-1);
Im2 = zeros(N+windowSize-1, M+windowSize-1);

startx = (windowSize-1)/2; starty = (windowSize-1)/2;
%padding
for i=1:N
    for j=1:M
        Im(startx+i,starty+j) = im(i,j);
    end
end

for i=1+startx:N+startx
    for j=1+starty:M+starty
        Temp = zeros(windowSize, windowSize);
        for x=-startx:startx
            for y=-starty:starty
                Temp(x+startx+1, y+starty+1) = Im(i+x,j+y); 
            end
        end
        h = double(zeros(1,256)); lookup = double(zeros(1,256));
        [n, m] = size(Temp);
        d = double(1/(n*m));
        for I=1:n
            for J=1:m
                h(1, Temp(I,J)+1) = h(1, Temp(I,J)+1) + d;
            end
        end
        sum = 0.0;
        for I=1:256
            sum = sum + h(1,I);
            lookup(1,I) = double(sum * 255 + 0.5);
        end
        Im2(i,j) = lookup(1, Im(i,j)+1);
    end
end

newIm = Im2(1+startx:N+startx, 1+starty:M+starty);
imwrite(uint8(newIm),'Ex1b4.jpg');
figure, imshow(uint8(newIm));
%Check the frickin' dots
Im = double(rgb2gray(imread('bell.jpg')));
imshow(uint8(Im));
[N, M] = size(Im);

ax = 10; ay = 10;
taox = 200; taoy = 200;
newIm = zeros(2*ax+N+1, 2*ay+M+1);
for i=1:N
    for j=1:M
        xdash = uint16(i - ax*sin(2*pi*j/taox));
        ydash = uint16(j - ay*sin(2*pi*i/taoy));
        if xdash>0 && ydash>0 && xdash<N && ydash<M
            newIm(i,j) = Im(xdash+1, ydash+1);
        end
    end
end

imwrite(uint8(newIm(ax+1:ax+N-20, ay+1:ay+M-20)),'3A5.jpg');
figure, imshow(uint8(newIm(ax+1:ax+N-20, ay+1:ay+M-20)));
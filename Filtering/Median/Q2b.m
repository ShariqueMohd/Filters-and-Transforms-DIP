im = rgb2gray(imread('portraits.jpg'));
%imwrite(uint8(im),'SaltPepperNoise_gs.jpg');
imshow(im)
[N, M] = size(im);
windowSize = 5;
Im = uint8(zeros(N+windowSize-1, M+windowSize-1));
startx = uint16((windowSize-1)/2); starty = uint16((windowSize-1)/2);
%TmpSize = size(Im(startx+1:startx+N,starty+1:starty+M)); %= im(:,:);
for i=startx+1:startx+N
    for j=starty+1:starty+M
        Im(i,j) = im(i-startx,j-starty);
    end
end
newIm = zeros(N, M);

for i=1+startx:N+startx
    for j=1+starty:M+starty
        temp = uint8([]);
        for x=-startx:startx
            for y=-starty:starty
                if (i+x>0) && (i+x<N+startx+1) && (j+y>0) && (j+y<M+starty+1)
                   temp = [temp Im(i+x,j+y)]; 
                end
            end
        end
        newIm(i,j) = median(temp);
    end
end

imwrite(uint8(newIm),'2b21.jpg');
figure, imshow(uint8(newIm));
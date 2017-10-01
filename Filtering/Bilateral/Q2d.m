Im = double(rgb2gray(imread('bell.jpg')));
%imwrite(uint8(Im),'bell_gs.jpg');
[N, M] = size(Im);
newIm = zeros(N, M);
imshow(uint8(Im));

% For filter of size 3
% mask3 = zeros(3,3);
% sigma = 1;
% maskSum = 0.0;
% for i=1:3
%     for j=1:3
%         sqdx = (i-2)*(i-2); sqdy = (j-2)*(j-2);
%         mask3(i,j) = (1/(2*pi*sigma*sigma))*(exp(-1*(sqdx*sqdy)/(2*sigma*sigma)));
%         maskSum = maskSum + mask3(i,j);
%     end
% end
% 
% for i=1:N
%     for j=1:M
%         for x=-1:1
%             for y=-1:1
%                 if (i+x>0) && (i+x<N+1) && (j+y>0) && (j+y<M+1)
%                     newIm(i,j) = newIm(i,j) + Im(i+x, j+y)*mask3(x+2,y+2);
%                 end
%             end
%         end
%         newIm(i,j) = newIm(i,j)/maskSum;
%     end
% end

% For filter of size 5
% mask5 = zeros(5,5);
% sigma = 1;
% maskSum = 0.0;
% for i=1:5
%     for j=1:5
%         sqdx = (i-3)*(i-3); sqdy = (j-3)*(j-3);
%         mask5(i,j) = (1/(2*pi*sigma*sigma))*(exp(-1*(sqdx*sqdy)/(2*sigma*sigma)));
%         maskSum = maskSum + mask5(i,j);
%     end
% end
% 
% for i=1:N
%     for j=1:M
%         for x=-2:2
%             for y=-2:2
%                 if (i+x>0) && (i+x<N+1) && (j+y>0) && (j+y<M+1)
%                     newIm(i,j) = newIm(i,j) + Im(i+x, j+y)*mask5(x+3,y+3);
%                 end
%             end
%         end
%         newIm(i,j) = newIm(i,j)/maskSum;
%     end
% end

%For filter of size 8
mask8 = zeros(8, 8);
sigma = 1;
maskSum =  0.0;
for i=1:8
    for j=1:8
        sqdx = (i-4)*(i-4); sqdy = (j-4)*(j-4);
        mask8(i,j) = (1/(2*pi*sigma*sigma))*(exp(-1*(sqdx*sqdy)/(2*sigma*sigma)));
        maskSum = maskSum + mask8(i,j);
    end
end

imwrite(uint8(newIm),'Ex2a42.jpg');
figure, imshow(uint8(newIm));


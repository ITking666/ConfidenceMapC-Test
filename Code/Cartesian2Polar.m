function newImg = Cartesian2Polar(img,RadiusMatrix,ThetaMatrix)
h = size(img,1);
s=size(img);
newImg = zeros(size(RadiusMatrix));
thetaMax = max(ThetaMatrix(:));
uniqueR = unique(RadiusMatrix(:));
Rmin = uniqueR(2);
% index=1i*(diag(1:(2*h-1))*ones((2*h-1))-h*ones(2*h-1))+ones(2*h-1)*diag(1:(2*h-1))-h*ones(2*h-1); % ��ʾ���˸�������, �����󼫽�(����).
% theta=mod(-angle(index)-pi/2,pi/4); % �󼫽�(����).
% r=abs(index); % �󼫾�, ��ͼƬb������Ϊ����ԭ��.
for k=1:size(RadiusMatrix,1)
    for m=1:size(RadiusMatrix,2)
        if RadiusMatrix(k,m)-Rmin <= h && RadiusMatrix(k,m) ~= 0
            newImg(k,m,:)=img(min(h,floor(RadiusMatrix(k,m)-Rmin)+1),max(floor(s(2)*ThetaMatrix(k,m)/thetaMax),1),:); % �µ�ͼ��b��ÿһ���ԭͼ��a�Ĺ�ϵ, ����ԭͼ��ĵ�õ���.
        else
            newImg(k,m,:)= 0;  
        end
    end
end

end
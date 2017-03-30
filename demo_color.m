addpath(genpath('./'))
warning('off');
picnames = [{'abbey'},{'boardwalk'},{'burial'},{'inn'},{'phone_booth'}];

rates = [80,90];
iter = 30; % There is a inner loop whose iterNum = 10. So the number of the total iteration is going to be iter*iterNum.
sig = 9.5;

for k = 1:2
    for i = 1:5
        name = char(picnames(i));
        im = double(imread([name '.png']));
        %% Generate mask
        S = zeros(size(im));
        rand('seed',0);%rng(0);
        idx = randperm(numel(im));
        S(idx(1:floor(rates(k)/100*numel(im)))) = 1;
        S = boolean(S);
        %% Initialization
        x0 = zeros(size(S));
        for j = 1:3
            SS = S(:,:,j);
            x0(:,:,j)=gen_Init(im(:,:,j),SS);
        end
        %% MARLow
        result=init_MARLow(im,~S,x0,sig,iter);
        imwrite(result/255, ['results/' name '_'  num2str(rates(k)) '_MARLow.png']);
    end
end
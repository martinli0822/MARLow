addpath(genpath('./'))
warning('off');
picnames = [{'canyon'},{'cathedral'},{'chalet'},{'cockpit'},{'fountain'},{'ruin'},{'skyscraper'},{'village'}];
rates = [80,90];
it = 30;

for k = 1:2
    for i = 1:8
        name = char(picnames(i));
        im = imread([name '.png']);
        S = zeros(size(im));
        rand('seed',0);%rng(0);
        idx = randperm(numel(im));
        S(idx(1:floor(rates(k)/100*numel(im)))) = 1;
        S = 1-S;
        im=double(im);
        par.ori_im=im;
        par.mask=S;
        x0=gen_Init(par.ori_im,~par.mask);
        disp('-------------------------------------');
        result=init_MARLow_gray(im,S,x0,9.5,it);
        imwrite(result/255, ['results/' name '_' num2str(rates(k)) '_MARLow.png']);  
    end
end